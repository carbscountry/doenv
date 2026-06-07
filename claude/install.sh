#!/usr/bin/env bash

mkdir -p ~/.claude
cp -i "$(dirname "$0")/settings.json" ~/.claude/settings.json
echo "Copied claude settings.json to ~/.claude/settings.json"
