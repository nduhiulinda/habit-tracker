//
//  Models.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/2/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import Foundation

struct Template: Codable {
    var templateName: String
    var templateType: String
}

<<<<<<< HEAD
=======

>>>>>>> 9c49d805abe468f84ac6ad1fcf246c2b36ee34cb
struct Record: Codable {
    var detailName: String
    var detailType: String
    var detailValue: String
}

struct Day: Codable {
    var date: Date
    var records: [Record]
}

struct Tracker: Codable {
    var id: Int
    var name: String
    var templates: [Template]
    var days: [Day]
}

struct TrackManager: Codable {
    var trackers: [Tracker]
}
