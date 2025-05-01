source /usr/share/cachyos-fish-config/cachyos-config.fish

fenv source ~/.profile

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    sleep 0.1
    fastfetch --kitty ~/.config/fastfetch/Character_Silver_Wolf_Splash_Art-512.png
end

[ -s "/home/arimil/.jabba/jabba.fish" ]; and source "/home/arimil/.jabba/jabba.fish"
