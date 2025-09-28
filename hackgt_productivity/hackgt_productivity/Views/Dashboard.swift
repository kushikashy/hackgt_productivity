
//  Dashboard.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//
import SwiftUI
import FirebaseAuth

// MARK: - CountdownView
struct CountdownView: View {
    let targetDate: Date
    @State private var now = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var timeRemaining: (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let diff = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: now, to: targetDate)
        return (diff.day ?? 0, diff.hour ?? 0, diff.minute ?? 0, diff.second ?? 0)
    }

    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text("\(timeRemaining.days)")
                    .font(.title)
                Text("Days")
                    .font(.caption)
            }
            VStack {
                Text("\(timeRemaining.hours)")
                    .font(.title)
                Text("Hours")
                    .font(.caption)
            }
            VStack {
                Text("\(timeRemaining.minutes)")
                    .font(.title)
                Text("Minutes")
                    .font(.caption)
            }
            VStack {
                Text("\(timeRemaining.seconds)")
                    .font(.title)
                Text("Seconds")
                    .font(.caption)
            }
        }
        .onReceive(timer) { input in
            now = input
        }
    }
}

// MARK: - Dashboard
struct Dashboard: View {
    @Binding var endDate: Date
    @State private var name: String = "No name set"

    @StateObject private var viewModel = ProjectViewModel()
    @State private var authVM = AuthenticationVM()
    @State private var role: String = "No role set"

    @State private var tasks: [String] = [] // dynamically loaded

    var body: some View {
        ZStack {
            Color.primaryBackground.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text(name == "No name set" ? "Dashboard" : "\(name)'s Dashboard")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 10)
                    .foregroundStyle(Color.accent)
                Text("\(role)")
                    .font(.title)
                    .foregroundStyle(Color.accent)
                    .padding(.leading, 10)

                // Countdown
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.primaryText.opacity(0.5))
                    .frame(width: 380, height: 65)
                    .overlay(
                        CountdownView(targetDate: endDate)
                            .foregroundStyle(Color.accent)
                    )

                // Tasks
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.primaryText.opacity(0.5))
                        .frame(width: 380, height: 200)
                        .overlay (
                            VStack(alignment: .leading, spacing: 10) {
                                Text("My Tasks")
                                    .font(.title2)
                                    .bold()
                                    .padding(.top, 10)
                                    .padding(.leading, 15)
                                    .foregroundStyle(Color.accent)

                                ScrollView(.vertical, showsIndicators: true) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        if tasks.isEmpty {
                                            ProgressView("Loading tasks...")
                                                .foregroundStyle(Color.accent)
                                        } else {
                                            ForEach(tasks, id: \.self) { task in
                                                Text("• \(task)")
                                                    .padding(.leading, 15)
                                                    .font(.title3)
                                                    .foregroundStyle(Color.accent)
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                                .padding(.bottom, 10)
                        )
                }

                Spacer()

                // End Project button
                NavigationLink(destination: DashboardNew(viewModel: RegistrationViewModel())) {
                    Label("End Project", systemImage: "flag.fill")
                        .font(.headline)
                        .foregroundColor(Color.accent)
                        .padding()
                        .background(Color.ourPink)
                        .cornerRadius(10)
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.projectName = "New Project Name"
                            viewModel.selectedProject = "Web App"
                            viewModel.projectFeatures = "Menu, Collab"
                            viewModel.endDate = endDate
                            viewModel.saveJSONLocally()
                        })
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .onAppear {
                if let user = Auth.auth().currentUser {
                    name = user.displayName ?? "No name set"
                }
                fetchMyTasks()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    private func fetchMyTasks() {
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
                    self.tasks = workflow.my_tasks
                case .failure(let error):
                    print("Error fetching tasks: \(error)")
                }
            }
        }
    }
}

// MARK: - Project ViewModel
class ProjectViewModel: ObservableObject {
    @Published var projectName: String = ""
    @Published var selectedProject: String = "Web App"
    @Published var projectFeatures: String = "Enter features"
    @Published var endDate: Date = Date()

    func saveJSONLocally() {
        let projectData: [String: Any] = [
            "projectName": projectName,
            "projectType": selectedProject,
            "projectFeatures": projectFeatures,
            "endDate": endDate
        ]
        print("Saved Project Data: \(projectData)")
    }
}

// MARK: - Previews
struct Dashboard_Previews: PreviewProvider {
    @State static var previewDate = Date()

    static var previews: some View {
        NavigationStack {
            Dashboard(endDate: $previewDate)
        }
    }
}

