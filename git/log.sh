# Leaderboard of files that were edited this week:

git log --date-order --since="-7days ago" --format="% " --numstat . | \
    cut -f 3 | egrep -v '^$' | sort | uniq -c | sort -rn | less
