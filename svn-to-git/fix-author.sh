#!/bin/sh
# Remaps all commmits from a user to another. Useful when moving between git 
# hosts or from SVN to Git.
# Modified from https://help.github.com/articles/changing-author-info/
#
# Usage:
#    fix-author.sh 'username@'repoid "Full Name" email@domain.com
# Ex:
#    fix-author.sh`mbaker@'bb9a6ac1-b40c-45f1-a282-26dbc7143d31 "Mike Baker" mike@somedomain.com
#

echo "Changing author mapping from: $1 to $2 <$3>"

git filter-branch -f --env-filter '
OLD_EMAIL='"$1"'
CORRECT_NAME="'"$2"'"
CORRECT_EMAIL='"$3"'

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
