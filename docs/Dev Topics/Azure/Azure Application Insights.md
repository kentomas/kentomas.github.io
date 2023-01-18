# Azure Application Insights

## Overview

The [Microsoft.Extensions.Logging.ApplicationInsights](https://www.nuget.org/packages/Microsoft.Extensions.Logging.ApplicationInsights) provider package writes logs to [Azure Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/cloudservices). Application Insights is a service that monitors a web app and provides tools for querying and analyzing the telemetry data. If you use this provider, you can query and analyze your logs by using the Application Insights tools.

The logging provider is included as a dependency of [Microsoft.ApplicationInsights.AspNetCore](https://www.nuget.org/packages/Microsoft.ApplicationInsights.AspNetCore), which is the package that provides all available telemetry for ASP.NET Core. If you use this package, you don't have to install the provider package.

## Configuration and Usage

General Configuration Steps:

1. Open Visual Studio Community.
2. Right-click on the Web Project.
3. Select `"Configure Application Insights..."`.
4. Select `Azure Application Insights`.
5. Select Subscription.
   1. Subscript name: `Pay-As-You-Go`.
   2. Application Insights Instances: `Create new` and name it `<ApplicationName>`.
6. Use default `Connection String Name`.
7. Use default `save connection string value in` as `Local user secrets file`.
   1. Note: This file **SHOULD NOT** be checked into version control.
8. Click `Next`
9. Use defaulted selected configurations:
      1. Code
      2. NuGetPackages
      3. Project Properties
      4. Secrets Store
      5. Settings in appsettings.json
10. Click `Finish` button.
11. Click `Close` button.
12. Run Debugger.
13. In Visual Studio, click on `Application Insights(x)` toolbar button.
    1. This will show the `Search Telemetry` window within Visual Studio.
    2. In the toolbar, click on `Application Insights > Application Insights Portal` to view the data in Azure Portal.

``` cs title="C# - Program.cs" hl_lines="6"
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
builder.Services.AddApplicationInsightsTelemetry(builder.Configuration["APPLICATIONINSIGHTS_CONNECTION_STRING"]);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
```

``` json title="JSON - appsettings.json" hl_lines="10-12"
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*",
  "ApplicationInsights": {
    "ConnectionString": "InstrumentationKey=ae1cf8f6-v6a2-d3s1-8vb9-d1b117235yae;IngestionEndpoint=https://australiaeast-1.in.applicationinsights.azure.com/;LiveEndpoint=https://australiaeast.livediagnostics.monitor.azure.com/"
  }
}
```

## Is it Free?

Yes, for experimental use. In the basic pricing plan, your application can send a certain allowance of data each month free of charge. The free allowance is large enough to cover development, and publishing an app for a few users. You can set a cap to prevent more than a specified amount of data from being processed.

Larger volumes of telemetry are charged by the Gb. We provide some tips on how to [limit your charges](https://learn.microsoft.com/en-us/azure/azure-monitor/best-practices-cost#data-collection).

The Enterprise plan incurs a charge for each day that each web server node sends telemetry. It's suitable if you want to use Continuous Export on a large scale.

[Read the pricing plan](https://azure.microsoft.com/pricing/details/application-insights/).

Reference: [https://learn.microsoft.com/en-us/azure/azure-monitor/faq#application-insights](https://learn.microsoft.com/en-us/azure/azure-monitor/faq#application-insights)

## FAQ

- Should I `include` `Azure Application Insights` at the beginning of `development`? or at the end when the application is working?

  It is generally recommended to include Azure Application Insights at the beginning of development, as it can help you monitor the performance, usage, and availability of your application throughout the development process.

  By including Application Insights early on, you can catch and diagnose issues early, which can save you time and effort in the long run. You can also use the data collected by Application Insights to make decisions about the design and architecture of your application, such as which components are performing well and which need to be optimized.

  Additionally, Application Insights provides a wide range of features, including monitoring of requests and dependencies, performance profiling, and custom telemetry that can be used to track the usage of your application and identify any potential issues that may arise with the usage.

  However, if you're already in the testing or production stage, it's not too late to include Application Insights, and you can still benefit from it. It will help you to monitor the performance, usage, and availability of your application in production, and identify and diagnose issues that may arise.

  Overall, including Azure Application Insights early on in the development process can help you catch and diagnose issues early, but it can also be beneficial even if you include it later in the development process.

- How can I `reduce the cost` of using `Azure Application Insights`?

There are several ways to reduce the cost of using Azure Application Insights:

1. Use the pricing calculator: Azure provides a pricing calculator that can help you estimate the cost of using Application Insights based on your specific usage. This can help you identify areas where you can reduce costs.
2. Use the appropriate pricing tier: Application Insights has three pricing tiers: Free, Basic, and Standard. The Free tier provides basic features and is suitable for small projects, while the Basic and Standard tiers provide more advanced features and are suitable for larger projects. Choose the appropriate tier based on your needs.
3. Use sampling: Sampling is a feature that allows you to collect a subset of data, rather than all of it. This can help you reduce costs by reducing the amount of data that is stored and analyzed.
4. Use Retention policies: Retention policies allow you to control how long data is kept in the service. By reducing the retention period, you can reduce the amount of data that is stored and analyzed, which can help you reduce costs.
5. Use Metrics Explorer: Metrics Explorer is a feature that allows you to analyze metrics and performance data in real-time, and you can use it to identify and troubleshoot performance issues. You can use this feature to reduce costs by identifying and resolving performance issues before they become a problem.
6. Use Azure Monitor Workbooks: Azure Monitor Workbooks allow you to create and share interactive and customizable visualizations of your data. This can help you to identify patterns and trends in your data, which can help you reduce costs by identifying and resolving issues early.

Overall, using a combination of the above methods can help you reduce the cost of using Azure Application Insights while still gaining the insights and monitoring that you need to run your application efficiently.

- How do I set the data retention policy for Azure Insights?

Workspace-based Application Insights resources store data in a Log Analytics workspace, so it's included in the data retention and archive settings for the workspace.

> `Portal` > **`Log Analytics Workspaces`** > _`<App Log Workspace>`_ > `Menu` > `General` > **`Usage and estimate costs`** > `Data Retention (Button)`

The default retention for Application Insights resources is 90 days. You can select different retention periods for each Application Insights resource. The full set of available retention periods is 30, 60, 90, 120, 180, 270, 365, 550, or 730 days.

Reference: [https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2)

## References

- [Application Insights logging with .NET](https://learn.microsoft.com/en-us/azure/azure-monitor/app/ilogger)
- [Azure Application Insights — How not to burn money using it](https://medium.com/@beyerleinf/azure-application-insights-how-not-to-burn-money-using-it-5f1bbe5816b4)
