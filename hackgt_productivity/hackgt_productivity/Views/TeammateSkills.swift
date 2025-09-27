//
//  TeammateSkills.swift
//  hackgt_productivity
//
//  Created by Kushi Kashyap on 9/27/25.
//
import SwiftUI

struct TeammateSkills: View {
    
    let languages = ["Swift", "Python", "Java", "JavaScript"]
    let skills = ["Front End", "Back End", "Mobile", "Data Science", "DevOps"]
    @State private var teammateOneL: Set<String> = []
    @State private var teammateOneS: Set<String> = []
    @State private var teammateTwoL: Set<String> = []
    @State private var teammateTwoS: Set<String> = []
    @State private var teammateThreeL: Set<String> = []
    @State private var teammateThreeS: Set<String> = []
    var body: some View {
        VStack {
            Text("Team Skills")
                .font(.largeTitle)
                .bold()
                .padding(.leading, 10)
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
                        .foregroundColor(teammateOneS.isEmpty ? .gray : .black)
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
                        .foregroundColor(teammateOneL.isEmpty ? .gray : .black)
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
                        .foregroundColor(teammateOneS.isEmpty ? .gray : .black)
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
                        .foregroundColor(teammateOneL.isEmpty ? .gray : .black)
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
                        .foregroundColor(teammateThreeS.isEmpty ? .gray : .black)
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
                    Text(teammateOneL.isEmpty ? "Select Teammate 1 Skills" : teammateOneL.joined(separator: ", "))
                        .foregroundColor(teammateOneL.isEmpty ? .gray : .black)
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
        .padding(.top, 20)
    }
}

#Preview {
    TeammateSkills()
}
