//
//  DashboardNew.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/26/25.
//

import SwiftUI

struct DashboardNew: View {
    @State private var name: String = "No name set"
    @State private var authVM = AuthenticationVM()
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.primaryBackground.ignoresSafeArea()
                    VStack {
                        Text(name == "No name set" ? "Dashboard" : "\(name)'s Dashboard")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading], 10)
                            .padding(.bottom, 5)
                            .bold()
                            .foregroundStyle(Color.accent)
                        
                        NavigationLink(destination: TeamSkills()) {
                            Label("Add Project", systemImage: "plus")
                                .font(.headline)
                                .foregroundColor(.accent)
                                .padding()
                                .background(Color.primaryText)
                                .cornerRadius(10)
                        }
                        
                        Spacer() // put Spacer *inside* VStack to push content up
                    }
                    .padding()
                }
            }
        }
}

#Preview {
    DashboardNew()
}
