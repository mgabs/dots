
#!/usr/bin/env sh

eval "$(/opt/homebrew/bin/brew shellenv)"
# bash completion
# . /opt/homebrew/etc/bash_completion.d/alacritty
# . /opt/homebrew/etc/bash_completion.d/aria2c
# . /opt/homebrew/etc/bash_completion.d/brew
# . /opt/homebrew/etc/bash_completion.d/cargo.bashcomp.sh
# . /opt/homebrew/etc/bash_completion.d/exa
# . /opt/homebrew/etc/bash_completion.d/fd
# . /opt/homebrew/etc/bash_completion.d/gapplication
# . /opt/homebrew/etc/bash_completion.d/gdbus
# . /opt/homebrew/etc/bash_completion.d/gio
# . /opt/homebrew/etc/bash_completion.d/git-prompt.sh
# . /opt/homebrew/etc/bash_completion.d/git-completion.bash
# . /opt/homebrew/etc/bash_completion.d/gresource
# . /opt/homebrew/etc/bash_completion.d/gsettings
# . /opt/homebrew/etc/bash_completion.d/maven
# . /opt/homebrew/etc/bash_completion.d/mosh
# . /opt/homebrew/etc/bash_completion.d/ninja-completion.sh
# . /opt/homebrew/etc/bash_completion.d/npm
# . /opt/homebrew/etc/bash_completion.d/nvm
# . /opt/homebrew/etc/bash_completion.d/podman
# . /opt/homebrew/etc/bash_completion.d/rustc
# . /opt/homebrew/etc/bash_completion.d/starship
# . /opt/homebrew/etc/bash_completion.d/subversion
# . /opt/homebrew/etc/bash_completion.d/tldr
# . /opt/homebrew/etc/bash_completion.d/tmux
# . /opt/homebrew/etc/bash_completion.d/*
# . /opt/homebrew/etc/bash_completion.d/heroku
#. /opt/homebrew/etc/bash_completion.d/pip
# Docker stuff
# . /opt/homebrew/etc/bash_completion.d/docker
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# # setting AWS vars
# export AWS_ACCOUNT_ID=632396013957
# export AWS_DEFAULT_REGION=eu-central-1
# export AWS_REGION=eu-central-1

## PATHS
PATH="$PATH:$HOME/.local/bin"                  # locals
PATH="$PATH:/opt/homebrew/bin"                 # homebrew
PATH="$PATH:/opt/homebrew/opt/sphinx-doc/bin"  # sphinx
PATH="$PATH:$HOME/.local/share/nvim/mason/bin" # add nvim mason path

## set exa colors
export EXA_COLORS="ur=99:uw=99:ux=99:gr=99:gw=99:gx=99:ue=99:tr=99:tw=99:tx=99:xa=99:sn=99:sb=99"

# tmux plugin manager
export TMUX_PLUGIN_MANAGER_PATH="/Users/mmetawea/.config/tmux/plugins"

# jdk
JAVA_HOME="/opt/homebrew/opt/openjdk"
export JAVA_HOME

PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# added by Snowflake SnowSQL installer v1.2
PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

PATH="/opt/homebrew/opt/curl/bin:$PATH"

# macports
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# postgre config
PATH="$PATH:/opt/homebrew/opt/libpq/bin"

# python3.10
PATH="$PATH:$HOME/Library/Python/3.10/bin"

# # Setting SPARK_HOME
# SPARK_HOME=/opt/homebrew/Cellar/apache-spark/3.3.0/libexec/
# PATH=SPARK_HOME/bin:$PATH

# coursier
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

# export PATH
export PATH

export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

# installing gprcio
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm

# docker
# export DOCKER_DEFAULT_PLATFORM=linux/amd64


# libpg libs
# For compilers to find libpq you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# For pkg-config to find libpq you may need to set:
#   export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

# rust thing
. "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# complete -C /opt/homebrew/bin/terraform terraform

# Configure chruby
#source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
#export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"

# gcloud initialization
# source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
