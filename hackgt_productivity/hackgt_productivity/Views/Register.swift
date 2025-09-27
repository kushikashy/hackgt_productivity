//
//  Register.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//

import Foundation
import SwiftUI

struct Register: View {
    @EnvironmentObject var authVM: AuthenticationVM
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var navigateToDashboard = false

    let skills = ["Swift", "Python", "Java", "JavaScript", "AI/ML", "UI/UX", "Blockchain"]
    @State private var selectedSkills: Set<String> = []

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Multi-select dropdown
                Menu {
                    ForEach(skills, id: \.self) { skill in
                        Button(action: {
                            if selectedSkills.contains(skill) {
                                selectedSkills.remove(skill)
                            } else {
                                selectedSkills.insert(skill)
                            }
                        }) {
                            HStack {
                                Text(skill)
                                if selectedSkills.contains(skill) {
                                    Spacer()
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedSkills.isEmpty ? "Select Skills" : selectedSkills.joined(separator: ", "))
                            .foregroundColor(selectedSkills.isEmpty ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                
                // Show error if registration fails
                if let errorMessage = authVM.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button("Register") {
                    // Send selectedSkills to your VM if needed
                    authVM.register(email: email, password: password, name: name, skills: Array(selectedSkills))
                    navigateToDashboard = true
                }
                
                NavigationLink(destination: DashboardNew().navigationBarBackButtonHidden(true), isActive: $navigateToDashboard) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    Register()
}
