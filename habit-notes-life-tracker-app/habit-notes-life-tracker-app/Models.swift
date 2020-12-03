//
//  Models.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/2/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import Foundation

struct CustomizedDetail: Codable {
    var detailName: String
    var detailType: String
    var detailValue: String
}

struct Count: Codable {
    var value: Double
    var customizedDetails: [CustomizedDetail]?
}

struct Day: Codable {
    var date: Date
    var counts: [Count]
}

struct Habit: Codable {
    var id: Int
    var name: String
    var days: [Day]
}

struct HabitsDataResponse: Codable {
    var habits: [Habit]
}
