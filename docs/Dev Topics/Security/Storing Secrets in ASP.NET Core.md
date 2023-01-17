# Safe storage of app secrets in development in ASP.NET Core

## Overview

This article highlights methods in storing secrets during web development and deployment as described in [Safe storage of app secrets in development in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/security/app-secrets?view=aspnetcore-7.0&tabs=windows&viewFallbackFrom=aspnetcore-2.2).

This document explains how to manage sensitive data for an ASP.NET Core app on a development machine. Never store passwords or other sensitive data in source code. Production secrets shouldn't be used for development or test. Secrets shouldn't be deployed with the app. Instead, production secrets should be accessed through a controlled means like environment variables or Azure Key Vault. You can store and protect Azure test and production secrets with the Azure Key Vault configuration provider.

## Reference

- [Safe storage of app secrets in development in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/security/app-secrets?view=aspnetcore-7.0&tabs=windows&viewFallbackFrom=aspnetcore-2.2)