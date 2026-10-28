#!/usr/bin/env bash

set -euo pipefail

page="${1:-index.html}"

assert_contact_link() {
  local href="$1"
  local label="$2"

  if ! rg -Fq "<a class=\"link\" href=\"${href}\"" "$page"; then
    echo "Missing contact link: ${label} -> ${href}" >&2
    exit 1
  fi
}

assert_contact_link "https://www.linkedin.com/in/mikhailoval/" "LinkedIn"
assert_contact_link "mailto:biting321@mail.ru" "Email"
assert_contact_link "https://t.me/mikhailov_al" "Telegram"

echo "Contact links are valid"
