//
//  projectDetails.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/26/25.
//
//
//import SwiftUI
//import FirebaseFirestore
//
//struct UserModel: Identifiable, Hashable {
//    var id: String // UID
//    var name: String
//    var email: String
//}
//
//struct projectDetails: View {
//    @State private var projectName: String = ""
//    @State private var selectedProject: String = "Web App"
//    let projectOptions = ["Web App", "Mobile App", "AI/Data Science", "Hardware/IoT", "FinTech/Blockchain", "Web3"]
//    
//    @State private var projectFeatures: String = "Enter features"
//    @State private var endDate = Date()
//    
//    // MARK: Firebase users
//    @State private var allUsers: [UserModel] = []
//    @State private var selectedTeammates: Set<UserModel> = []
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            HStack {
//                Text("Project Name:")
//                    .font(.headline)
//                    .padding(.leading, 35)
//                    .padding(.trailing, 10)
//                TextField("Enter name", text: $projectName)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            }.padding(.top, 60)
//            
//            HStack {
//                Text("Project Type: ")
//                    .font(.headline)
//                    .padding(.leading, 9)
////                    .padding(.trailing, 50)
//                Picker("Select type", selection: $selectedProject) {
//                    ForEach(projectOptions, id: \.self) { type in Text(type)}
//                }.padding(.leading).pickerStyle(.menu)
//            }.padding(.trailing, 100)
//            VStack {
//                Text("Add your project features below:")
//                    .font(.headline)
//                    .padding(.leading, 35)
//                TextEditor(text: $projectFeatures)
//                    .frame(width: 344, height: 200)
//                    .foregroundStyle(.gray)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 1)
//                    )
//                    .frame(maxWidth: .infinity, alignment: .center)
//                
//                // MARK: Add Teammates Section
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Add Teammates")
//                        .font(.headline)
//                        .padding(.leading, 35)
//                    
//                    Menu {
//                        ForEach(allUsers, id: \.self) { user in
//                            Button(action: {
//                                if selectedTeammates.contains(user) {
//                                    selectedTeammates.remove(user)
//                                } else {
//                                    selectedTeammates.insert(user)
//                                }
//                            }) {
//                                HStack {
//                                    Text(user.name)
//                                    if selectedTeammates.contains(user) {
//                                        Spacer()
//                                        Image(systemName: "checkmark")
//                                    }
//                                }
//                            }
//                        }
//                    } label: {
//                        HStack {
//                            Text(selectedTeammates.isEmpty ? "Select Teammates" : selectedTeammates.map { $0.name }.joined(separator: ", "))
//                                .foregroundColor(selectedTeammates.isEmpty ? .gray : .black)
//                            Spacer()
//                            Image(systemName: "chevron.down")
//                                .foregroundColor(.gray)
//                        }
//                        .padding()
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.gray, lineWidth: 1)
//                        )
//                        .padding(.horizontal, 35)
//                    }
//                }
//                
//                VStack {
//                    Text("Select Hack End Date")
//                        .font(.headline)
//                    DatePicker(
//                        "", selection: $endDate, displayedComponents: [.date, .hourAndMinute]
////                     ).frame(alignment:.leading).padding(.trailing, 90)
////                 }.padding(.bottom, 200)
////                 NavigationView {
////                     NavigationLink(destination: Dashboard()) {
////                                             Text("Create New Project")
////                                                 .font(.headline)
////                                                 .padding()
////                                                 .background(Color.blue)
////                                                 .foregroundColor(.white)
////                                                 .cornerRadius(10)
////                                         }
////                 }
////             }
////         }.frame(maxWidth: .infinity, maxHeight: .infinity)
//                    ).frame(alignment:.leading).padding(.trailing, 80)
//                }.padding(.bottom, 100)
//            }
//        }
//        .onAppear {
//            fetchUsers()
//        }
//        NavigationView {
//                    NavigationLink(destination: Dashboard()) {
//                                            Text("Create New Project")
//                                                .font(.headline)
//                                                .padding()
//                                                .background(Color.blue)
//                                                .foregroundColor(.white)
//                                                .cornerRadius(10)
//                                        }
//                }
//            }
//        }.frame(maxWidth: .infinity, maxHeight: .infinity)
//        Spacer()
//    }
//    
//    // MARK: Fetch users from Firestore
//    func fetchUsers() {
//        let db = Firestore.firestore()
//        db.collection("users").getDocuments { snapshot, error in
//            if let documents = snapshot?.documents {
//                allUsers = documents.map { doc in
//                    let data = doc.data()
//                    return UserModel(
//                        id: doc.documentID,
//                        name: data["name"] as? String ?? "",
//                        email: data["email"] as? String ?? ""
//                    )
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    projectDetails()
//}

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
    
    // MARK: Firebase users
    @State private var allUsers: [UserModel] = []
    @State private var selectedTeammates: Set<UserModel> = []

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
                    }.padding(.top, 60)

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

                    // Add Teammates
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Add Teammates")
                            .font(.headline)
                            .padding(.leading, 35)

                        Menu {
                            ForEach(allUsers, id: \.self) { user in
                                Button(action: {
                                    if selectedTeammates.contains(user) {
                                        selectedTeammates.remove(user)
                                    } else {
                                        selectedTeammates.insert(user)
                                    }
                                }) {
                                    HStack {
                                        Text(user.name)
                                        if selectedTeammates.contains(user) {
                                            Spacer()
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedTeammates.isEmpty ? "Select Teammates" : selectedTeammates.map { $0.name }.joined(separator: ", "))
                                    .foregroundColor(selectedTeammates.isEmpty ? .gray : .black)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.horizontal, 35)
                        }
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
                    NavigationLink(destination: Dashboard(endDate: $endDate)) {
                        Text("Create New Project")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding(.bottom, 100)
                .onAppear {
                    fetchUsers()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    // MARK: Fetch users from Firestore
    func fetchUsers() {
        let db = Firestore.firestore()
        db.collection("users").getDocuments { snapshot, error in
            if let documents = snapshot?.documents {
                allUsers = documents.map { doc in
                    let data = doc.data()
                    return UserModel(
                        id: doc.documentID,
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? ""
                    )
                }
            }
        }
    }
}

// SwiftUI preview
#Preview {
    projectDetails()
}
