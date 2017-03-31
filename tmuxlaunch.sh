SESSION=currents
tmux new-session -d -s $SESSION 
tmux send-keys 'PS1=$' C-m

tmux new-window -t $SESSION:1 -n 'rails-c' bash --login
tmux select-window -t $SESSION:1
tmux split-window -h -t $SESSION:0
tmux send-keys 'PS1=$' C-m
tmux send-keys 'rails c' C-m

tmux new-window -t $SESSION:2 -n 'rails-s' bash --login
tmux select-window -t $SESSION:2 
tmux split-window -v -t $SESSION:0
tmux send-keys 'PS1=$' C-m
tmux send-keys 'rails s' C-m

tmux attach -t $SESSION
