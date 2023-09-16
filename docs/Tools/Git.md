# Git

## Git Tags

```sh
#!/bin/bash
# Get list of tags per version pattern.

version="v0.1.0"

# Find all tags that match the pattern "vX.Y.Z-RCn" where n is a number
tags=$(git tag | grep -E "$version+-RC[0-9]+")

# Find the latest RC tag and extract the RC number
latest_rc_tag=$(echo "$tags" | sort -Vr | head -n 1)
latest_rc_number=$(echo "$latest_rc_tag" | sed -n 's/.*-RC\([0-9]\+\)/\1/p')

echo "Latest RC Tag: $latest_rc_tag"
echo "Latest RC Number: $latest_rc_number"

# Calculate the next RC number
next_rc_number=$((latest_rc_number + 1))

# Generate the next RC tag
next_rc_tag="$version-RC$next_rc_number"

echo "Next RC Tag: $next_rc_tag"
```
