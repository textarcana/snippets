# blow away unversioned artifacts
git clean -dfx

# list unique Git authors within a date range

git log --format="%an" --since="yesterday" . | sort | uniq
git log --format="%an" --since="June 20 2010" . | sort | uniq

# commits by author within date range

git log --since='1 days ago' --date-order --format='%ad %ae' | awk '{print $2,$3,$5,$7}' | uniq -c | tac | sparkler

# histogram of commits per day

git log --date-order --format='%ad' | awk '{print $1,$2,$3}' | uniq -c | sort | awk '{print $1}' | uniq -c | sparkler
