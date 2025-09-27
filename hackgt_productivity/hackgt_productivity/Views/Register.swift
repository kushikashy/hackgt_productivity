//
//  Register.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//

import Foundation
import SwiftUI

struct Register: View {
//    @Environment(AuthenticationVM.self) private var authVM
    @State private var authVM = AuthenticationVM()
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if let errorMessage = authVM.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button("Register"){
                    authVM.register(email: email, password: password, name: name)
                }
                .padding()
                
                NavigationLink("Log in Instead") {
                    Login()
                }
            }
            .padding()
        }
    }
}

#Preview {
    Register()
}
