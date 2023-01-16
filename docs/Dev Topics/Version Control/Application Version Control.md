# Application Version Control

!!! question

    if you update a nuget package should your application version change?

!!! answer

    Updating a NuGet package in your application does not necessarily mean that you need to change the version of your application. If the updates to the NuGet package are backwards-compatible, then you can continue to use the same version of your application. However, if the updates to the NuGet package introduce breaking changes or change the behavior of your application in a significant way, then you may need to update the version of your application to reflect these changes and to ensure that your application continues to function as expected.

    It's worth noting that if you're using semantic versioning, then updating a package from a lower major version to a higher one, then you should change the version of your application.