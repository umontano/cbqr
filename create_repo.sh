#!/bin/sh
repo_name="$1"
destination_dir=$(pwd)
local_repo_dir="$destination_dir/$repo_name"
test -z "$token_github" && export token_github=$(tail -n 1 /sdcard/token.txt || exit 1)
echo "$token_github"

## CREATE DIRECTORY
mkdir -p "$local_repo_dir"
cd "$local_repo_dir" || exit 1


## ADDING CREDENTIALS
git init

delinked_dir=$(realpath "$local_repo_dir")
git config --global --add safe.directory "$delinked_dir"/

git config --global --add safe.directory "$local_repo_dir"/
git config --global user.name umontano
git config --global user.email u.montano.j@gmail.com
git remote set-url origin https://umontano:"$token_github"@github.com/umontano/"$repo_name".git

## CREATE REPO. INSTRUCTIONS ACCORDING TO GITHUB
echo "# $repo_name" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:umontano/"$repo_name".git
git push -u origin main

git config --global --add safe.directory "$delinked_dir"/

