//
//  Dashboard.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//
//import SwiftUI
//import FirebaseAuth
//
//// MARK: - CountdownView
//struct CountdownView: View {
//    let targetDate: Date
//    @State private var now = Date()
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var timeRemaining: (days: Int, hours: Int, minutes: Int, seconds: Int) {
//        let diff = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: now, to: targetDate)
//        return (diff.day ?? 0, diff.hour ?? 0, diff.minute ?? 0, diff.second ?? 0)
//    }
//
//    var body: some View {
//        HStack(spacing: 20) {
//            VStack {
//                Text("\(timeRemaining.days)")
//                    .font(.title)
//                Text("Days")
//                    .font(.caption)
//            }
//            VStack {
//                Text("\(timeRemaining.hours)")
//                    .font(.title)
//                Text("Hours")
//                    .font(.caption)
//            }
//            VStack {
//                Text("\(timeRemaining.minutes)")
//                    .font(.title)
//                Text("Minutes")
//                    .font(.caption)
//            }
//            VStack {
//                Text("\(timeRemaining.seconds)")
//                    .font(.title)
//                Text("Seconds")
//                    .font(.caption)
//            }
//        }
//        .onReceive(timer) { input in
//            now = input
//        }
//    }
//}
//
//// MARK: - Dashboard
//struct Dashboard: View {
//    @Binding var endDate: Date
//    @State private var name: String = "No name set"
//    @State private var authVM = AuthenticationVM()
//
//    // Example tasks array
//    @State private var tasks: [String] = [
//        "Buy groceries",
//        "Finish homework",
//        "Call Alice",
//        "Read book",
//        "Meditate",
//        "Go for a walk",
//        "Finish HW"
//    ]
//    
//    var body: some View {
//        ZStack {
//            Color.primaryBackground.edgesIgnoringSafeArea(.all)
//            VStack(alignment: .leading, spacing: 20) {
//                // Title
//                Text(name == "No name set" ? "Dashboard" : "\(name)'s Dashboard")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.leading, 10)
//                    .foregroundStyle(Color.accent)
//                
//                // Countdown
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.primaryText.opacity(0.5))
//                    .frame(width: 380, height: 65)
//                    .overlay(
//                        CountdownView(targetDate: endDate)
//                            .foregroundStyle(Color.accent)
//                    )
//                
//                // Tasks
//                ZStack {
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(Color.primaryText.opacity(0.5))
//                        .frame(width: 380, height: 200)
//                        .overlay (
//                            VStack(alignment: .leading, spacing: 10) {
//                                Text("My Tasks")
//                                    .font(.title2)
//                                    .bold()
//                                    .padding(.top, 10)
//                                    .padding(.leading, 15)
//                                    .foregroundStyle(Color.accent)
//                                
//                                ScrollView(.vertical, showsIndicators: true) {
//                                    VStack(alignment: .leading, spacing: 5) {
//                                        ForEach(tasks, id: \.self) { task in
//                                            Text("• \(task)")
//                                                .padding(.leading, 15)
//                                                .font(.title3)
//                                                .foregroundStyle(Color.accent)
//                                        }
//                                    }
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                }
//                            }
//                                .padding(.bottom, 10)
//                        )
//                }
//                
//                Spacer()
//                
//                // End Project button
//                NavigationLink(destination: DashboardNew(viewModel: RegistrationViewModel())) {
//                    Label("End Project", systemImage: "flag.fill")
//                        .font(.headline)
//                        .foregroundColor(Color.accent)
//                        .padding()
//                        .background(Color.ourPink)
//                        .cornerRadius(10)
//                        .simultaneousGesture(TapGesture().onEnded {
//                            FileHelper.deleteJSONFile() // ✅ now it only runs when tapped
//                        })
//                }
//                .padding(.top, 20)
//                .frame(maxWidth: .infinity, alignment: .center)
//            }
//            .padding()
//            .onAppear {
//                // Safe unwrap of user display name
//                if let user = Auth.auth().currentUser {
//                    name = user.displayName ?? "No name set"
//                }
//            }.frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//
//    }
//}
//
//// MARK: - Previews
//struct Dashboard_Previews: PreviewProvider {
//    @State static var previewDate = Date()
//    
//    static var previews: some View {
//        NavigationStack {
//            Dashboard(endDate: $previewDate)
//        }
//    }
//}
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
    
    // MARK: - Add ViewModel here
    @StateObject private var viewModel = ProjectViewModel()  // Create and observe the view model
    @State private var authVM = AuthenticationVM()
    @State private var role: String = "No role set"
    
    // Example tasks array
    @State private var tasks: [String] = [
        "Buy groceries",
        "Finish homework",
        "Call Alice",
        "Read book",
        "Meditate",
        "Go for a walk",
        "Finish HW"
    ]
    
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
                                        ForEach(tasks, id: \.self) { task in
                                            Text("• \(task)")
                                                .padding(.leading, 15)
                                                .font(.title3)
                                                .foregroundStyle(Color.accent)
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
                NavigationLink(destination: DashboardNew(viewModel: RegistrationViewModel())) {  // Pass viewModel to DashboardNew
                    Label("End Project", systemImage: "flag.fill")
                        .font(.headline)
                        .foregroundColor(Color.accent)
                        .padding()
                        .background(Color.ourPink)
                        .cornerRadius(10)
                        .simultaneousGesture(TapGesture().onEnded {
                            // Saving data before navigation
                            viewModel.projectName = "New Project Name"  // Example, you can dynamically set this
                            viewModel.selectedProject = "Web App"  // Example, set this dynamically
                            viewModel.projectFeatures = "Menu, Collab"  // Example, set dynamically
                            viewModel.endDate = endDate  // Set end date dynamically
                            viewModel.saveJSONLocally()  // Save JSON file
//                            FileHelper.saveProjectDataToDesktop(projectName: projectName, projectType: selectedProject, projectFeatures: projectFeatures, endDate: endDate)
                        })
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .onAppear {
                // Safe unwrap of user display name
                if let user = Auth.auth().currentUser {
                    name = user.displayName ?? "No name set"
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
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
        // Your save logic here
        let projectData: [String: Any] = [
            "projectName": projectName,
            "projectType": selectedProject,
            "projectFeatures": projectFeatures,
            "endDate": endDate
        ]
        
        // Simulate saving JSON (you'd use actual file handling logic)
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
