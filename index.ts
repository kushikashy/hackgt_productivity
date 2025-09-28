
import { Mastra } from '@mastra/core/mastra';
import { PinoLogger } from '@mastra/loggers';
import { LibSQLStore } from '@mastra/libsql';
import { weatherWorkflow } from './workflows/weather-workflow';
import { weatherAgent } from './agents/weather-agent';
import { financialAgent } from './agents/financial-agent';
import {workflowAgent} from './agents/workflow-agent';
import { registerApiRoute } from "@mastra/core/server";

export const mastra = new Mastra({
  agents: { workflowAgent },
  server : {
    apiRoutes: [
      registerApiRoute("/agents/workflowAgent/generate", {
        method : "POST",
        handler  : async (C) => {
          const { prompt } = await C.req.json();
          if (!prompt) {
            return C.json({ error: "No prompt provided" }, 400);
          }
          const response = await workflowAgent.generate({ role : "user", content : prompt});
          return C.json(response);
        },
      }),
    ],


  }
});

//dependency todo list
//make the mastra agent time sensitive, and make the agent
//database to store the