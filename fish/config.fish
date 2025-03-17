if status is-interactive
    starship init fish | source
end

function fish_greeting
    fortune | lolcat
end

thefuck --alias | source
alias f="fuck"
alias gs="git status"
alias gc="git checkout"
alias lg="lazygit"

# against slow responce when misstyping command
function fish_command_not_found
    __fish_default_command_not_found_handler $argv
end
