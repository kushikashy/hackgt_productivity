//
//  Tasks.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//

import SwiftUI

struct Tasks: View {
    @State private var myTasks: [String] = []
    @State private var allTasks: [String] = []

    @State private var isMyTasksExpanded: Bool = false
    @State private var isAllTasksExpanded: Bool = false

    var body: some View {
        ZStack {
            Color.primaryBackground.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("Tasks")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 10)
                    .foregroundStyle(Color.accent)

                collapsibleSection(
                    title: "My Tasks",
                    tasks: myTasks,
                    isExpanded: $isMyTasksExpanded
                )
                .foregroundStyle(Color.accent)

                collapsibleSection(
                    title: "All Tasks",
                    tasks: allTasks,
                    isExpanded: $isAllTasksExpanded
                )
                .foregroundStyle(Color.accent)

                Spacer()
            }
            .padding()
            .onAppear {
                fetchTasks()
            }
        }
    }

    private func fetchTasks() {
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
                    self.myTasks = workflow.my_tasks
                    self.allTasks = workflow.all_tasks
                case .failure(let error):
                    print("❌ Error fetching workflow: \(error)")
                }
            }
        }
    }

    @ViewBuilder
    private func collapsibleSection(
        title: String,
        tasks: [String],
        isExpanded: Binding<Bool>
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()

                Spacer()

                Button(action: {
                    withAnimation { isExpanded.wrappedValue.toggle() }
                }) {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isExpanded.wrappedValue ? 90 : 0))
                        .foregroundColor(.accent)
                }
                .buttonStyle(PlainButtonStyle())
            }

            if isExpanded.wrappedValue {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(tasks, id: \.self) { task in
                            Text("• \(task)")
                                .font(.title3)
                                .padding(.leading, 15)
                        }
                    }
                }
                .frame(height: 150)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .background(Color.primaryBackground)
        .cornerRadius(10)
        .shadow(radius: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.accent, lineWidth: 1)
        )
    }
}
