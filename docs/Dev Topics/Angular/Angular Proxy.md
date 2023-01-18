# Angular Proxy

## Overview

When creating a ASP.NET Core with Angular App the file "proxy.conf.js" is created.

The `proxy.conf.js` file in an Angular project is used to configure a proxy for the development server. This allows the developer to redirect certain API requests to a separate server or mock API, rather than making actual requests to a live API. This can be useful for testing, development and prevent CORS issues. The file typically contains a target URL and a list of paths that should be proxied to that URL.

## Default

``` js title="proxy.conf.js"
const { env } = require('process');

const target = env.ASPNETCORE_HTTPS_PORT ? `https://localhost:${env.ASPNETCORE_HTTPS_PORT}` :
  env.ASPNETCORE_URLS ? env.ASPNETCORE_URLS.split(';')[0] : 'http://localhost:7410';

const PROXY_CONFIG = [
  {
    context: [
      "/weatherforecast"
   ],
    target: target,
    secure: false,
    headers: {
      Connection: 'Keep-Alive'
    }
  }
]

module.exports = PROXY_CONFIG;

```

## Example

``` js title="proxy.conf.js"
const PROXY_CONFIG = [
    {
        context: [
            "/api"
        ],
        target: "http://localhost:8080",
        secure: false
    }
]
module.exports = PROXY_CONFIG;
```

In this example, requests to URLs starting with "/api" will be redirected to "http://localhost:8080". The "secure" property is set to "false" to allow for HTTP connections, you can also set it to true to use HTTPS.

This configuration tells the Angular development server to proxy any request starting with "/api" to the target server. This allows the developer to interact with a real or mock backend during development, without having to worry about CORS issues.

You can add more context (route) to proxy to different server or mock API depending on your need.