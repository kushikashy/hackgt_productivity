//
//  Features.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/26/25.
//

import SwiftUI

struct Features: View {
    @State private var features: [String] = []

    var body: some View {
        ZStack {
            Color.primaryBackground.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 15) {
                Text("Features")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.accent)

                if features.isEmpty {
                    Spacer()
                    ProgressView("Loading features...")
                        .foregroundStyle(Color.accent)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(features, id: \.self) { feature in
                                Text("• \(feature)")
                                    .font(.title3)
                                    .padding(.leading, 10)
                                    .foregroundStyle(Color.accent)
                            }
                        }
                        .padding(.top, 20)
                    }
                }

                Spacer()
            }
            .padding(.top, 45)
            .padding(.horizontal, 20)
            .onAppear {
                fetchFeatures()
            }
        }
    }

    private func fetchFeatures() {
        let teamMembers = [
            TeamMember(name: "User", skills: ["SwiftUI", "UI/UX"]),
            TeamMember(name: "Teammember 1", skills: ["Python", "Backend"]),
            TeamMember(name: "Teammember 2", skills: ["ML", "AI"]),
            TeamMember(name: "Teammember 3", skills: ["DevOps", "Infra"])
        ]

        APIService.shared.generateWorkflow(
            projectName: "Hackathon App",
            projectType: "Social Fitness Tracker",
            teamMembers: teamMembers,
            timeRemaining: "24h",
            featureSummary: "User authentication, activity tracking, goal setting, GPS mapping, push notifications"
        ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let workflow):
                    self.features = workflow.features
                case .failure(let error):
                    print("Error fetching features: \(error)")
                }
            }
        }
    }
}


