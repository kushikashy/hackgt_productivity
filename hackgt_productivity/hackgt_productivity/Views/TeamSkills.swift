//
//  TeamSkills.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/27/25.
//

//import SwiftUI
//
//struct TeamSkills: View {
//    @ObservedObject var viewModel: RegistrationViewModel
//    
//    let languages = ["Swift", "Python", "Java", "JavaScript"]
//    let skills = ["Front End", "Back End", "Mobile", "Data Science", "DevOps"]
//    
//    @State private var userL: Set<String> = []
//    @State private var userS: Set<String> = []
//    
//    @State private var teammateOneL: Set<String> = []
//    @State private var teammateOneS: Set<String> = []
//    @State private var teammateTwoL: Set<String> = []
//    @State private var teammateTwoS: Set<String> = []
//    @State private var teammateThreeL: Set<String> = []
//    @State private var teammateThreeS: Set<String> = []
//    
//    @State private var navigateToNext = false
//    
//    var body: some View {
//        Text("Team Skills")
//            .font(.largeTitle)
//            .bold()
//            .padding([.leading, .top], 15)
//            .frame(maxWidth: .infinity, alignment: .leading)
//        Text("Your Skills")
//            .font(.title3)
//            .padding(.top, 5)
//            .padding(.leading, 15)
//            .frame(maxWidth: .infinity, alignment: .leading)
//        VStack {
//            Menu {
//                ForEach(skills, id: \.self) { skill in
//                    Button(action: {
//                        if userS.contains(skill) {
//                            userS.remove(skill)
//                        } else {
//                            userS.insert(skill)
//                        }
//                    }) {
//                        HStack {
//                            Text(skill)
//                            if userS.contains(skill) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(userS.isEmpty ? "Select Your Skills" : userS.joined(separator: ", "))
//                        .foregroundColor(userS.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        VStack {
//            Menu {
//                ForEach(languages, id: \.self) { language in
//                    Button(action: {
//                        if userL.contains(language) {
//                            userL.remove(language)
//                        } else {
//                            userL.insert(language)
//                        }
//                    }) {
//                        HStack {
//                            Text(language)
//                            if userL.contains(language) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(userL.isEmpty ? "Select Your Languages" : userL.joined(separator: ", "))
//                        .foregroundColor(userL.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        Text("Teammates' Skills")
//            .font(.title3)
//            .padding(.top, 10)
//            .padding(.leading, 15)
//            .frame(maxWidth: .infinity, alignment: .leading)
//        VStack {
//            Menu {
//                ForEach(skills, id: \.self) { skill in
//                    Button(action: {
//                        if teammateOneS.contains(skill) {
//                            teammateOneS.remove(skill)
//                        } else {
//                            teammateOneS.insert(skill)
//                        }
//                    }) {
//                        HStack {
//                            Text(skill)
//                            if teammateOneS.contains(skill) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(teammateOneS.isEmpty ? "Select Teammate 1 Skills" : teammateOneS.joined(separator: ", "))
//                        .foregroundColor(teammateOneS.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        VStack {
//            Menu {
//                ForEach(languages, id: \.self) { language in
//                    Button(action: {
//                        if teammateOneL.contains(language) {
//                            teammateOneL.remove(language)
//                        } else {
//                            teammateOneL.insert(language)
//                        }
//                    }) {
//                        HStack {
//                            Text(language)
//                            if teammateOneL.contains(language) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(teammateOneL.isEmpty ? "Select Teammate 1 Languages" : teammateOneL.joined(separator: ", "))
//                        .foregroundColor(teammateOneL.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        VStack {
//            Menu {
//                ForEach(skills, id: \.self) { skill in
//                    Button(action: {
//                        if teammateTwoS.contains(skill) {
//                            teammateTwoS.remove(skill)
//                        } else {
//                            teammateTwoS.insert(skill)
//                        }
//                    }) {
//                        HStack {
//                            Text(skill)
//                            if teammateTwoS.contains(skill) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(teammateTwoS.isEmpty ? "Select Teammate 2 Skills" : teammateTwoS.joined(separator: ", "))
//                        .foregroundColor(teammateTwoS.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        VStack {
//            Menu {
//                ForEach(languages, id: \.self) { language in
//                    Button(action: {
//                        if teammateTwoL.contains(language) {
//                            teammateTwoL.remove(language)
//                        } else {
//                            teammateTwoL.insert(language)
//                        }
//                    }) {
//                        HStack {
//                            Text(language)
//                            if teammateTwoL.contains(language) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(teammateTwoL.isEmpty ? "Select Teammate 2 Languages" : teammateTwoL.joined(separator: ", "))
//                        .foregroundColor(teammateTwoL.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        VStack {
//            Menu {
//                ForEach(skills, id: \.self) { skill in
//                    Button(action: {
//                        if teammateThreeS.contains(skill) {
//                            teammateThreeS.remove(skill)
//                        } else {
//                            teammateThreeS.insert(skill)
//                        }
//                    }) {
//                        HStack {
//                            Text(skill)
//                            if teammateThreeS.contains(skill) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(teammateThreeS.isEmpty ? "Select Teammate 3 Skills" : teammateThreeS.joined(separator: ", "))
//                        .foregroundColor(teammateThreeS.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        VStack {
//            Menu {
//                ForEach(languages, id: \.self) { language in
//                    Button(action: {
//                        if teammateThreeL.contains(language) {
//                            teammateThreeL.remove(language)
//                        } else {
//                            teammateThreeL.insert(language)
//                        }
//                    }) {
//                        HStack {
//                            Text(language)
//                            if teammateThreeL.contains(language) {
//                                Spacer()
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                }
//            } label: {
//                HStack {
//                    Text(teammateThreeL.isEmpty ? "Select Teammate 3 Languages" : teammateThreeL.joined(separator: ", "))
//                        .foregroundColor(teammateThreeL.isEmpty ? .gray : .black)
//                    Spacer()
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.gray)
//                }
//                .padding()
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .frame(maxWidth: 370)
//            }
//        }
//        Spacer()
//        NavigationLink(destination: projectDetails(viewModel: viewModel)) {
//                            Text("Next")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(Color.blue)
//                                .cornerRadius(10)
//                        }
//    }
//}
//
//#Preview {
//    TeamSkills(viewModel: RegistrationViewModel())
//}

import SwiftUI

struct TeamSkills: View {
    @ObservedObject var viewModel: RegistrationViewModel
    
    let languages = ["Swift", "Python", "Java", "JavaScript"]
    let skills = ["Front End", "Back End", "Mobile", "Data Science", "DevOps"]
    
    @State private var userL: Set<String> = []
    @State private var userS: Set<String> = []
    
    @State private var teammateOneL: Set<String> = []
    @State private var teammateOneS: Set<String> = []
    @State private var teammateTwoL: Set<String> = []
    @State private var teammateTwoS: Set<String> = []
    @State private var teammateThreeL: Set<String> = []
    @State private var teammateThreeS: Set<String> = []
    
    @State private var navigateToNext = false
    
    var body: some View {
        ZStack {
            Color.primaryBackground.ignoresSafeArea()
            VStack {
                Text("Team Skills")
                    .font(.largeTitle)
                    .bold()
                    .padding([.leading, .top], 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.accent)
                Text("Your Skills")
                    .font(.title3)
                    .padding(.top, 5)
                    .padding(.leading, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.accent)
                VStack {
                    Menu {
                        ForEach(skills, id: \.self) { skill in
                            Button(action: {
                                if userS.contains(skill) {
                                    userS.remove(skill)
                                } else {
                                    userS.insert(skill)
                                }
                            }) {
                                HStack {
                                    Text(skill)
                                    if userS.contains(skill) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(userS.isEmpty ? "Select Your Skills" : userS.joined(separator: ", "))
                                .foregroundColor(userS.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                VStack {
                    Menu {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                if userL.contains(language) {
                                    userL.remove(language)
                                } else {
                                    userL.insert(language)
                                }
                            }) {
                                HStack {
                                    Text(language)
                                    if userL.contains(language) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(userL.isEmpty ? "Select Your Languages" : userL.joined(separator: ", "))
                                .foregroundColor(userL.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                Text("Teammates' Skills")
                    .font(.title3)
                    .padding(.top, 10)
                    .padding(.leading, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.accent)
                VStack {
                    Menu {
                        ForEach(skills, id: \.self) { skill in
                            Button(action: {
                                if teammateOneS.contains(skill) {
                                    teammateOneS.remove(skill)
                                } else {
                                    teammateOneS.insert(skill)
                                }
                            }) {
                                HStack {
                                    Text(skill)
                                    if teammateOneS.contains(skill) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(teammateOneS.isEmpty ? "Select Teammate 1 Skills" : teammateOneS.joined(separator: ", "))
                                .foregroundColor(teammateOneS.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                VStack {
                    Menu {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                if teammateOneL.contains(language) {
                                    teammateOneL.remove(language)
                                } else {
                                    teammateOneL.insert(language)
                                }
                            }) {
                                HStack {
                                    Text(language)
                                    if teammateOneL.contains(language) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(teammateOneL.isEmpty ? "Select Teammate 1 Languages" : teammateOneL.joined(separator: ", "))
                                .foregroundColor(teammateOneL.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                VStack {
                    Menu {
                        ForEach(skills, id: \.self) { skill in
                            Button(action: {
                                if teammateTwoS.contains(skill) {
                                    teammateTwoS.remove(skill)
                                } else {
                                    teammateTwoS.insert(skill)
                                }
                            }) {
                                HStack {
                                    Text(skill)
                                    if teammateTwoS.contains(skill) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(teammateTwoS.isEmpty ? "Select Teammate 2 Skills" : teammateTwoS.joined(separator: ", "))
                                .foregroundColor(teammateOneS.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                VStack {
                    Menu {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                if teammateTwoL.contains(language) {
                                    teammateTwoL.remove(language)
                                } else {
                                    teammateTwoL.insert(language)
                                }
                            }) {
                                HStack {
                                    Text(language)
                                    if teammateTwoL.contains(language) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(teammateTwoL.isEmpty ? "Select Teammate 2 Languages" : teammateTwoL.joined(separator: ", "))
                                .foregroundColor(teammateTwoL.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                VStack {
                    Menu {
                        ForEach(skills, id: \.self) { skill in
                            Button(action: {
                                if teammateThreeS.contains(skill) {
                                    teammateThreeS.remove(skill)
                                } else {
                                    teammateThreeS.insert(skill)
                                }
                            }) {
                                HStack {
                                    Text(skill)
                                    if teammateThreeS.contains(skill) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(teammateThreeS.isEmpty ? "Select Teammate 3 Skills" : teammateThreeS.joined(separator: ", "))
                                .foregroundColor(teammateThreeS.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                VStack {
                    Menu {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                if teammateThreeL.contains(language) {
                                    teammateThreeL.remove(language)
                                } else {
                                    teammateThreeL.insert(language)
                                }
                            }) {
                                HStack {
                                    Text(language)
                                    if teammateThreeL.contains(language) {
                                        Spacer()
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(teammateThreeL.isEmpty ? "Select Teammate 3 Languages" : teammateThreeL.joined(separator: ", "))
                                .foregroundColor(teammateThreeL.isEmpty ? .gray : .accent)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(maxWidth: 370)
                    }
                }
                Spacer()
//                NavigationLink(destination: projectDetails(viewModel: RegistrationViewModel())) {
//                    Text("Next")
//                        .font(.headline)
//                        .foregroundColor(.accent)
//                        .padding()
//                        .background(Color.primaryText)
//                        .cornerRadius(10)
//                }
                Button(action: {
                    syncToViewModel()
                    goToNext = true
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.accent)
                        .padding()
                        .background(Color.primaryText)
                        .cornerRadius(10)
                }
            }
        }
//        Spacer()
//        Button(action: {
//            syncToViewModel()
//            goToNext = true
//        }) {
//            Text("Next")
//                .font(.headline)
//                .foregroundColor(.accent)
//                .padding()
//                .background(Color.primaryText)
//                .cornerRadius(10)
//        }

        // NavigationLink to projectDetails
        NavigationLink(destination: projectDetails(viewModel: viewModel), isActive: $goToNext) {
            EmptyView()
        }
    }
    @State private var goToNext = false
    private func syncToViewModel() {
        viewModel.userL = userL
        viewModel.userS = userS
        viewModel.teammateOneL = teammateOneL
        viewModel.teammateOneS = teammateOneS
        viewModel.teammateTwoL = teammateTwoL
        viewModel.teammateTwoS = teammateTwoS
        viewModel.teammateThreeL = teammateThreeL
        viewModel.teammateThreeS = teammateThreeS
    }
}

#Preview {
    TeamSkills(viewModel: RegistrationViewModel())
}
