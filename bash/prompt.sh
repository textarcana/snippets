# three line prompt showing last command exit status, git repository
# status (if any), and several world clocks

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
GREEN="\[\033[32;1m\]"
WHITE="\[\033[37;1m\]"
SMILEY="${GREEN}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
EMOTE="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"
GIT_DIRTY="[[ \$(git status 2> /dev/null | tail -n1) != \"nothing to commit (working directory clean)\" ]] && echo \"${YELLOW}\" || echo \"${GREEN}\""
TIME_NYC="zdump_time 'America/New_York'"
TIME_SF="zdump_time 'America/Los_Angeles'"
TIME_BERLIN="zdump_time 'Europe/Berlin'"
TIME_TOKYO="zdump_time 'Asia/Tokyo'"
TIME_MELBOURNE="zdump_time 'Australia/Melbourne'"

function zdump_time {
    zdump $1 | perl -pe 's{.*?(\d+:\d+):\d+.*}{$1}'
}

function parse_git_hash {
  hash=$(git log --format="%h" -n1 2> /dev/null) || return
  echo $hash
}

function parse_git_branch {
    ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

function seconds_since_epoch {
    echo `date +%s`
}

export PS1="${RESET}\n\`${EMOTE}\` \
\`${GIT_DIRTY}\`[\$(parse_git_branch) \$(parse_git_hash)]${NORMAL} \
\u@\h:\w \n\t \D{%b %d %Y %z} \$(seconds_since_epoch) \
SF\`${TIME_SF}\` \
NY\`${TIME_NYC}\` \
DE\`${TIME_BERLIN}\` \
JP\`${TIME_TOKYO}\` \
AU\`${TIME_MELBOURNE}\` \
\`${GIT_DIRTY}\`\n\$ ${NORMAL}"
