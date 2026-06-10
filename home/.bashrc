#!/bin/bash

source /etc/profile
source /root/.bash_profile

# Auto-start or attach tmux
if [ -z "$TMUX" ]; then
  tmux attach -t cockpit || ~/tmux-cockpit.sh
fi
