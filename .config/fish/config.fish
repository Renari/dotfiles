source /usr/share/cachyos-fish-config/cachyos-config.fish

fenv source ~/.profile

# overwrite greeting
function fish_greeting
    sleep 0.1
    fastfetch --logo ~/.config/fastfetch/Character_Silver_Wolf_Splash_Art-512.png
end

# workaround for ghostty issues with ssh
alias ssh="TERM=xterm-256color /usr/bin/ssh"

# bitwarden ssh agent
test -S $HOME/.bitwarden-ssh-agent.sock; and set -gx SSH_AUTH_SOCK $HOME/.bitwarden-ssh-agent.sock

[ -s "/home/arimil/.jabba/jabba.fish" ]; and source "/home/arimil/.jabba/jabba.fish"
