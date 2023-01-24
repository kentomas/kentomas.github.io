# Adding Google Authentication in ASP.NET Core

## Overview

## Steps

### 1.0 Create the Google OAuth 2.0 Client ID and secret

#### 1.1 Create API and Services Project

1. Open the Credentials page of the [Google APIs console](https://console.cloud.google.com/apis).
2. In the right-hand-side click on `Create Project`.
    1. Fill in details.

#### 1.2 Create OAuth 2.0 Client IDs

1. Open the Credentials page of the [Google APIs console](https://console.cloud.google.com/apis).
2. Select `"Project"`.
3. Select `Credentials`.
4. Create `OAuth client ID`.
    1. `Menu` > `APIs & Services` > `Credentials` > `Create Credentials` > `OAuth client ID`.
5. Set the following values:
    1. `Application Type`: Web application
    2. `Name`: DocNumManager
    3. `Authorized JavaScript origins`
        1. `URI 1`: <https://localhost>
        2. `URI 2`: <https://localhost:44488>
    4. `Authorized redirect URIs`
        1. `URI`: <https://localhost:44488/signin-google>
6. Click `Create` button.
7. Copy the generated `ClientID` and `Client Secret`.
   1. Select `Download as JSON` if required.
   2. ClientID: 481633462268-n4gctrj2vdmeqgcrkiin5q8ac84pkkte.apps.googleusercontent.com
   3. Client Secret: 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

!!! tip

    Key Point: Add both `http://localhost` and `http://localhost:<port_number`> to the Authorized JavaScript origins box for local tests or development.

### Create OAuth consent screen

The consent screen provides a better user experience as they will be informed on the website who is connecting.

The consent screen is per project, essentially... per website.

1. Open the Credentials page of the [Google APIs console](https://console.cloud.google.com/apis).
2. Select `"Project"`.
3. Select `OAuth consent screen`
4. Select `Create`
5. Fill in details:
    1. `App Information`
        1. `App name`: DocNumberManager
        2. `User support email`: support@gmail.com
    2. `App Domain`
        1. `Application home page`: <https://localhost:44488>
        2. `Application privacy policy link`: <https://localhost:44488/privacy>
        3. `Application terms of service link`: <https://localhost:44488/termsofservice>
    3. `Developer Contact Information`
        1. `Email addresses`: developer@gmail.com
6. Click `Save and Continue` button.

### Store the Google Client ID and Secret

1. Open Visual Studio Solution.
2. Select `Manage User Secrets`.
    1. Right-click on `Project` > `Manager User Secrets`.
3. Add the `Authentication:Google:ClientId` and `Authentication:Google:ClientSecret` values.

    ``` json title="secrets.json" linenums="1"
    {
      "APPLICATIONINSIGHTS_CONNECTION_STRING": "InstrumentationKey=***************;IngestionEndpoint=https://***************.applicationinsights.azure.com/;LiveEndpoint=https://***************.livediagnostics.monitor.azure.com/",
      "Authentication:Google:ClientId": "***************.apps.googleusercontent.com",
      "Authentication:Google:ClientSecret": "************************"
    }
    ```

4. Save file.

### Configure Google Authentication in App

1. Add the `Microsoft.AspNetCore.Authentication.Google` NuGet package to the app.
2. Edit the `Program.cs` file with the following lines:

    ``` cs title="Program.cs" linenums="1" hl_lines="5-9 17"
    var builder = WebApplication.CreateBuilder(args);
    var services = builder.Services;
    var configuration = builder.Configuration;

    services.AddAuthentication().AddGoogle(googleOptions =>
        {
            googleOptions.ClientId = configuration["Authentication:Google:ClientId"];
            googleOptions.ClientSecret = configuration["Authentication:Google:ClientSecret"];
        });


    // Build application with configurations and services
    var app = builder.Build();

    // Enable configurations and services
    // Enable authentication services
    app.UseAuthentication();
    ```

3. Save and build application.

Notes:

- The call to `AddIdentity` configures the default scheme settings.
- The `AddAuthentication(IServiceCollection, String)` overload sets the DefaultScheme property.
- The `AddAuthentication(IServiceCollection, Action<AuthenticationOptions>)` overload allows configuring authentication options, which can be used to set up default authentication schemes for different purposes
- Subsequent calls to `AddAuthentication` override previously configured `AuthenticationOptions` properties.

### Test App

### Create Project within Google Developers Portal

### Create Oauth consent

- User Type = External
- App Information
  - app name
  - user support email
  - developer contact email

### Create OAuth Client ID

- Application type = web application
  - Choose name
- Authorized redirect URIs
  - `https://localhost:{PORT}/signin-google`
- Save Client ID
- Save Client Secret

!!! note

    When deploying the site, either:

    - Update the app's redirect URI in the Google Console to the app's deployed redirect URI.
    - Create a new Google API registration in the Google Console for the production app with its production redirect URI. 

## Resources

- <https://learn.microsoft.com/en-us/aspnet/core/security/authentication/social/google-logins?view=aspnetcore-7.0>
- <https://developers.google.com/identity/gsi/web/guides/get-google-api-clientid>
