//
//  Authorization.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//
@preconcurrency import FirebaseAuth
import FirebaseFirestore
import Observation

class AuthenticationVM: ObservableObject {
    var errorMessage: String?
    var isLoading = false
    var isLoggedIn = false
    var currentUser: User?
    var auth: Auth
    var db: Firestore
    
    init() {
        self.auth = Auth.auth()
        self.db = Firestore.firestore()
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
        isLoading = true
        auth.createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    print("Error registering: \(error.localizedDescription)")
                }
                return
            }
            
            guard let user = result?.user else { return }
            
            // Update display name
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = name
            changeRequest.commitChanges { error in
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                        print("Error setting name: \(error.localizedDescription)")
                    }
                } else {
                    print("User registered: \(user.uid), name: \(user.displayName ?? "")")
                }
            }
            
            // Save extra user info (skills) in Firestore
            self.db.collection("users").document(user.uid).setData([
                "name": name,
                "email": email,
            ]) { error in
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                        print("Error saving skills: \(error.localizedDescription)")
                    }
                } else {
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                        self.currentUser = user
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
