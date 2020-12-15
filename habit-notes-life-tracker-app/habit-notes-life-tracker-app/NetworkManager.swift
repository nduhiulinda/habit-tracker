//
//  NetworkManager.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/6/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let host = "https://cs1998trackers.herokuapp.com/api"
//    static let host = "http://localhost:5000/api"
    
    static func getAllTrackers(completion: @escaping ([Tracker]) -> Void) {
        let endpoint = "\(host)/trackers/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let trackersData = try? jsonDecoder.decode(TrackerDataResponse.self, from: data) {
                    if trackersData.success {
                        let trackers = trackersData.data
                        completion(trackers)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getTracker(id: Int, completion: @escaping (Tracker) -> Void) {
        let parameters: [String: Any] = [
            "id": id
        ]
        let endpoint = "\(host)/tracker/"
        AF.request(endpoint, method: .get, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let tracker = try? jsonDecoder.decode(Tracker.self, from: data) {
                    let selectedTracker = tracker
                    completion(selectedTracker)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func addTracker(name: String, templates: [Template], completion: @escaping () -> Void) {
        let templates = templates.map { ["templateName": $0.templateName, "templateType": $0.templateType] }

        let parameters: [String: Any] = ["name": name, "templates": templates]
        print(parameters)
        let endpoint = "\(host)/trackers/"
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let _):
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
