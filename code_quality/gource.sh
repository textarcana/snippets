# generate gource visualization of a git repository
#
# the code in backticks provides the name of the active git branch

gource --title `git symbolic-ref HEAD | cut -d'/' -f3` --key --highlight-users --hide filenames
