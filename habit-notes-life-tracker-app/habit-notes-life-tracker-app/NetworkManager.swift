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
    
    static let host = "http://localhost:5000/api/"
    
    static func getAllTrackers(completion: @escaping ([Tracker]) -> Void) {
        let endpoint = "\(host)/trackers/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let trackersData = try? jsonDecoder.decode(TrackManager.self, from: data) {
                    let trackers = trackersData.trackers
                    completion(trackers)
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


