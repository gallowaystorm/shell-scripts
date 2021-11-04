# checkout the branch you want to work on and then pass the branch name into this script to run

git checkout master
git tag archive/$1 $1
git branch -D $1
git branch -d -r origin/$1
git push --tags
git push origin :$1