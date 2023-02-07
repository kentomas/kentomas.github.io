# Azure Basics

## Creating a web application

> **SUMMARY:** Azure Resource Group > Azure App Service Plan > Azure Web App Service

1. Create a `Azure Resource Group`.
2. Create a `Azure Service Plan`.
   1. This will be a Linux Service Plan.
3. Create `Azure Insights` plan for web app.
4. Create `Azure Log Analytics Workspace` for web app.
5. Create a `Azure Web App Service`.

## Other

### Azure Synapse

Azure Synapse Analytics is a limitless analytics service that brings together data integration, enterprise data warehousing, and big data analytics. It gives you the freedom to query data on your terms, using either serverless or dedicated options—at scale.

Source: <https://azure.microsoft.com/en-us/products/synapse-analytics/#overview>

### Azure Logic Apps and Functions

Functions and Logic Apps are Azure services that enable serverless workloads. Azure Functions is a serverless compute service, whereas Azure Logic Apps is a serverless workflow integration platform. Both can create complex orchestrations.

Sources:

- <https://learn.microsoft.com/en-us/azure/azure-functions/functions-compare-logic-apps-ms-flow-webjobs#:~:text=Functions%20and%20Logic%20Apps%20are,Both%20can%20create%20complex%20orchestrations.>
- <https://learn.microsoft.com/en-us/azure/logic-apps/logic-apps-azure-functions?tabs=consumption>

### Azure DevOps

Azure DevOps Server is a Microsoft product that provides version control, reporting, requirements management, project management, automated builds, testing and release management capabilities.

Sources:

- <https://en.wikipedia.org/wiki/Azure_DevOps_Server>
- <https://azure.microsoft.com/en-au/products/devops/>

### Azure Service Bus

Azure Service Bus is a fully managed enterprise message broker with message queues and publish-subscribe topics (in a namespace)

Sources:

- <https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview>

### Azure Event Hub

Azure Event Hubs is a big data streaming platform and event ingestion service. It can receive and process millions of events per second.

Sources:

- <https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-about>
- <https://stackoverflow.com/questions/57740782/message-bus-vs-service-bus-vs-event-hub-vs-event-grid>
  - Azure Event Grids – Event-driven publish-subscribe model (think reactive programming)
  - Azure Event Hubs – Multiple source big data streaming pipeline (think telemetry data)
  - Azure Service Bus- Traditional enterprise broker messaging system (Similar to Azure Queue but provide many advanced features depending on use case full comparison)

## NOTES

1. In the Free Tier, we can only have (x1) Azure Service Plan (ASP).
   1. All web apps we create will have to reference this single ASP.
