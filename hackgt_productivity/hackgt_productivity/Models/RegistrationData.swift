//
//  RegistrationData.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/27/25.
//

import Foundation

struct RegistrationData: Codable {
    var name: String
    
    var userL: [String]
    var userS: [String]
    var teammateOneL: [String]
    var teammateOneS: [String]
    var teammateTwoL: [String]
    var teammateTwoS: [String]
    var teammateThreeL: [String]
    var teammateThreeS: [String]

    var daysLeft: Int?
    var hoursLeft: Int?
    var minutesLeft: Int?
    var secondsLeft: Int?

    // New Fields for Project Details
    var projectName: String
    var projectType: String
    var projectFeatures: String
    var endDate: String 
}

