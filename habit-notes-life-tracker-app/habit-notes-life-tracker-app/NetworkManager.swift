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
}
