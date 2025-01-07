# for ble.sh (this addition from line 6 to 8 is my stuff)
# Add this lines at the top of .bashrc:
[[ $- == *i* ]] && source ~/Applications/ble/ble.sh --noattach



#####################################################################################################################################################
## Manjaro Stuff Below
#####################################################################################################################################################

#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	#alias ls='ls --color=auto' # Added to Aliases section
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

#alias cp="cp -i"                          # confirm before overwriting something
#alias df='df -h'                          # human-readable sizes
#alias free='free -m'                      # show sizes in MB
#alias np='nano -w PKGBUILD'
#alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend



#####################################################################################################################################################
## My Stuff (All below), also the addition (ble.sh) at the top from line 1 to 3 is my stuff
#####################################################################################################################################################

### SHOPT
shopt -s autocd         # change to named directory
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s dotglob        # dot file names are included in path expansion.
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases

### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export EDITOR=/usr/bin/micro
export VISUAL=/usr/bin/micro

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -d "$HOME/.config/emacs/bin/" ] ;
  then PATH="$HOME/.config/emacs/bin/:$PATH"
fi

### FZF path
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

### FZF settings
#export FZF_BASE="$HOME/.fzf"
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files -g "!.git/"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'

### Functions 
source ~/.bash_functions

### Aliases

# vim
alias vim="nvim"

# pacman
alias pac-zst='sudo pacman -U ./*zst'			 		# offline pkgs install
alias pac-zstd='sudo pacman -U -d ./*zst'		 		# offline forced pkgs install
alias unlock='sudo rm /var/lib/pacman/db.lck'    		# remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' 		# remove orphaned packages (DANGEROUS!)l'


# Changing "ls" to "eza" (see if eza can be installed in ubuntu 22.04, brew, pacstall, binary etc)
alias ll='eza -al --icons --color=always --group-directories-first' # column (all files and dirs)
alias ls='eza -a --icons --color=always --group-directories-first'  # row (all files and dirs)
alias la='eza -a --icons --color=always --group-directories-first'  # row (all files and dirs)
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | grep -E "^\."'

# cheat and fzf
alias ch="cheat -l -c | awk '{print \$1}' | fzf --preview='cheat --colorize {}' --preview-window=right,75% --height 70% | xargs -I{} cheat {}"	# Preview and paste code
alias ch-path="cheat -l | fzf |  awk '{print \$1}' | xargs -I{} cheat {}"				# No preview, only path and paste code
alias ch-preview='cheat -l | fzf --preview="cheat -c {1}" --preview-window=right,80% --height 70%'		# Preview only and paste cheat file path

# tldr
alias tldrf='tldr --list | fzf --preview "tldr --color always {1}" --preview-window=right,65% --height 70% | xargs -I{} tldr {}'

# for ranger, to exit or cd into the current folder
alias ranger='source ranger'

# fuz (fzf and ripgrep search script)
export FUZ_EDITOR=nvim
alias fuz='~/Applications/fuz-main/fuz --path "/home"'	# Searches text in all files in home '~/'
alias fuzp='fuz --path ./'				        		# Searches text in all files for the current directory (fuzp: p= path)
alias fuz-sort-time='fuz --sorttime'					# Searches text in all files in home '~/' modified by date
alias fuz-file-home='fuz --edit'						# Searches file names only in '/home' (Open file with vim)
alias fuz-file-path='fuz --names --path ./'				# Searches file names only in the current directory  './'
alias fuz-file-root='fuz --names --path /'				# Searches file names only in root '/'
alias fuz-file-usb='fuz -n -p /run/media/manjaro/'		# Searches file names only within any usb drive
alias fuz-text-path='fuz --path ./'				        # Searches text in all files for the current directory (same as fuzp)
alias fuz-text-usb='fuz --path /run/media/manjaro/'		# Searches text in all files within any usb drive

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# vte fix for tillix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# for initiating Starship
eval "$(starship init bash)"

# for ble.sh
# Add this line at the end of .bashrc:
[[ ! ${BLE_VERSION-} ]] || ble-attach
