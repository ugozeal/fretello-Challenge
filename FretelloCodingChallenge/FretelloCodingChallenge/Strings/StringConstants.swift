//
//  StringConstants.swift
//  FretelloCodingChallenge
//
//  Created by David U. Okonkwo on 1/30/21.
//

import Foundation
import UIKit

enum StringConstants {
    static let cellId = "cellId"
    static let oops = "OOPS!!!"
    static let ok = "Ok"
    static let fatalError = "init(coder:) has not been implemented"
    static let date = "Date: "
    static let exerciseId = "Excercise Id: "
    static let exerciseName = "Excercise Name: "
    static let heartRate = "Heart Rate: "
    static let bpm = "Bpm"
    static let practisedAt = "Practiced at"
}

enum URLConstants {
    static let APIURL = "http://codingtest.fretello.com:3000/data/sessions.json"
}

enum ColorConstants {
    static let cardBgColor = UIColor(red: 0.3033310473, green: 0.2476079762, blue: 0.1968229115, alpha: 1)
    static let nameLabelColor = UIColor(red: 0.9181918502, green: 0.7447246909, blue: 0.4024956822, alpha: 1)
    static let defaultGray500 = UIColor(named: "defaultGray500")
}
