//
//  projectDetails.swift
//  hackgt_productivity
//
//  Created by Aditi Deshmukh on 9/26/25.
//

import SwiftUI

struct projectDetails: View {
    @State private var projectName: String = ""
    
    @State private var selectedProject: String = "Web App"
    let projectOptions = ["Web App", "Mobile App", "AI/Data Science", "Hardware/IoT", "FinTech/Blockchain", "Web3"]
    
    @State private var projectFeatures: String = "Enter features"
    
    @State private var endDate = Date()
    
    var body: some View {
        VStack {
            HStack {
                Text("Project Name:")
                    .font(.headline)
                    .padding(.leading, 35)
                    .padding(.trailing, 10)
                TextField("Enter name", text: $projectName)
            }.padding(.top, 60)
            HStack {
                Text("Project Type: ")
                    .font(.headline)
                    .padding(.leading, 9)
//                    .padding(.trailing, 50)
                Picker("Select type", selection: $selectedProject) {
                    ForEach(projectOptions, id: \.self) { type in Text(type)}
                }.padding(.leading).pickerStyle(.menu)
            }.padding(.trailing, 100)
            VStack {
                Text("Add your project features below:")
                    .font(.headline)
                    .padding(.top, 30)
                    .padding(.leading, 35)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextEditor(text: $projectFeatures)
                    .frame(width: 344, height: 200)
                    .foregroundStyle(.gray)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(style: StrokeStyle(lineWidth:1))
                            .foregroundColor(.gray)
                    )
                Spacer()
                VStack {
                    Text("Select Hack End Date")
                        .font(.headline)
                    DatePicker(
                        "", selection: $endDate, displayedComponents: [.date, .hourAndMinute]
                    ).frame(alignment:.leading).padding(.trailing, 90)
                }.padding(.bottom, 200)
                NavigationView {
                    NavigationLink(destination: Dashboard()) {
                                            Text("Create New Project")
                                                .font(.headline)
                                                .padding()
                                                .background(Color.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        Spacer()
    }
}

#Preview {
    projectDetails()
}
