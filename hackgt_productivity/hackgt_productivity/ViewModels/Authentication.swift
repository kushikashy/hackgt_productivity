//
//  Authorization.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//
@preconcurrency import FirebaseAuth
import Observation

@Observable class AuthenticationVM {
    var errorMessage: String?
    var isLoading = false
    var isLoggedIn = false
    var currentUser: User?
    var auth: Auth
    
    init() {
        self.auth = Auth.auth()
    }
    
    
    func login(email: String, password: String) async {
        isLoading = true
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            let user = authResult.user
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.isLoggedIn = true
                print("Signed in as \(user.displayName ?? "Anonymous")")
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    func register(email: String, password: String, name: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error registering: \(error.localizedDescription)")
            } else if let user = result?.user {
                // Update the display name
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("Error setting name: \(error.localizedDescription)")
                    } else {
                        print("User registered: \(user.uid), name: \(user.displayName ?? "")")
                    }
                }
            }
        }
    }

    func signOut() {
        do {
            try auth.signOut()
            DispatchQueue.main.async {
                self.currentUser = nil
            }
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
