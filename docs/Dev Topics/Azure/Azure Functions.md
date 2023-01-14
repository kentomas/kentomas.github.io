# Azure Functions

## Azure Functions Overview

- The Azure Functions solution is ideal when you're concerned only with the code that's running your service and not the underlying platform or infrastructure. You use Azure Functions most commonly when you need to perform work in response to an event. You do this often via a REST request, timer, or message from another Azure service, and when that work can be completed quickly, within seconds or less.
- Azure Functions is a serverless compute service.
- Azure Functions pricing is based on the number of executions and the running time of each execution.

!!! tip

    **In general**, you should use Azure Functions if you need to run code in response to specific events or triggers, and use Azure Web Apps if you need to build and deploy a full-featured web application.

## Analyze the decision criteria

- Do you need to perform an orchestration across well-known APIs?
- Do you need to execute custom algorithms or perform specialized data parsing and data lookups?
- Do you have existing automated tasks written in an imperative programming language?
    - ✅ Use Azure Functions - Easier to port your code.
    - ❌ Don't use Azure Functions - Design API orchastration using designer view tool.
- Do you prefer a visual (declarative) workflow or writing (imperative) code?



## References:

- https://learn.microsoft.com/en-us/training/modules/serverless-fundamentals/
- https://github.com/MicrosoftDocs/azure-docs/blob/main/articles/azure-functions/functions-scenario-database-table-cleanup.md
- 
