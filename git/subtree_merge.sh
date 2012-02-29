# use git's subtree merge strategy to combine repositories while preserving histories
#
# see http://nuclearsquid.com/writings/subtree-merging-and-you/

MODULE_NAME=$1
PREFIX=$2
REPO_PATH=$3

git remote add -f commit_trends $REPO_PATH
git merge -s ours --no-commit $MODULE_NAME/master
mkdir -p $PREFIX
git read-tree --prefix=$PREFIX -u $MODULE_NAME/master
