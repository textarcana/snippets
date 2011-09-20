# 17:49 vernon: something jd/sam/samer came up with if you edit remotely: alias vcp="ssh `echo $SSH_CLIENT | awk '{print $1}'` pbcopy"

alias vcp="ssh `echo $SSH_CLIENT | awk '{print $1}'` pbcopy"
