tmux list-sessions | sed -r 's/([\w-]*):/\1/g' | awk -f $XDG_CONFIG_HOME/fastfetch/modules/get-sessions.awk
