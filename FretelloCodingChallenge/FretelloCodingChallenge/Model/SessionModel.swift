//
//  SessionModel.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/29/21.
//

import Foundation

struct SessionModel: Codable {
    var name, practicedOnDate: String
    var exercises: [ExerciseModel]
}

struct ExerciseModel: Codable {
    var exerciseId, name: String
    var practicedAtBpm: Int
}
