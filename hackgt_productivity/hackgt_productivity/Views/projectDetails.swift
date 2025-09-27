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
        VStack(spacing: 20) {
            HStack {
                Text("Project Name:")
                    .font(.headline)
                    .padding(.leading, 35)
                    .padding(.trailing, 10)
                TextField("Enter name", text: $projectName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.top, 60)
            
            HStack {
                Text("Project Type: ")
                    .font(.headline)
                    .padding(.leading, 35)
                    .padding(.trailing, 50)
                Picker("Select type", selection: $selectedProject) {
                    ForEach(projectOptions, id: \.self) { type in Text(type) }
                }.padding(.trailing, 200)
            }
            
            VStack(alignment: .leading, spacing: 15) {
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
                
                // MARK: Add Teammates Section
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
                
                VStack {
                    Text("Select Hack End Date")
                        .font(.headline)
                    DatePicker(
                        "", selection: $endDate, displayedComponents: [.date, .hourAndMinute]
                    ).frame(alignment:.leading).padding(.trailing, 80)
                }.padding(.bottom, 100)
            }
        }
        .onAppear {
            fetchUsers()
        }
        Spacer()
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

#Preview {
    projectDetails()
}
