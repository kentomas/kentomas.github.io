# Deploy ASP.NET Core with Angular App with Github Actions

## Overview

This article outlines the steps required to build and deploy a `ASP.NET Core with Angular App` to Azure.

## Tools

- Github: Hosts code.
- Visual Studio 2022 Community: Creates web application.
- Azure: Hosts web application on internet.
- Sourcetree: Version control of code.

## Steps

### 1. Create Repository in Github.

Log into [https://github.com](https://github.com) and create a repository.

### 2. Clone new repository locally

```ps title="Powershell"
PS> git clone ...
```

### 3. Create branches following gitflow.

1. main/develop/test

### 4. Create `ASP.NET Core with Angular` application locally.

1. Verify application works using default configuration.
2. Just use the `Start Debugging` button in Visual Studio Community.

### 5. Create `Resource Group` in Azure.

1. NOTES
   1. We'll create a Resource Group (RG) per web application for now to make management of the entire system self-contained.
2. STEPS
   1. Log into Azure Portal: [https://portal.azure.com](https://portal.azure.com).
   2. Home > Resource groups > Create
   3. Fill in details:
      1. Subscription: Pay-As-You-Go
      2. Resource Group: "Dev-RG"
      3. Region: "Australia East"
   4. Click "Review + create" button.
   5. Click "Create".
   6. Resource group "Dev-RG" is now created.

### 6. Create `App Azure App Service Plan`.

1. Home > Azure Service Plans > Create
2. Fill in details:
   1. Subscription\Resource Group: "Dev-RG"
      1. The one we created earlier.
   2. Region: "Australia East".
      1. NOTE: Set this first as Azure does some checks, and resets the fields, when this value is changed.
   3. Name: "DocNumberManager-AppServicePlan"
   4. Operating System: Linux
   5. Pricing plan: "Free F1"
   6. Click "Review + create" button.
   7. Click "Create".

### 7. Create `web app` in Azure.

1.  Home > App Services > Create.
2.  Fill in details:
    1. Basics
       1. Subscription\Resource Group: "Dev-RG"
       2. Region: "Australia East"
          1. This will automatically change the selected "Pricing Plans.
             1. The Pricing Plan should be set to "DocNumberManager-AppServicePlan".
       3. Name: "DocNumberManager-kentomas"
          1. NOTE: This name needs to be unique as it will create the website "<Name>.azurewebsites.net" (i.e. DocNumberManager-kentomas.azurewebsites.net)
       4. Publish: "Code"
       5. Runtime stack: ".NET 7 (STS)"
          1. This is confirmed by the Project within Visual Studio.
             1. Solution 'DocNumberManager' > Project 'DocNumberManager' > "Right-click" > Properties > Application > General > Target framework.
       6. Operating System: "Linux"
       7. Region: "Australia East"
       8. Linux Plan (Australia East): "DocNumberManager-AppServicePlan (F1)"
          1. Note: This should automatically be set after you select the `Runtime stack` and `Operation System`.
    2. Deployment
       1. Leave as is.
          1. We will configure this later within Github.
    3. Networking
       1. Leave as is.
    4. Monitoring
       1. Enable Application Insights: Yes
          1. 'Yes' is the default.
3.  Click "Review + Create".
4.  Click "Create".

5.  Confirm the web app is now live.
    1.  Open web browser and navigate to [https://DocNumberManager-kentomas.azurewebsites.net](https://DocNumberManager-kentomas.azurewebsites.net)

### 8. Generate deployment credentials.

1.  We'll follow the "Publish Profile" method. [Read more](https://learn.microsoft.com/en-us/azure/app-service/deploy-github-actions?tabs=applevel#generate-deployment-credentials)
2.  Steps
    1. In Azure, navigate to App Service.
       1. Home > App Services > DocNumberManager-kentomas > Overview
    2. Click on "Get publish profile" button.
       1. This will download a file called "DocNumberManager-kentomas.PublishSettings".
       2. The contents of this file will be pasted into Github as a "secret".

### 9. Create new Github secret for repo.

1. Steps
   1. Log in to [https://github.com](https://github.com).
   2. Navigate to repository "DocNumberManager".
   3. Settings > Security > Secrets and variables > Actions.
   4. Click on "New repository secret" button.
   5. Fill in the following:
      1. Name: AZURE_WEBAPP_PUBLISH_PROFILE
      2. Secret: <>
         1. Open the file "..." using notepad or vscode.
         2. Copy ALL the contents of the file.
         3. Paste the contents into this Secret field.
   6. Click "Add secret".
   7. The secret "AZURE_WEBAPP_PUBLISH_PROFILE" is now created for the repo "DocNumberManager".

### 10. Create environments

This step is OPTIONAL.

Environments production, staging, test, and development.

### 11. Create the Github Workflow.

1. Steps:
    1. On the website Github, within the repo DocNumberManager, click on "Actions".
    2. Click on "New workflow".
    3. Deployment > Deploy a .NET Core app to an Azure Web App > Configure (button)
        1. This will open a new file created in the branch 'main'.
            1. DocNumberManager/.github/workflows/azure-webapps-dotnet-core.yml
    4. Fill in the following fields:
        1. env
            1. AZURE_WEBAPP_NAME: DocNumberManager-kentomas
            2. DOTNET_VERSION: 7
            3. This is from the Visual Studio Project Properties.
    5. Remove the environment field since we did not create an Github environment. ([Read more](https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-azure/deploying-net-to-azure-app-service#creating-the-workflow))
        1. jobs > deploy > environment.
            1. Delete all the sub structures of this variable.
    6. Click "Start commit" button.
    7. A new file is now created on the `main` branch.

NOTE:

    1. This workflow will be launched after this file is created and committed into `main`.
    2. This workflow will fail because our `main` branch does not contain our web app yet.

### 12. Merge `main` branch with `develop` branch.

1. This will copy the newly created workflow file into the `develop` branch.
2. Steps:

   1. Go into SourceTree.
   2. Change branch to `main`.
   3. Pull.
   4. Change branch to `develop`.
   5. Merge `main` into `develop`.

3. Confirm the web app still works locally after the merge.
   1. Open the VS Solution.
   2. Debug app.

### 13. Create Pull Request

1.  In Github, create a Pull-Request to merge `develop` branch into `main` branch.
    1. Click on `Pull requests`.
    2. Click "Compare & pull request".
    3. Confirm the Pull request states: "... wants to merge 'x' commits into `main` from `develop`.
    4. Fill in details:
       1. Name: "Initial deployment"
       2. Description: "Initial deployment of default ASP.NET Core with Angular website."
    5. Click "Create pull request".

### 14. Complete Pull Request.

    1. Review code changes.
    2. Click "Merge pull request".
    3. Click "Confirm merge" button.

### 15. Confirm deployment

Go to website [https://docnumbermanager-ktomas.azurewebsites.net](https://docnumbermanager-ktomas.azurewebsites.net).

## Troubleshooting

### Error: Invalid version format!

```
Error: Invalid version format! Supported: 1.2.3, 1.2, 1.2.x, 1.2.*
```

```yaml title="From Github Action Summary" linenums="1"

> Run actions/setup-dotnet@v2
  with:
    dotnet-version: 7
    include-prerelease: false
  env:
    AZURE_WEBAPP_NAME: DocNumberManager-kentomas
    AZURE_WEBAPP_PACKAGE_PATH: ./DocNumberManager/
    DOTNET_VERSION: 7

Error: Invalid version format! Supported: 1.2.3, 1.2, 1.2.x, 1.2.*

```

To fix, change the DOTNET_VERSION to "7.x".

```yaml title="azure-webapps-dotnet-core.yml" linenums="1" hl_lines="8"
# FILE: DocNumberManager/.github/workflows/azure-webapps-dotnet-core.yml

name: Build and deploy ASP.Net Core app to an Azure Web App

env:
  AZURE_WEBAPP_NAME: DocNumberManager-kentomas # set this to the name of your Azure Web App
  AZURE_WEBAPP_PACKAGE_PATH: "." # set this to the path to your web app project, defaults to the repository root
  DOTNET_VERSION: "7.x" # set this to the .NET Core version to use
```

### Error: Specify a project or solution file.

This error is caused because the \*.sln file could not be found when attempting to run the CLI command `dotnet build --configuraiton Release`.

```yaml title="The error in the Github action summary" hl_lines="4"
> Run dotnet build --configuration Release
MSBuild version 17.4.1+9a89d02ff for .NET
MSBUILD : error MSB1003: Specify a project or solution file. The current working directory does not contain a project or solution file.
Error: Process completed with exit code 1.
```

To fix:

3 changes:

1. Add a `SOLUTION_PATH` variable to define the path of the soltion.
2. Update the `build` step to use this new `SOLUTION_PATH` variable.
3. Update the `publish` step to use this new `SOLUTION_PATH` variable.

```yaml title="azure-webapps-dotnet-core.yml" linenums="1" hl_lines="7 13 16"
name: Build and deploy ASP.Net Core app to an Azure Web App

env:
  AZURE_WEBAPP_NAME: DocNumberManager-kentomas # Name of your Azure Web App
  AZURE_WEBAPP_PACKAGE_PATH: "." # Path to web app project, defaults to the repository root
  DOTNET_VERSION: "7.x" # The .NET Core version to use
  SOLUTION_PATH: "./DocNumberManager/" # Directory of *.sln file

jobs:
  build:
    steps:
      - name: Build with dotnet
        run: dotnet build ${{env.SOLUTION_PATH}} --configuration Release

      - name: dotnet publish
        run: dotnet publish ${{env.SOLUTION_PATH}} -c Release -o ${{env.DOTNET_ROOT}}/myapp
```

## Don't know if we need the following..

1. ==Setup Deployments Slots in Azure?==

!!! note

    1. We want to only push to Azure after the code has been reviewed, i.e. a Pull-Request has been completed.
    2. We want to push to a test environment first before pushing to production.
          1. So we need to work out how to push to the correct Azure Slot (i.e. Production or Test).

## References

1. [https://learn.microsoft.com/en-us/azure/app-service/app-service-sql-asp-github-actions](https://learn.microsoft.com/en-us/azure/app-service/app-service-sql-asp-github-actions)
2. [https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-azure/deploying-net-to-azure-app-service](https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-azure/deploying-net-to-azure-app-service)
3. Generate Deployment Details - [https://learn.microsoft.com/en-us/azure/app-service/deploy-github-actions?tabs=applevel#generate-deployment-credentials](https://learn.microsoft.com/en-us/azure/app-service/deploy-github-actions?tabs=applevel#generate-deployment-credentials)

## Samples

### Github Workflow

```yaml title="azure-webapps-dotnet-core.yml"
# This workflow will build and push a .NET Core app to an Azure Web App when a commit is pushed to your default branch.
#
# This workflow assumes you have already created the target Azure App Service web app.
# For instructions see https://docs.microsoft.com/en-us/azure/app-service/quickstart-dotnetcore?tabs=net60&pivots=development-environment-vscode
#
# To configure this workflow:
#
# 1. Download the Publish Profile for your Azure Web App. You can download this file from the Overview page of your Web App in the Azure Portal.
#    For more information: https://docs.microsoft.com/en-us/azure/app-service/deploy-github-actions?tabs=applevel#generate-deployment-credentials
#
# 2. Create a secret in your repository named AZURE_WEBAPP_PUBLISH_PROFILE, paste the publish profile contents as the value of the secret.
#    For instructions on obtaining the publish profile see: https://docs.microsoft.com/azure/app-service/deploy-github-actions#configure-the-github-secret
#
# 3. Change the value for the AZURE_WEBAPP_NAME. Optionally, change the AZURE_WEBAPP_PACKAGE_PATH and DOTNET_VERSION environment variables below.
#
# For more information on GitHub Actions for Azure: https://github.com/Azure/Actions
# For more information on the Azure Web Apps Deploy action: https://github.com/Azure/webapps-deploy
# For more samples to get started with GitHub Action workflows to deploy to Azure: https://github.com/Azure/actions-workflow-samples

name: Build and deploy ASP.Net Core app to an Azure Web App

env:
  AZURE_WEBAPP_NAME: DocNumberManager-kentomas # set this to the name of your Azure Web App
  AZURE_WEBAPP_PACKAGE_PATH: "." # set this to the path to your web app project, defaults to the repository root
  DOTNET_VERSION: "5" # set this to the .NET Core version to use

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Set up .NET Core
        uses: actions/setup-dotnet@v2
        with:
          dotnet-version: ${{ env.DOTNET_VERSION }}

      - name: Set up dependency caching for faster builds
        uses: actions/cache@v3
        with:
          path: ~/.nuget/packages
          key: ${{ runner.os }}-nuget-${{ hashFiles('**/packages.lock.json') }}
          restore-keys: |
            ${{ runner.os }}-nuget-

      - name: Build with dotnet
        run: dotnet build --configuration Release

      - name: dotnet publish
        run: dotnet publish -c Release -o ${{env.DOTNET_ROOT}}/myapp

      - name: Upload artifact for deployment job
        uses: actions/upload-artifact@v3
        with:
          name: .net-app
          path: ${{env.DOTNET_ROOT}}/myapp

  deploy:
    permissions:
      contents: none
    runs-on: ubuntu-latest
    needs: build

    steps:
      - name: Download artifact from build job
        uses: actions/download-artifact@v3
        with:
          name: .net-app

      - name: Deploy to Azure Web App
        id: deploy-to-webapp
        uses: azure/webapps-deploy@v2
        with:
          app-name: ${{ env.AZURE_WEBAPP_NAME }}
          publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
          package: ${{ env.AZURE_WEBAPP_PACKAGE_PATH }}
```
