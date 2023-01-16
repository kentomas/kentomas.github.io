# Azure Functions

## Azure Functions Overview

- The Azure Functions solution is ideal when you're concerned only with the code that's running your service and not the underlying platform or infrastructure.
  - You use Azure Functions most commonly when you need to perform work in response to an event. You do this often via a REST request, timer, or message from another Azure service, and when that work can be completed quickly, within seconds or less.
- Azure Functions is a serverless compute service.
- Azure Functions pricing is based on the number of executions and the running time of each execution.
- An Azure function is triggered by an external event or a timer. It then executes the code of the function. When hosted on a consumption plan this execution is allowed to run for 5 or 10 minutes max. When you need a longer execution time you need to run it on an App Service Plan.
- If a Function can't meet the need because of cold startup, slow scaling, or long execution time, just use an App Service.

!!! tip

    **In general**, you should use Azure Functions if you need to run code in response to specific events or triggers, and use Azure Web Apps if you need to build and deploy a full-featured web application.

## Types of Azure Function Triggers

Azure Functions supports several types of triggers, including HTTP triggers, queue triggers, and blob triggers.

## Analyze the decision criteria

- Do you need to perform an orchestration across well-known APIs?
- Do you need to execute custom algorithms or perform specialized data parsing and data lookups?
- Do you have existing automated tasks written in an imperative programming language?
  - ✅ Use Azure Functions - Easier to port your code.
  - ❌ Don't use Azure Functions - Design API orchastration using designer view tool.
- Do you prefer a visual (declarative) workflow or writing (imperative) code?

## Sample Code

### Time Triggered

This function is triggered by a TimerTrigger, set to run every 5 minutes (as specified by the cron expression "0 */5 * * * *"). It logs a message to the Azure Function's log stream using the ILogger object passed in as a parameter.

??? example

    === "C#"

    ``` cs

    using System;
    using Microsoft.Azure.WebJobs;
    using Microsoft.Azure.WebJobs.Host;
    using Microsoft.Extensions.Logging;

    namespace MyFunctionApp
    {
        public static class MyFunction
        {
            [FunctionName("MyFunction")]
            public static void Run([TimerTrigger("0 */5 * * * *")]TimerInfo myTimer, ILogger log)
            {
                log.LogInformation($"C# Timer trigger function executed at: {DateTime.Now}");
            }
        }
    }

    ```

### HTTP Triggered

This function is triggered by an HTTP request to a specific endpoint, specified by the HttpTrigger attribute. It reads the request body, extracts the name parameter and returns a response.

??? example

    === "C#"

    ``` cs

    using System.IO;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Azure.WebJobs;
    using Microsoft.Azure.WebJobs.Extensions.Http;
    using Microsoft.AspNetCore.Http;
    using Microsoft.Extensions.Logging;

    namespace MyFunctionApp
    {
        public static class MyFunction
        {
            [FunctionName("MyFunction")]
            public static IActionResult Run(
                [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
                ILogger log)
            {
                log.LogInformation("C# HTTP trigger function processed a request.");

                string name = req.Query["name"];

                string requestBody = new StreamReader(req.Body).ReadToEnd();
                dynamic data = JsonConvert.DeserializeObject(requestBody);
                name = name ?? data?.name;

                return name != null
                    ? (ActionResult)new OkObjectResult($"Hello, {name}")
                    : new BadRequestObjectResult("Please pass a name on the query string or in the request body");
            }
        }
    }

    ```

### Queue Triggered

Example is a QueueTrigger that triggers a function when a new message is added to an Azure Queue Storage.

This function is triggered when a new message is added to the "myqueue-items" queue. The message is passed in as a parameter to the function and the function can process it as needed.

??? example

    === "C#"

    ``` cs

    using System;
    using Microsoft.Azure.WebJobs;
    using Microsoft.Azure.WebJobs.Host;
    using Microsoft.Extensions.Logging;

    namespace MyFunctionApp
    {
        public static class MyFunction
        {
            [FunctionName("MyFunction")]
            public static void Run([QueueTrigger("myqueue-items")]string myQueueItem, ILogger log)
            {
                log.LogInformation($"C# Queue trigger function processed: {myQueueItem}");
            }
        }
    }

    ```

### Blob Triggered

You can also use a BlobTrigger which triggers a function when a new blob is added or an existing blob is updated in an Azure Storage Container.

??? example

    === "C#"

    ``` cs

    using System;
    using Microsoft.Azure.WebJobs;
    using Microsoft.Azure.WebJobs.Host;
    using Microsoft.Extensions.Logging;

    namespace MyFunctionApp
    {
        public static class MyFunction
        {
            [FunctionName("MyFunction")]
            public static void Run([BlobTrigger("mycontainer/{name}")]Stream myBlob, string name, ILogger log)
            {
                log.LogInformation($"C# Blob trigger function Processed blob\n Name:{name} \n Size: {myBlob.Length} Bytes");
            }
        }
    }


    ```

## References:

1. https://learn.microsoft.com/en-us/training/modules/serverless-fundamentals/
2. https://github.com/MicrosoftDocs/azure-docs/blob/main/articles/azure-functions/functions-scenario-database-table-cleanup.md
3. https://stackoverflow.com/questions/67546988/azure-app-service-plan-function-vs-app-service
