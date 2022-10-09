#!/usr/bin/env bash

# Check that we want to commit.
addreadme() {
  echo "addreadme"
  git add README.md
  git add terraform/README.md
}

set -e

# Replace + by - for debug
set +x

echo "Running in $(pwd)"

# Stash unstaged changes
git stash -q --keep-index


# Commit rezdme file
addreadme

staged_files="$(git diff --name-only --cached)"


# Saving file modification
git add $STAGED_FILES


echo "END hook"

exit 0 # If yes, success!
