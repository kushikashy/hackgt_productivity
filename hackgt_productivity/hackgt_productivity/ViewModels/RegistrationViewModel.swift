//
//  RegistrationViewModel.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/27/25.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    // Existing properties
    @Published var name: String = ""

    @Published var userL: Set<String> = []
    @Published var userS: Set<String> = []
    @Published var teammateOneL: Set<String> = []
    @Published var teammateOneS: Set<String> = []
    @Published var teammateTwoL: Set<String> = []
    @Published var teammateTwoS: Set<String> = []
    @Published var teammateThreeL: Set<String> = []
    @Published var teammateThreeS: Set<String> = []

    @Published var diff: DateComponents? = nil

    // New project details
    @Published var projectName: String = ""
    @Published var projectType: String = ""
    @Published var projectFeatures: String = ""
    @Published var endDate: Date = Date()

    func toRegistrationData() -> RegistrationData {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let formattedEndDate = dateFormatter.string(from: endDate)

        return RegistrationData(
            name: name,
            userL: Array(userL),
            userS: Array(userS),
            teammateOneL: Array(teammateOneL),
            teammateOneS: Array(teammateOneS),
            teammateTwoL: Array(teammateTwoL),
            teammateTwoS: Array(teammateTwoS),
            teammateThreeL: Array(teammateThreeL),
            teammateThreeS: Array(teammateThreeS),
            daysLeft: diff?.day,
            hoursLeft: diff?.hour,
            minutesLeft: diff?.minute,
            secondsLeft: diff?.second,
            projectName: projectName,
            projectType: projectType,
            projectFeatures: projectFeatures,
            endDate: formattedEndDate
        )
    }

    func encodeToJSONData() -> Data? {
        let registrationData = toRegistrationData()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            return try encoder.encode(registrationData)
        } catch {
            print("Failed to encode JSON: \(error)")
            return nil
        }
    }

    func saveJSONLocally() {
        guard let data = encodeToJSONData() else {
            print("❌ JSON encoding failed.")
            return
        }

        let filename = FileHelper.getFileURL()

        do {
            try data.write(to: filename)
            print("✅ JSON saved to: \(filename)")
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📝 JSON content:\n\(jsonString)")
            }
        } catch {
            print("❌ Failed to save JSON: \(error)")
        }
    }
}

