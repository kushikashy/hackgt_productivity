//
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
    @State private var authVM = AuthenticationVM()
    
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
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text(name == "No name set" ? "Dashboard" : "\(name)'s Dashboard")
                .font(.largeTitle)
                .bold()
                .padding(.leading, 10)
            
            // Countdown
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 380, height: 65)
                .overlay(
                    CountdownView(targetDate: endDate)
                )
            
            // Tasks
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 380, height: 200)
                    .overlay (
                        VStack(alignment: .leading, spacing: 10) {
                            Text("My Tasks")
                                .font(.title2)
                                .bold()
                                .padding(.top, 10)
                                .padding(.leading, 15)
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                VStack(alignment: .leading, spacing: 5) {
                                    ForEach(tasks, id: \.self) { task in
                                        Text("• \(task)")
                                            .padding(.leading, 15)
                                            .font(.title3)
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
            NavigationLink(destination: DashboardNew()) {
                Label("End Project", systemImage: "flag.fill")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .onAppear {
            // Safe unwrap of user display name
            if let user = Auth.auth().currentUser {
                name = user.displayName ?? "No name set"
            }
        }
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
