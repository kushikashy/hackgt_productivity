//
//  FilerHelper.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/27/25.
//

import Foundation

struct FileHelper {
    static let fileName = "current_project.json"

    static func getFileURL() -> URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)
    }

    static func createEmptyJSONFile() {
        let emptyDict: [String: String] = ["status": "new project started"]
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let data = try encoder.encode(emptyDict)
            try data.write(to: getFileURL())
            print(" Created new JSON file at \(getFileURL())")
        } catch {
            print(" Failed to create JSON file: \(error)")
        }
    }

    static func deleteJSONFile() {
        let url = getFileURL()
        do {
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
                print("Deleted JSON file at \(url)")
            }
        } catch {
            print("Failed to delete JSON file: \(error)")
        }
    }
}

