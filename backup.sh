#!/bin/sh

GH=/usr/bin/gh
JQ=/usr/bin/jq
GIT=/usr/bin/git

if [ ! "$GITHUB_USERNAME" ]; then
	echo "Please specify Github username in GIT_USERNAME env variable"
	exit 1
fi

$GH repo list --json name --limit 10000 | 
$JQ -r '.[] | .name' |
while read name; do
	if [ -d "$name.git" ]; then
		echo "Repository " $name " exists, run update"
		$GIT -C $name.git remote --verbose update
	else
		echo "Repository " $name " not backup yet, mirror it"
		$GIT clone --mirror git@github.com:$GITHUB_USERNAME/$name.git
	fi
done 
