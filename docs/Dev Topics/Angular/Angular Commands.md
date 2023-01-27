# Angular Commands

## Generate New Component

The following commands generate a new component.

``` PowerShell linenums="1" title="PowerShell - Generate a new component named 'about' to the module 'app'"
PS> ng generate component about --module=app
PS> ng g c about --module=app
```

``` PowerShell linenums="1" title="PowerShell - Generate a new component named 'about' to the module 'app'"
PS> ng generate component about --module=app
PS> ng g c about --module=app
```

## Delete Component

Do it manually.

Files/Folders that need to be edited in order to delete the component:

1. Edit `ClientApp\src\app\app.module.ts` to remove referenced component.
2. Delete all files within the component folder within `ClientApp\src\app\`.

## Check angular version

=== "Bash"

    ``` sh
    ng version
    ```

=== "PowerShell"

    ``` PowerShell
    ng version
    ```

## References

- [Getting Started with Angular](https://angular.io/start)