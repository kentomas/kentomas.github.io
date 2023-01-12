# Deploy an ASP.NET Web App API with Github Actions

## Outline

1.  Create Repository in Github.
2.  Clone new repository locally.
3.  Create branches following gitflow.
    1. main/develop/test
4.  Create ASP.NET Web API application locally.
    1. Verify api works using Swagger.
5.  Create Resource Group in Azure.
6.  Create App Service within created Resource Group in Azure.
    1. ==Create app service plan?==
7.  ==Setup Deployments Slots in Azure?==
8.  On Github, create a Github Action.

    1. Fill `*.yml` file using provided example.

!!! note

    1. We want to only push to Azure after the code has been reviewed, i.e. a Pull-Request has been completed.
    2. We want to push to a test environment first before pushing to production.
          1. So we need to work out how to push to the correct Azure Slot (i.e. Production or Test).

