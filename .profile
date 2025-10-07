# Added by Toolbox App
export PATH="$PATH:/home/arimil/.local/share/JetBrains/Toolbox/scripts"

. "$HOME/.config/godotenv/env" # Added by GodotEnv

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/arimil/.lmstudio/bin"

# dotnet
export PATH="$PATH:/home/arimil/.dotnet:/home/arimil/.dotnet/tools"

# VR fix https://lvra.gitlab.io/docs/hardware/
export XRT_COMPOSITOR_USE_PRESENT_WAIT=1
export U_PACING_COMP_TIME_FRACTION_PERCENT=90

export CHROME_FLAGS="--enable-features=MiddleClickAutoscroll"

#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

