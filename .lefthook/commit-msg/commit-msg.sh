#!/bin/zsh
# Rule of mark commition:
# 1. Minus (-) is used when changing the funcions, fix bugs, or exist feature.
# 2. Plus (+) is used when creating new feature, function, UI.
# 3. Asterisk (*) is used when changing libraries, functions and refactoring code, project structure.
echo "Checking your commit message"

commit_regex='^(-|\+|\*)\s(Task|Bug|Test|Doc)\s(#\d+:)\s(.+)'
error_msg="Bad commit message. See example: \"- Task #1: first commit.\""

if ! grep -iqE "$commit_regex" "$1"; then
    echo "$error_msg" >&2
    exit 1
fi