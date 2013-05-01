# three line prompt showing:
#     - last command exit status
#     - git repository status
#     - several world clocks
#     - the local time zone
#
# See also http://www.intridea.com/blog/2009/2/2/git-status-in-your-prompt

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
GREEN="\[\033[32;1m\]"
WHITE="\[\033[37;1m\]"

SMILEY="${GREEN}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
EMOTE="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

GIT_DIRTY="[[ \$(git status 2> /dev/null | tail -n1) != \"nothing to commit, working directory clean\" ]] && echo \"${YELLOW}\" || echo \"${GREEN}\""

function parse_git_hash {
  hash=$(git log --format="%h" -n1 2> /dev/null) || return
  echo $hash
}

function parse_git_branch {
    ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

export PS1="${RESET}\n\`${EMOTE}\` \
\u@\h \
\`${GIT_DIRTY}\`\$(parse_git_branch) \$(parse_git_hash)${NORMAL} \
\w \
\n\t \D{%b %d %Y %z %Z}\
\`${GIT_DIRTY}\`\n\$ ${NORMAL}"
