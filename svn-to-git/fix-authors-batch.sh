#!/bin/sh
# Remaps all commmits from a set of users to another.
# No parameters, just make sure to set REPO_SUFFIX to your repo's ID. 
# The repo's ID is the value after the @ in your user names after a conversion 
# from SVN.
#
# Usage:
#   fix-KarmanAuthors.sh
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_SUFFIX="CHANGE ME: REPO ID"


# Staff
$DIR/fix-author.sh 'mbaker@'$REPO_SUFFIX "Mike Baker" mike@somedomain.com
