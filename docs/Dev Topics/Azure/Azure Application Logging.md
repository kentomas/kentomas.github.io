# Azure Application Logging

## Overview

In Azure, you can access your web application logs by using Azure Monitor for Web Apps. This feature allows you to view and diagnose issues with your web app by providing access to log data such as request and response information, performance counters, and failed request traces.

You can access the logs by going to the Azure portal, navigating to your web app, and then clicking on the "Logs" blade.

You may also use Azure Log Analytics workspace to collect and analyze log data from your web app, you can also use Azure monitor to stream logs to an Event Hub or a Log Analytics workspace.

Logs can be viewed in azure using the following methods:

1. Log Stream (recommended)
2. Azure Insights
3. Web Server Storage
   1. Need to `ssh` onto server and navigate to the `*.log` file directory.

## Log Stream

By default, all loggin will be made available here. Use this method.

`Portal` > `App Services` > `Web App` > `Menu` > `Monitoring` > `Log Stream`

```cs title="C# - Sample logging that will be streamed to Log Stream in Azure" linenums="1" hl_lines="19"
using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            _logger.LogInformation("Getting list of weather forcasts.");
            return new IEnumerable<WeatherForecast>();
        }
    }
}

```

## References

- TODO
