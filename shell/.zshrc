#!/usr/bin/env sh

# homebrew
# eval "$(/opt/homebrew/bin/brew shellenv)"


## If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

######### Personal Configs ########

## aliases

alias aria="aria2c -x 16"
alias svim='sudo nvim'
alias vim='nvim'
alias afind='ack -il'
alias cwd='printf "%s\n" "${PWD##*/}"'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias myip="curl icanhazip.com; echo" # curl ifconfig.me
alias rrepl="evcxr"
alias tls="tmux ls"
alias txt="tmux attach -t"
alias txs="tmux new-session -A -s local"
alias wg="_ wg && echo -n \"  public ip: \" ;curl icanhazip.com"
alias wg-up="wg-quick up wg0"
alias wg-down="wg-quick down wg0"
alias md="mkdir -p"
alias rd="rmdir -p"
alias pj='npx projen'
alias rf="rm -rf"
alias _="sudo "
alias py=python
alias scala-new="sbt new scala/hello-world.g8"
alias brit="brew upgrade --greedy-latest && brew update --auto-update && brew cleanup"
# alias genpass="dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 | rev | cut -b 2-18 | rev"
alias genpass="date +%s | sha3sum | base64 | head -c 16 ; echo"
alias netc="et netc"
alias etdev="et mgaber@cosdev"
# alias cdk="/Users/mgaber/.nvm/versions/node/v18.12.1/bin/node cdk"
alias cddep='cdk deploy --require-approval never'
alias cddes='cdk destroy --require-approval never'
alias cddf='cdk diff'
alias cdkp='cdk --profile personal '
alias cdsyn='cdk synth'
# alias spark-submit="JAVA_HOME=/opt/homebrew/opt/openjdk@11 spark-submit "
# alias spark-test="JAVA_HOME=/opt/homebrew/opt/openjdk@11 pytest"
# alias spark-flake="JAVA_HOME=/opt/homebrew/opt/openjdk@11 spark-submit --packages net.snowflake:snowflake-jdbc:3.13.23,net.snowflake:spark-snowflake_2.12:2.11.0-spark_3.3 "

# rusting my workflow
alias ls='eza'
alias ll='eza -alF '
alias lr='eza -alFR '
alias la='eza -al'
alias l='eza -l'
alias lt='eza -lT'
alias rp='realpath'
alias du='dust'
alias etnc="et netc"
alias c=clear
alias jbuild='mvn clean package && java -jar target/*.jar'
# alias ps='procs'
# fd
# grex
# bandwhich
# zellij
alias venv=virtualenv
alias vsrc='source .venv/bin/activate'
alias pp='poetry run python'
alias psh="poetry shell"

# ## auto sourcing venv
# function cd() {
#   builtin cd $1
# }


### zoxide - https://github.com/ajeetdsouza/zoxide#introduction
eval "$(zoxide init zsh --cmd j)"

zgo(){

  if [ -z "$1" ]
  then
    j ~
  else
    j "$1"
  fi

  tmux rename-window `cwd`
}
# up function
zu() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
  tmux rename-window `cwd`
}

zb(){
  j -
  tmux rename-window `cwd`
}
zq(){
  zoxide query -l "$1"
  tmux rename-window `cwd`
}
zi(){
  zoxide query -i "$1"
  tmux rename-window `cwd`
}
za(){
  zoxide add "$1"
  tmux rename-window `cwd`
}
zr(){
  zoxide remove "$1"
  tmux rename-window `cwd`
}

alias z=zgo

## zoxide examples
## z foo       # cd to highest ranked directory matching foo
## z foo bar   # cd to highest ranked directory matching foo and bar
## z foo/      # can also cd into actual directories
## zi foo      # cd with interactive selection using fzf
## zq foo      # echo the best match, don't cd
## za /foo     # add /foo to the database
## zr /foo     # remove /foo from the database

# zsh
source <(fzf --zsh)



### Alacritty theme switcher
# LIGHT_COLOR='base16-equilibrium-light-256.yml'
# DARK_COLOR='base16-humanoid-dark-256.yml'
# # DARK_COLOR='base16-gruvbox-dark-soft-256.yml'
# # DARK_COLOR='base16-dracula-256.yml'
# # DARK_COLOR='base16-espresso-256.yml'
#
# termlight() {
#   LIGHT_COLOR='base16-equilibrium-light-256.yml'
#   DARK_COLOR='base16-humanoid-dark-256.yml'
#   alacritty-colorscheme apply $LIGHT_COLOR
#   export TERMLIGHT="light"
# }
# termdark() {
#   LIGHT_COLOR='base16-equilibrium-light-256.yml'
#   DARK_COLOR='base16-humanoid-dark-256.yml'
#   alacritty-colorscheme apply $DARK_COLOR
#   export TERMLIGHT="dark"
# }
darktoggle() {
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode' & >/dev/null
  switch-theme
}

macid() {
    return osascript -e 'id of app "$1"'
}

# # Switch to Solarized Dark if we are currently in dark mode
# if [[ "$(uname -s)" == "Darwin" ]]; then
#   val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
#   if [[ $val == "Dark" ]]; then
#     termdark
#     export TERMLIGHT="dark"
#   else
#    termlight
#    export TERMLIGHT="light"
#   fi
# fi

mdgo () {
mkdir -p "$1"
cd "$1"
}

# NVM Env
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# TODO: Refactor
# nvm use --lts >> /dev/null


# #auto completer for aws
complete -C aws_completer aws #vim sudo _

# python activate
python_venv() {
  MYVENV=./.venv
  POETRY=./pyproject.toml

  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1

  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

python_venv

## ZSH Options
# http://zsh.sourceforge.net/Doc/Release/Options.html

# =-----------------------=
# Changing Directories
# # http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories
# setopt auto_cd                 # if a command isn't valid, but is a directory, cd to that dir
# setopt auto_pushd              # make cd push the old directory onto the directory stack
# setopt pushd_ignore_dups       # don’t push multiple copies of the same directory onto the directory stack
# setopt pushd_minus             # exchanges the meanings of ‘+’ and ‘-’ when specifying a directory in the stack

# Completions
# http://zsh.sourceforge.net/Doc/Release/Options.html#Completion-2
autoload -Uz compinit && compinit
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# =-----------------------=
# move word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

setopt always_to_end           # move cursor to the end of a completed word
setopt auto_list               # automatically list choices on ambiguous completion
setopt auto_menu               # show completion menu on a successive tab press
setopt auto_param_slash        # if completed parameter is a directory, add a trailing slash
setopt complete_in_word        # complete from both ends of a word
## case insensitive completion
setopt COMPLETE_ALIASES
# unsetopt menu_complete         # don't autoselect the first completion entry
# Expansion and Globbing
# http://zsh.sourceforge.net/Doc/Release/Options.html#Expansion-and-Globbing
setopt extended_glob           # use more awesome globbing features
setopt glob_dots               # include dotfiles when globbing
# History
# http://zsh.sourceforge.net/Doc/Release/Options.html#History
setopt append_history          # append to history file
setopt extended_history        # write the history file in the ':start:elapsed;command' format
unsetopt hist_beep             # don't beep when attempting to access a missing history entry
setopt hist_expire_dups_first  # expire a duplicate event first when trimming history
setopt hist_find_no_dups       # don't display a previously found event
setopt hist_ignore_all_dups    # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_dups        # don't record an event that was just recorded again
setopt hist_ignore_space       # don't record an event starting with a space
setopt hist_no_store           # don't store history commands
setopt hist_reduce_blanks      # remove superfluous blanks from each command line being added to the history list
setopt hist_save_no_dups       # don't write a duplicate event to the history file
setopt hist_verify             # don't execute immediately upon history expansion
setopt inc_append_history      # write to the history file immediately, not when the shell exits
unsetopt share_history         # don't share history between all sessions
# Input/Output
# http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput
unsetopt clobber               # must use >| to truncate existing files
unsetopt correct               # don't try to correct the spelling of commands
unsetopt correct_all           # don't try to correct the spelling of all arguments in a line
unsetopt flow_control          # disable start/stop characters in shell editor
setopt interactive_comments    # enable comments in interactive shell
unsetopt mail_warning          # don't print a warning message if a mail file has been accessed
setopt path_dirs               # perform path search even on command names with slashes
setopt rc_quotes               # allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
unsetopt rm_star_silent        # ask for confirmation for `rm *' or `rm path/*'

# Job Control
# http://zsh.sourceforge.net/Doc/Release/Options.html#Job-Control
setopt auto_resume            # attempt to resume existing job before creating a new process
unsetopt bg_nice              # don't run all background jobs at a lower priority
unsetopt check_jobs           # don't report on jobs when shell exit
unsetopt hup                  # don't kill jobs on shell exit
setopt long_list_jobs         # list jobs in the long format by default
setopt notify                 # report status of background jobs immediately

# Prompting
# http://zsh.sourceforge.net/Doc/Release/Options.html#Prompting
setopt prompt_subst           # expand parameters in prompt variables

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Zle
# http://zsh.sourceforge.net/Doc/Release/Options.html#Zle
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
unsetopt beep                 # be quiet!
setopt combining_chars        # combine zero-length punctuation characters (accents) with the base character
#setopt emacs                  # use emacs keybindings in the shell


# Initialization
# http://zsh.sourceforge.net/Doc/Release/Options.html#Initialisation
# Scripts and Functions
# http://zsh.sourceforge.net/Doc/Release/Options.html#Scripts-and-Functions
# Shell Emulation
# http://zsh.sourceforge.net/Doc/Release/Options.html#Shell-Emulation
# Shell State
# http://zsh.sourceforge.net/Doc/Release/Options.html#Shell-State



### Tmux - if exists
if command -v tmux >/dev/null 2>&1; then
  # if not inside a tmux session, and if no session is started, start a new session
  [ -z "${TMUX}" ] && (tmux attach >/dev/null 2>&1 || tmux)
fi

# ## Tmux - auto rename reset
# #if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux: server" ]; then
# if tmux has-session; then
#   tmux set-window-option automatic-rename "on" 1>/dev/null
# fi

# Tmux rename on remote connections
ssh() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux: server" ]; then
    tmux rename-window "$(echo ssh@$* | cut -d . -f 1)"
    command ssh "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command ssh "$@"
  fi
}
et() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux: server" ]; then
    tmux rename-window "$(echo et@$* | cut -d . -f 1)"
    command et "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command et "$@"
  fi
}
mosh() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux: server" ]; then
    tmux rename-window "$(echo mosh@$* | cut -d . -f 1)"
    command mosh "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command mosh "$@"
  fi
}

# # added by travis gem
# [ ! -s $HOME/.travis/travis.sh ] || source $HOME/.travis/travis.sh

# fzf
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# rust
. "$HOME/.cargo/env"

# starship
eval "$(starship init zsh)"

## Random fortune cookie
fortune


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mmetawea/.miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mmetawea/.miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/mmetawea/.miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mmetawea/.miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/mmetawea/.miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/mmetawea/.miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

