#!/bin/bash

SESSION="cockpit"
BASE_DIR="$HOME/tmux-panes"

tmux kill-session -t "$SESSION" 2>/dev/null

load_cmd () {
    tr -d '\r' < "$1"
}

# =========================
# WINDOW 1: SYSTEM
# =========================
tmux new-session -d -s "$SESSION" -n "SYSTEM"

W1="$SESSION:0"

tmux send-keys -t "$W1.0" "$(load_cmd "$BASE_DIR/w1_0.txt")" C-m

tmux split-window -h -t "$W1.0"
tmux send-keys -t "$W1.1" "$(load_cmd "$BASE_DIR/w1_1.txt")" C-m

tmux split-window -v -t "$W1.0"
tmux send-keys -t "$W1.2" "$(load_cmd "$BASE_DIR/w1_2.txt")" C-m

tmux split-window -h -t "$W1.2"
tmux send-keys -t "$W1.3" "$(load_cmd "$BASE_DIR/w1_3.txt")" C-m

tmux select-layout -t "$W1" tiled


# =========================
# WINDOW 2: OPS
# =========================
tmux new-window -t "$SESSION" -n "OPS"

W2="$SESSION:1"

tmux send-keys -t "$W2.0" "$(load_cmd "$BASE_DIR/w2_0.txt")" C-m

tmux split-window -h -t "$W2.0"
tmux send-keys -t "$W2.1" "$(load_cmd "$BASE_DIR/w2_1.txt")" C-m

tmux split-window -v -t "$W2.0"
tmux send-keys -t "$W2.2" "$(load_cmd "$BASE_DIR/w2_2.txt")" C-m

tmux split-window -h -t "$W2.2"
tmux send-keys -t "$W2.3" "$(load_cmd "$BASE_DIR/w2_3.txt")" C-m

tmux select-layout -t "$W2" tiled

tmux select-window -t "$SESSION:0"
tmux attach -t "$SESSION"
