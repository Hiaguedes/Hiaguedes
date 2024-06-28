#!/bin/bash

# Path to the version file and package.json
VERSION_FILE="version-type.txt"
PACKAGE_JSON="package.json"

# Read the new version from the version file
if [[ ! -f $VERSION_FILE ]]; then
  echo "Error: $VERSION_FILE not found!"
  exit 1
fi

NEW_VERSION=$(cat $VERSION_FILE)

# Read the current version from package.json
CURRENT_VERSION=$(grep '"version"' $PACKAGE_JSON | sed -E 's/.*"version": "([^"]+)".*/\1/')

if [[ $? -ne 0 ]]; then
  echo "Error: Could not read version from $PACKAGE_JSON"
  exit 1
fi

# Function to compare versions
version_greater() {
  [ "$1" != "$2" ] && [ "$1" = "$(echo -e "$1\n$2" | sort -V | tail -n1)" ]
}

# Check if the new version is greater than the current version
if version_greater "$NEW_VERSION" "$CURRENT_VERSION"; then
  echo "New version $NEW_VERSION is greater than current version $CURRENT_VERSION. Proceeding with push."
else
  echo "Error: New version $NEW_VERSION is not greater than current version $CURRENT_VERSION."
  echo "Please update the version in $VERSION_FILE to a value greater than $CURRENT_VERSION."
  exit 1
fi
