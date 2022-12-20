set -g status-left '#[fg=#957FB8,bold]#{s/root//:client_key_table} #S '

set -g status-right '#[fg=#957FB8,bold] [#S]#[fg=#957FB8,bold] [%d/%m] #[fg=#957FB8,bold][%I:%M%p] '

set -g status-style fg='#A5A5B0',bg='#414151'

set -g window-status-current-style fg='#A5A5B0',bg='#565668',bold

set -g pane-border-style fg='#957FB8'
set -g pane-active-border-style fg='#957FB8'

set -g message-style fg='#1F1F28',bg='#49473E'

set -g display-panes-active-colour '#957FB8'
set -g display-panes-colour '#957FB8'

set -g clock-mode-colour '#957FB8'

set -g mode-style fg='#1F1F28',bg='#49473E'

set-window-option -g window-status-current-format "#I #[bg=#565668,fg=#A5A5B0,bold] #W#{?window_zoomed_flag,*Z,}"
set-window-option -g window-status-format "#I #[bg='#414151',fg=colour223] #W#{?window_zoomed_flag,*Z,}"


