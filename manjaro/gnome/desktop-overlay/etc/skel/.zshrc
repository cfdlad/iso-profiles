##################################################################################################################################
## cfdlad's .zshrc for manjaro os
## It checks for the name of the terminal in use
## If konsole (kde) or gnome-terminal (gnome) is used then 'USE_POWERLINE' is set to true and 'manjaro-zsh-prompt' prompt is used
## Else for any other terminal the starship prompt is used
## Both options make use of the cfdlad-zsh-config and cfdlad-manjaro-zsh-config
## 'cfdlad-zsh-config' is my personal zsh config with settings not available in the 'manjaro-zsh-config'
## 'cfdlad-manjaro-zsh-config' is my modified manjaro zsh config and is kept as close as possible to the original 'manjaro-zsh-config'
#################################################################################################################################

if [[ "$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$))" =  "/usr/bin/konsole" ]] || [[ "$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$))" =  "/usr/lib/gnome-terminal-server" ]]; then

    #echo "USE_POWERLINE=true";
    #echo "Use manjaro zsh prompt=true";
    
    # Use powerline
    USE_POWERLINE="true"
    HAS_WIDECHARS="false"
    
    # Source cfdlad-zsh-config
    if [[ -e ~/.cfdlad-zsh-config ]]; then
        source ~/.cfdlad-zsh-config
    fi
    # Source cfdlad-manjaro-zsh-config
    if [[ -e ~/.cfdlad-manjaro-zsh-config ]]; then
        source ~/.cfdlad-manjaro-zsh-config
    fi
    # Use manjaro-zsh-prompt
    if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
        source /usr/share/zsh/manjaro-zsh-prompt
    fi

else

    #echo "USE_POWERLINE=false";
    #echo "Use starship prompt=true";
    
    USE_POWERLINE="false"
    
    # Source cfdlad-zsh-config
    if [[ -e ~/.cfdlad-zsh-config ]]; then
        source ~/.cfdlad-zsh-config
    fi
    # Source cfdlad-manjaro-zsh-config
    if [[ -e ~/.cfdlad-manjaro-zsh-config ]]; then
        source ~/.cfdlad-manjaro-zsh-config
    fi
    # Use starship prompt
    eval "$(starship init zsh)"

fi


#######################################################################################################################
# # This is manjaro's original .zshrc below (All commented out)
#######################################################################################################################

# # Use powerline
# USE_POWERLINE="true"
# # Has weird character width
# # Example:
# #    is not a diamond
# HAS_WIDECHARS="false"
# # Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi
