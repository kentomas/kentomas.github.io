# IntelliJ IDE

## Keyboard Shortcuts

| Shortcut                | Description                                                                |
| ----------------------- | -------------------------------------------------------------------------- |
| `Ctrl` + `F9`           | Build.                                                                     |
| `Shift` + `F9`          | Debug.                                                                     |
| `F9`                    | Resume program execution                                                   |
| `F8`                    | Step over to the next line of code                                         |
| `F7`                    | Step into a method call                                                    |
| `Shift` + `F7`          | Step into a method call, but don't step into any library or framework code |
| `Shift` + `F8`          | Step out of the current method                                             |
| `Alt` + `F9`            | Run to the cursor                                                          |
| `Alt` + `F8`            | Evaluate an expression while debugging                                     |
| `Ctrl` + `F8`           | Toggle breakpoint                                                          |
| `Ctrl` + `Shift` + `F8` | View breakpoints                                                           |
| `Ctrl` + `Shift` + `F9` | Debug configurations menu                                                  |
| `Alt` + `Enter`         | Show suggested options (Alternative `ctrl` + `.` in VS)                    |
| `Ctrl` + `Alt` + `L`    | Format File                                                                |

## Other Operations

### Create Test Class

1. Put cursor on the name of the Class that you want to test.
2. Press `Alt` + `Enter`.
3. Select `Create Test Class`.

### Searching for Packages

1. At the bottom of IntelliJ, click on `Dependencies` tab.
2. Type the maven package name in the `Search bar`.
    1. e.g. "aws-lambda-java-core" or "mokito-junit".

### Force Maven Dependencies Update

1. Press `Ctrl` + `Shift` + `a` to find actions.
2. Type `"reload"` in the popped up search bar.
3. Select `"Reload All Maven Projects"`.

## Troubleshooting

### OpenJDK 64-Bit Server VM warning

```sh title="Error in 'Run' window"
OpenJDK 64-Bit Server VM warning: Sharing is only supported for boot loader classes because bootstrap classpath has been appended
```

**Summary:**

- You can ignore this warning. It just means that class data sharing is disabled for classes not loaded by the bootstrap class loader.
- To disable:
    - `File` > `Settings` > `Build, Execution, Deployment` > `Debugger` > `Async Stack Traces`.
    - Uncheck `Instrumenting Agent`.

Additional Info: <https://stackoverflow.com/questions/54205486/how-to-avoid-sharing-is-only-supported-for-boot-loader-classes-because-bootstra>
