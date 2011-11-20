# blow away unversioned artifacts
git clean -dfx

# list unique Git authors within a date range

git log --format="%an" --since="yesterday" . | sort | uniq
git log --format="%an" --since="June 20 2010" . | sort | uniq
