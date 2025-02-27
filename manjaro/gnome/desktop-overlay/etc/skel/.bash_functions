### Stardict functions

function sd-All() {
	sdcv -n --utf8-output --color "$@" 2>&1 | fold --width=$(tput cols)
	}

function sd-wordnet() {
	sdcv -n --utf8-output --color "$@" 2>&1 -u "WordNet® 3.0 (En-En)" | \
	fold --width=$(tput cols)
	}

function sd-colls-thesaurus() {
	sdcv -n --utf8-output --color "$@" 2>&1 -u "Collins Thesaurus (En-En)" | \
	fold --width=$(tput cols)
	}

function sd-oxford-adv() {
	sdcv -n --utf8-output --color "$@" 2>&1 -u "Oxford Advanced Learner's Dictionary 8th Ed." | \
	fold --width=$(tput cols)
	}

function sd-oxford-coll() {
	sdcv -n --utf8-output --color "$@" 2>&1 -u "Oxford Collocations Dictionary 2nd Ed. (En-En)" | \
	fold --width=$(tput cols)
	}

function sd-longman() {
	sdcv -n --utf8-output --color "$@" 2>&1 -u "Longman Dictionary of Common Errors (En-En)" | \
	fold --width=$(tput cols)
	}

function sd-factbook() {
	sdcv -n --utf8-output --color "$@" 2>&1 -u "The World Factbook 2014" | \
	fold --width=$(tput cols)
	}




#### Pacman list all packages installed
#### Use fzf and interactively show each package info in a preview window
#### Multi select the packages (tab) and press enter to print their respective info 
#### paclist()

# Note '2> /dev/null' is to redirect error output 'warning: database file for 'core' does not exist' to the null device
# So '2> /dev/null' means throw away stderr (standard error)

# 'bat -f -p -l yaml' provides color preview
# The big -P is to print the info on the terminal (not use pager)
# The small -p means plain (no decorations)
function pac-list() {
	pacman -Qq 2> /dev/null | fzf --multi \
	--preview-window=right,65% \
	--height 80% \
	--header-first \
	--header '[TAB]: Multi-Select, [ENTER]: Print-Info' \
	--preview-label ' Infomation_Preview ' \
	--preview "pacman -Qi {1} 2> /dev/null | bat -f -p -l yaml" \
	--prompt '  Find Packages > ' \
	| xargs -I{} pacman -Qi {} 2> /dev/null | bat -f -p -l yaml -P
	}




### Pacman remove or uninstall selected packages
### Use fzf and interactively show each package info in a preview window
### To remove, select the packages (tab) and press enter to uninstall 
### pac-remove()

# Note '2> /dev/null' is to redirect error output 'warning: database file for 'core' does not exist' to the null device
# So '2> /dev/null' means throw away stderr (standard error)
# Not working well with xargs in this function only, so 'xargs -ro sudo pacman -Rns' does not include '2> /dev/null'
# It gets rid of the question 'Do you want to remove these packages? [Y/n]'

# 'bat -f -p -l yaml' provides color preview
function pac-remove() {
	pacman -Qq 2> /dev/null | fzf --multi \
	--preview-window=right,60% \
	--height 80% \
	--header-first \
	--header '[TAB]: Multi-Select, [CTRL-T]: Toggle Preview' \
	--preview-label ' [CTRL-T] List_Preview / Info_Preview ' \
	--preview "bat -n -f {+f}" \
	--prompt '  List Preview > ' \
	--bind 'ctrl-t:transform:[[ ! {fzf:prompt} =~ List ]] &&
        echo "change-prompt(  List Preview > )+change-preview:bat -n -f \{+f}" ||
        echo "change-prompt(  Info Preview > )+change-preview:pacman -Qi \{} 2> /dev/null | bat -f -p -l yaml"' \
	| xargs -ro sudo pacman -Rns
	}




### Pacman Install *pkg.tar.zst packages interactively offline
### Pacman install selected packages using fzf
### To install, interactively select packages using fzf from within a directory 
### The packages must be placed within the directory
### pac-install()

# [--preview "cut -c3- {+f} | bat -n -f"] cuts the 1st (.) and 2nd (/) characters from the package name in the preview window
# eg. './vlc.pkg.tar.zst' becomes 'vlc.pkg.tar.zst'
# alternatively use: [--preview "bat -n -f {+f}"] (but the preview becomes ./vlc.pkg.tar.zst)

function pac-install() {
	# Prompt the user to select one or more .pkg.tar.zst files using fzf
  	local selected_files
  	selected_files=$(find . -maxdepth 1 -type f -name "*.pkg.tar.zst" | 
  	fzf -m \
  	--header-first \
	--header '[TAB]: Multi-Select, [ENTER]: Start-Installation' \
	--prompt '  Find Packages > ' \
	--preview "cut -c3- {+f} | bat -n -f" \
	--preview-label ' Selected-Packages ' \
	)

  	# If no files were selected, exit
  	if [[ -z "$selected_files" ]]; then
    	echo "No packages selected. Exiting."
    	return 1
  	fi

  	# Install selected packages using pacman
  	echo "Installing selected packages..."
 	# Use xargs to pass the list of selected files to pacman without quotes
  	echo "$selected_files" | xargs -ro sudo pacman -U

  	echo "Installation completed."
}




### Install and manage packages from the online repositories
### It instals pkgs from the internet
### It uses pacui
### pac-online-install()

function pac-online-install() {
	pacui
	}




### Interactive cd
### Changing directory using cd command
### Like normal cd but opens an interactive navigation window when called with no arguments.
### bash version
### cd()

cd() {
    if [[ $# -ne 0 ]]; then
        builtin cd "$@"
        return
    fi
    while true; do
        lsd=(.. $(\ls -p -A | grep '/$' | sed 's/\/$//')) #Using array assignment
        dir=$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo "$1")" #Corrected quoting here
                __cd_path="$(echo "$(pwd)/$__cd_nxt" | sed "s/\/\//\//")" #Corrected quoting and escaping
                echo "$__cd_path" #Corrected quoting
                echo
                ls -p -A --color=always "$__cd_path" #Corrected quoting
            ')
        [[ -n "$dir" ]] || return 0 #Simplified check for empty string
        builtin cd "$dir" &> /dev/null
    done
}




### Changing directory
### Uses files
### cd into the directory of the selected file
### it means: cd file
### fzf-cd-file()

function fzf-cd-file() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}




### Changing directory
### Uses directories (folders)	
### cd into directories including hidden directories (not interactive, cant go up one level)
### it means: cd directory
### fzf-cd-dir()

function fzf-cd-dir() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}




### Go up a directory level
### Change directory to the parent folder only
### Uses directories (folders)
### cd into the parent directories
### fzf-cd-to-parent()

function fzf-cd-to-parent() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
  ls
}




### Finds files and opens them in the editor (like fuz)
### Opens the selected file with the default editor
### Bypass fuzzy finder if there's only one match (--select-1)
### Exit if there's no match (--exit-0)
### CTRL-O to open with `open` command, CTRL-E or Enter key to open with the $EDITOR
### fzf-open-file()

function fzf-open-file() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}




### Evaluate functions in an fzf preview window
### Examples:
### Run 'fzf-eval' press enter 
### input: man ls, the info will be displaed
### input: vlc, the startup info is displayed
### fzf-eval()

function fzf-eval() {
	echo | fzf -q "$*" \
	--height 80% \
	--header-first \
	--header 'Enter Command To Evaluate, Example: man ls, vlc, mpv' \
	--preview-label ' Evaluation-Preview ' \
	--preview-window=down:99% \
	--preview="eval {q}"
}




### Delete files using fzf 
### It ask for confirmation before deleting
### fzf-rm()

function fzf-rm() {
  if [[ "$#" -eq 0 ]]; then
    local files
    files=$(find . -maxdepth 1 -type f | fzf --multi \
    --header-first \
	--header 'Select Files To Delete, [Tab] To Select, [ESC] To Cancel ' \
	--preview-label 'List_of_Files_to_Delete ' \
    --preview "cut -c3- {+f} | bat -n -f"
    )
    echo "$files" | xargs -roI{} sudo rm -i '{}' #we use xargs to capture filenames with spaces in them properly
  else
    command rm "$@"
  fi
}




### List all aliases, select one and run it
### fzf-aliases-functions()

function fzf-aliases-functions() {
    CMD=$(
        (
            (alias)
        ) | fzf | cut -d '=' -f1
    );

    eval $CMD
}




### List all ENV variables only
### fzf-env-vars()

function fzf-env-vars() {
  local out
  out=$(env | fzf)
  echo $(echo $out | cut -d= -f2)
}




### Show all man pages
### man-find()

fzf-man-page() {
    f=$(fd . $MANPATH/usr/share/man${1} -t f -x echo {/.} | fzf \
    --preview-window=right,65% \
    --height 80% \
    --prompt=' Man > '  \
	--header-first \
	--header 'Man_Page Selection, [ENTER] To View' \
	--preview-label ' Man_Page-Preview ' \
    --preview="man {} | bat -f -p -l man --wrap=auto") \
     && man $f
}




### ARCHIVE EXTRACTION
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
