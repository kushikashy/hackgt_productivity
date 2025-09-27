//
//  projectDetails.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/26/25.
//

import SwiftUI
import FirebaseFirestore

struct UserModel: Identifiable, Hashable {
    var id: String // UID
    var name: String
    var email: String
}

struct projectDetails: View {
    @State private var projectName: String = ""
    @State private var selectedProject: String = "Web App"
    let projectOptions = ["Web App", "Mobile App", "AI/Data Science", "Hardware/IoT", "FinTech/Blockchain", "Web3"]
    
    @State private var projectFeatures: String = "Enter features"
    @State private var endDate = Date()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Project Name
                    HStack {
                        Text("Project Name:")
                            .font(.headline)
                            .padding(.leading, 35)
                            .padding(.trailing, 10)
                        TextField("Enter name", text: $projectName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.top, 60)
                    .frame(alignment: .leading)
                    .padding(.trailing, 25)

                    // Project Type
                    HStack {
                        Text("Project Type:")
                            .font(.headline)
                            .padding(.leading, 9)
                        Picker("Select type", selection: $selectedProject) {
                            ForEach(projectOptions, id: \.self) { type in
                                Text(type)
                            }
                        }
                        .padding(.leading)
                        .pickerStyle(MenuPickerStyle())
                    }
                    .padding(.trailing, 100)

                    // Project Features
                    VStack {
                        Text("Add your project features below:")
                            .font(.headline)
                            .padding(.leading, 35)
                        TextEditor(text: $projectFeatures)
                            .frame(width: 344, height: 200)
                            .foregroundStyle(.gray)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                    // End Date
                    VStack {
                        Text("Select Hack End Date")
                            .font(.headline)
                        DatePicker("", selection: $endDate, displayedComponents: [.date, .hourAndMinute])
                            .frame(alignment: .leading)
                            .padding(.trailing, 80)
                    }

                    // Create Project Button
                    NavigationLink(destination: TeammateSkills()) {
                        Text("Next")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding(.bottom, 100)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// SwiftUI preview
#Preview {
    projectDetails()
}
