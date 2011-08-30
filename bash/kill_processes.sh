# finds any processes with "selenium" in their names and then kills them

ps ax | grep selenium | perl -lane 'print $F[0]' | xargs kill
