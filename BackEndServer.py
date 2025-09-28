import requests
import re
import json

def get_workflow(prompt):
    url = "http://localhost:4111/agents/workflowAgent/generate"
    headers = {"Content-Type": "application/json"}
    data = {"prompt": prompt}
    response = requests.post(url, json=data, headers=headers)
    return response.json()

prompt = """
Generate a workflow for a hackathon app with 4 team members working in 
parallel. We have 192 hours remaining and these are the role distributions:
Max: Front end engineer
Sid: Machine learning enginener
Matt: Back end engineer
Jackson: integrator

The project description is the following: We would like to create a web application that uses images of wounds on people's bodies and uses AI to recognize the type of wound, 
and give tips on how to take care of it
"""

workflow = get_workflow(prompt)

workflow_text = workflow["text"]
lines = workflow_text.splitlines()
lines = [line.strip() for line in lines if line.strip()]
team_dict = {"Max" : [], "Sid" : [], "Matt": [], "Jackson" : []}
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