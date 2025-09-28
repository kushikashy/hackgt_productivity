//
//  APIService.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/27/25.
//

import Foundation

struct TeamMember: Codable {
    let name: String
    let skills: [String]
}

struct WorkflowResponse: Codable {
    let my_tasks: [String]
    let all_tasks: [String]
    let features: [String]
}

class APIService {
    static let shared = APIService()
    private init() {}

    func generateWorkflow(projectName: String,
                          projectType: String,
                          teamMembers: [TeamMember],
                          timeRemaining: String,
                          featureSummary: String,
                          completion: @escaping (Result<WorkflowResponse, Error>) -> Void) {

        guard let url = URL(string: "http://127.0.0.1:5000/generate_workflow") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "project_name": projectName,
            "project_type": projectType,
            "team_members": teamMembers.map { ["name": $0.name, "skills": $0.skills] },
            "time_until_hackathon": timeRemaining,
            "feature_summary": featureSummary
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let decoded = try JSONDecoder().decode(WorkflowResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
