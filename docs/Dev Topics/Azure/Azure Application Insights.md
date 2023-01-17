# Azure Application Insights

The [Microsoft.Extensions.Logging.ApplicationInsights](https://www.nuget.org/packages/Microsoft.Extensions.Logging.ApplicationInsights) provider package writes logs to [Azure Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/cloudservices). Application Insights is a service that monitors a web app and provides tools for querying and analyzing the telemetry data. If you use this provider, you can query and analyze your logs by using the Application Insights tools.

The logging provider is included as a dependency of [Microsoft.ApplicationInsights.AspNetCore](https://www.nuget.org/packages/Microsoft.ApplicationInsights.AspNetCore), which is the package that provides all available telemetry for ASP.NET Core. If you use this package, you don't have to install the provider package.

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

Reference: [Application Insights logging with .NET](https://learn.microsoft.com/en-us/azure/azure-monitor/app/ilogger)
