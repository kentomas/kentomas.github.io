# PowerShell Scripts

## GREP equivalent

Command Breakdown:

1. List all the environment variables
2. Then convert output to strings
3. Then search string output for the string "java"

=== "PowerShell"

``` powershell linenums="1"
PS> dir Env: \ | Out-String -stream | Select-String java
```