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
        VStack {
            NavigationStack {
                VStack {
                    Text(name == "No name set" ? "Dashboard" : "\(name)'s Dashboard")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading], 10)
                        .padding(.bottom, 5)
                        .bold()
                    NavigationLink(destination: projectDetails()) {
                                        Label("Add Project", systemImage: "plus")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                    }
                }
                Spacer()
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    DashboardNew()
}
