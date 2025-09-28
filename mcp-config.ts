import { MCPClient } from "@mastra/mcp";

const mcp = new MCPClient({
  id: "shared-mcp-client", // Add unique ID to prevent conflicts
  servers: {
    // We'll add servers in the next steps
  },
});

export const mcpTools = await mcp.getTools();
export { mcp };
