# Git aliases
if [[ $OSTYPE == darwin* ]]; then
  alias prci='xdg-open `hub ci-status -f %U`'
else
  alias prci='xopen `hub ci-status -f %U`'
fi
alias prl="hub pr list"
alias pro="hub pr show"
alias prco="hub pr checkout"
alias brdiff="git difftool --dir-diff --tool=vimdirdiff"

# NVIM
alias update_nvim='nvim -c "try | call dein#update() | messages | finally | qall! | endtry" --headless'
alias ngst='nvim -c ":G"'
