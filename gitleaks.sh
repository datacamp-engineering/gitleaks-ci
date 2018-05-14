#!/bin/bash

PRDIFF=$(curl -u $GITHUB_USERNAME:$GITHUB_API_TOKEN \
     -H 'Accept: application/vnd.github.VERSION.diff' \
     https://api.github.com/repos/$TRAVIS_REPO_SLUG/pulls/$TRAVIS_PULL_REQUEST)

RE=(
    "-----BEGIN PRIVATE KEY-----"
    "-----BEGIN RSA PRIVATE KEY-----"
    "-----BEGIN DSA PRIVATE KEY-----"
    "-----BEGIN OPENSSH PRIVATE KEY-----"
    "AKIA[0-9A-Z]{16}"
    "facebook.*['\"][0-9a-f]{32}['\"]"
    "reddit.*['\"][0-9a-zA-Z]{14}['\"]"
    "twitter.*['\"][0-9a-zA-Z]{35,44}['\"]"
    "heroku.*[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}"
)
LEAKS=()

# iterate diff lines and check for matches
while read -r line; do
    for re in "${RE[@]}"; do
        [[ $line =~ $re ]] && LEAKS+=$line
    done <<< "$LEAKS"
done <<< "$PRDIFF"

echo "leaks: "
echo $LEAKS