# Java Projects in IntelliJ

## Version

These notes reference the following versions of IntelliJ

| IntelliJ Version             | JDK Version |
| ---------------------------- | ----------- |
| 2022.3.2 (Community Edition) | openjdk-19  |

## Troubleshooting

### Incorrect Build Version of Module

```yaml title="Build Output - Error"
java: error: release version 5 not supported

Module Server SDK 19 does not support source version 1.5.
Possible solutions:
- Downgrade Project SDK in settings to 1.5 or compatible. Open project settings.
- Upgrade language version in Maven build file to 19. Update pom.xml and reload the project.
```

**Solution:**

1. Change SDK for Module
      1. `Right click` on `Module` > `Module Settings` > `Project Settings` > `Modules` > (Select Module)
      2. Select `Dependencies` (Tab) > Change the `Module SDK` to `openjdk-19`.
      3. Select `Sources` (Tab) > Change the `Language level` to `Project default` (which is `openjdk-19`).
2. Change Compiler Byte Code for Module.
      1. `File` > `Settings` > `Build, Execution, Deployment` > `Compiler` > `Java Compiler`.
      2. Under `per-module bytecode version`, select `Module` and change the `Target bytecode version` to `openjdk-19`.
