# Git aliases
alias gs='nvim -c ":G"'
alias prci='xdg-open `hub ci-status -f %U`'
alias prl="hub pr list"
alias pro="hub pr show"
alias prco="hub pr checkout"

# NVIM
alias update_nvim='nvim -c "try | call dein#update() | messages | finally | qall! | endtry" --headless'
alias ngst='nvim -c ":G"'
