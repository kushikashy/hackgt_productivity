import requests
import re
import json

from enum import Enum
roles = {
    "front_end_dev": {"skills":["UI", "Optimization", "User Interaction"], "programming":["JavaScript", "TypeScript", "HTML/CSS", "React"]},
    "back_end_dev": {"skills":["DevOps", "Security", "API"], "programming":["Java", "Python", "Node.js", "Ruby", "SQL"]},
    "designer": {"skills":["UI", "Animation", "Design"], "programming":["Python", "HTML/CSS"]},
    "integrator": {"skills":["DevOps", "Integration", "Error Handling"], "programming":["Python", "Shell/Bash", "Docker", "Node.js"]},
    "mobile_UI": {"skills":["UI", "Animation", "Navigation"], "programming":["Swift", "Kotlin"]},
    "data_engineer": {"skills":["Data", "Storage", "Automation"], "programming":["Python", "SQL", "R"]},
    "ml_engineer": {"skills":["AI", "Data", "Evaluation"], "programming":["Python", "C++", "R"]},
    "embedded_programmer": {"skills":["Hardware", "Sensors", "Optimization"], "programming":["C", "C++", "Assembly", "Rust"]},
    "hardware_engineer":{"skills":["Circuit", "Sensors", "Power"], "programming":["C", "MATLAB"]} ,
    "physical_design": {"skills":["CAD", "Prototyping", "Physical Testing"], "programming":["MATLAB"]},
    "smart_contract_dev": {"skills":["Blockchain", "Data", "Security"], "programming":["Rust", "Go", "JavaScript"]},
    "environment_builder": {"skills":["DevOps", "Automation", "Configuration"], "programming":["C#", "C++", "Python", "JavaScript"]},
    "interaction_dev": {"skills":["UI", "Animation", "Real-Time Systems"], "programming":["JavaScript", "Python", "HTML/CSS", "C++", "C#"]},
    "cloud_architect": {"skills":["Networking", "Storage", "Monitoring"], "programming":["Node.js", "Python", "Go", "Docker", "SQL", "Kubernetes"]},
    "automation_engineer": {"skills":["DevOps", "Testing", "Version Control"], "programming":["Python", "Shell/Bash", "Node.js", "C++"]},
    }

class Project(Enum):
    Web_App = 1
    Mobile_App = 2
    Data_Manipulation = 3
    Hardware = 4
    Fintech_Blockchain = 5
    AR_VR = 6
    Cloud_DevOps = 7

class teammate:
    def __init__ (self, name, programming_languages, skills):
        self.name = name
        self.programming = programming_languages
        self.skills = skills
        self.role = ""
        self.scores = [0,0,0,0]


def updateTeammateScores(team, fourRoles):
  global roles
  for tmt in range(len(team)):
    for chosenSkill in team[tmt].skills:
      for role in range(len(fourRoles)):
        if chosenSkill in roles[fourRoles[role]]["skills"]:
          team[tmt].scores[role] += 3
  for tmt in range(len(team)):
    for chosenLanguages in team[tmt].programming:
      for role in range(len(fourRoles)):
        if chosenLanguages in roles[fourRoles[role]]["programming"]:
          team[tmt].scores[role] += 2

def assignRoleOne(team, fourRoles):
  highestScore = 0
  roleOneTeammate = ""
  for tmt in range(len(team)):
    if team[tmt].scores[0] > highestScore:
      highestScore = team[tmt].scores[0]
      roleOneTeammate = team[tmt].name
  for tmt in range(len(team)):
    if team[tmt].name == roleOneTeammate:
      team[tmt].role = fourRoles[0]
      print(team[tmt].name, team[tmt].role)
  return roleOneTeammate


def assignRoleThree(team, fourRoles, takenRole):
  highestScore = 0
  roleThreeTeammate = ""
  for tmt in range(len(team)):
    if team[tmt].scores[2] > highestScore and team[tmt].name != takenRole:
      highestScore = team[tmt].scores[2]
      roleThreeTeammate = team[tmt].name
  for tmt in range(len(team)):
    if team[tmt].name == roleThreeTeammate:
      team[tmt].role = fourRoles[2]
      print(team[tmt].name, team[tmt].role)
  return roleThreeTeammate

def assignRoleFour(team, fourRoles, takenRole1, takenRole2):
  highestScore = 0
  roleFourTeammate = ""

  for tmt in range(len(team)):
    if team[tmt].scores[3] > highestScore and team[tmt].name != takenRole1 and team[tmt].name != takenRole2:
      highestScore = team[tmt].scores[3]
      roleFourTeammate = team[tmt].name
  for tmt in range(len(team)):
    if team[tmt].name == roleFourTeammate:
      team[tmt].role = fourRoles[3]
      print(team[tmt].name, team[tmt].role)
  return roleFourTeammate

def assignRoleTwo(team, fourRoles, takenRole1, takenRole2, takenRole3):
  roleTwoTeammate = ""
  for tmt in range(len(team)):
    if team[tmt].name != takenRole1 and team[tmt].name != takenRole2 and team[tmt].name != takenRole3:
      roleTwoTeammate = team[tmt].name
  for tmt in range(len(team)):
    if team[tmt].name == roleTwoTeammate:
      team[tmt].role = fourRoles[1]
      print(team[tmt].name, team[tmt].role)
  return roleTwoTeammate


proyectType = 2
teammate1 = teammate("Sid", ["JavaScript", "TypeScript", "Python"], ["Testing","UI","Version Control"])
teammate2 = teammate("Aneesha", ["Docker", "C", "Node.js"], ["Integration","Data","Error Handling"])
teammate3 = teammate("Mauricio", ["Python", "SQL", "Docker"], ["Monitoring","Storage","DevOps"])
teammate4 = teammate("Max", ["Python", "Shell/Bash", "Java"], ["API","Security","DevOps"])
timeleft = 36*4
description = "An app that will detect injuries through a CNN and will provide insights in the severity of the illness as well as give medical advice and things to do to prevent it getting worse"

def assignTeammates(teammate1, teammate2, teammate3, teammate4, proyectType):
  # TODO: find a way to pass in the skills and languages from the app

  teamArray = [teammate1, teammate2, teammate3, teammate4]
  fourRoles = []

  # TODO: find a way to pass in the project type from the app
  project = proyectType

  if (project == Project.Web_App.value):
    fourRoles = ["front_end_dev", "designer", "back_end_dev", "integrator"]
  elif (project == Project.Mobile_App.value):
    fourRoles = ["mobile_UI", "integrator", "cloud_architect", "back_end_dev"]
  elif (project == Project.Data_Manipulation.value):
    fourRoles = ["data_engineer", "front_end_dev", "ml_engineer", "back_end_dev"]
  elif (project == Project.Hardware.value):
    fourRoles = ["hardware_engineer", "physical_design", "embedded_programmer", "integrator"]
  elif (project == Project.Fintech_Blockchain.value):
    fourRoles = ["front_end_dev", "integrator", "smart_contract_dev", "back_end_dev"]
  elif (project == Project.AR_VR.value):
    fourRoles = ["interaction_dev", "environment_builder", "back_end_dev", "integrator"]
  elif (project == Project.Cloud_DevOps.value):
    fourRoles = ["automation_engineer", "integrator", "cloud_architect", "back_end_dev"]

  updateTeammateScores(teamArray, fourRoles)
  one = assignRoleOne(teamArray, fourRoles)
  three = assignRoleThree(teamArray, fourRoles, one)
  four = assignRoleFour(teamArray, fourRoles, one, three)
  assignRoleTwo(teamArray, fourRoles, one, three, four)

def get_workflow(prompt):
    url = "http://localhost:4111/agents/workflowAgent/generate"
    headers = {"Content-Type": "application/json"}
    data = {"prompt": prompt}
    response = requests.post(url, json=data, headers=headers)
    return response.json()

assignTeammates(teammate1, teammate2, teammate3, teammate4, proyectType)

prompt = f"""
Generate a workflow for a hackathon app with 4 team members working in 
parallel. We have """ + str(timeleft) + """ hours remaining and these are the role distributions: 
""" + teammate1.name + """: """ + teammate1.role + """ """ + teammate2.name + """ : """ + teammate2.role + """ """ + teammate3.name + """: """ + teammate3.role + """ """ + teammate4.name + """: """ + teammate4.role  + """ The project description is the following: """ + description + """ """
print(prompt)
workflow = get_workflow(prompt)

workflow_text = workflow["text"]
lines = workflow_text.splitlines()
lines = [line.strip() for line in lines if line.strip()]
team_dict = {teammate1.name : [], teammate2.name : [], teammate3.name: [], teammate4.name: []}
keysList = [key for key in team_dict.keys()]
print(keysList)

teammate = 0
i = 0
keyInd = 0
for line in lines:
    print(line)

while(i < len(lines)) :
    if(keysList[keyInd] in lines[i]):
        teammate = keyInd
        keyInd += 1
        i += 1
        if(keyInd == len(keysList)):
           while(i < len(lines)):
                if("Task" in lines[i]):
                    tdict = {"id" : lines[i][4:11]}
                    tdict["title"] = lines[i][12:].replace("**", "")
                    i += 1
                elif("Hours" in lines[i]):
                    tdict["hours"] = int(lines[i][23:])
                    i += 1
                elif("Description:**" in lines[i]):
                    tdict["description"] = lines[i][18:]
                    i += 1
                elif("Priority" in lines[i]):
                    tdict["priority"] = lines[i][15:]
                    i += 1
                    team_dict[keysList[teammate]].append(tdict)
                else :
                    i += 1
        else:
            while(keysList[keyInd] not in lines[i]):
                if("Task" in lines[i]):
                    tdict = {"id" : lines[i][4:11]}
                    tdict["title"] = lines[i][12:].replace("**", "")
                    i += 1
                elif("Hours" in lines[i]):
                    tdict["hours"] = int(lines[i][23:])
                    i += 1
                elif("Description:**" in lines[i]):
                    tdict["description"] = lines[i][18:]
                    i += 1
                elif("Priority" in lines[i]):
                    tdict["priority"] = lines[i][15:]
                    i += 1
                    team_dict[keysList[teammate]].append(tdict)
                else :
                    i += 1
    else:
        i += 1
    
print(team_dict)