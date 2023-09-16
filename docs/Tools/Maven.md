# Maven

## Project Version

Get version from project `pom.xml`.

```sh
#!/bin/bash

# Run the mvn command and capture its output into the $version variable
version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

# Check if the command was successful (exit code 0)
if [ $? -eq 0 ]; then
    # Print the captured version
    echo "Version: $version"
else
    # Handle the case where the command failed
    echo "Failed to retrieve version from mvn command."
fi
```
