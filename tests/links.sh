#!/usr/bin/env bash

set -euo pipefail

page="${1:-index.html}"

if ! rg -q '<a class="link" href="https://www\.linkedin\.com/in/mikhailoval/"[^>]*>LinkedIn ↗</a>' "$page"; then
  echo "LinkedIn contact must link to the provided profile URL" >&2
  exit 1
fi

echo "Contact links are valid"
