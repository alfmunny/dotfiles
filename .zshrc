# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/yzhang/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="suvash"
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    #git
    #rails
    #ruby
    #lighthouse
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi=vim
alias viz="vi ~/.zshrc"
alias .z=". ~/.zshrc"
alias vivi="vi ~/.vim_runtime/my_configs.vim"
alias viplugin="vi ~/.vim_runtime/vimrcs/plugins_config.vim"
alias vireadme="vi ~/.vim_runtime/README.md"
alias vinotes="vi ~/Notes"
alias vinb="vi ~/Projects/blog/notes-blog/"
alias viqn="vi ~/Projects/blog/notes-blog/source/_posts/quick-notes.md"
alias pubnb="cd ~/Projects/blog/notes-blog; hexo generate; hexo deploy; cd -;"
alias pubmb="cd ~/Projects/blog/my-blog; hexo generate; hexo deploy; cd -;"
export EDITOR=vim

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias -s php=vi
#alias -s py=vi
#alias -s rb=vi
alias -s html=vi
alias gcid="git log | head -1 | awk '{print substr(\[,1,7)}' | pbcopy"

# cd alias
alias cdd="cd ~/Dev"
alias cdp="cd ~/Projects/"
alias cdnb="cd ~/Projects/blog/notes-blog"
alias cbmb="cd ~/Projects/blog/my-blog"
alias cdpl="cd ~/Projects/playground"
alias cdweb="cd ~/Projects/web"
alias cdle="cd ~/Projects/playground/leetcode/"

# vsphere clias
alias vsinit="vsphere init"
alias vsshot="vsphere snapshot"
alias vsls="vsphere list -lrf codec"
alias vsstart="vsphere start"
alias vshalt="vsphere halt"
alias vsssh="vsphere ssh"
alias vsrm="vsphere rm"
alias vstem="vsphere list template"

# anaconda
export PATH="/Users/yzhang/anaconda/bin:$PATH"


# nvm
export NVM_DIR="$HOME/.nvm"

nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm $@
}


# Set command line to VIM mode
set -o vi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# ssh
#
function cprsa() {
    cat ~/.ssh/id_rsa.pub | ssh root@$1 'cat >> .ssh/authorized_keys'
}
function sb() {
    scp ~/Work/Scripts/bashrc root@$1:/etc/bash/bashrc.d/bashrc > /dev/null
    scp ~/Work/Scripts/flood root@$1:/usr/local/bin/flood > /dev/null
    scp ~/Work/Scripts/irbrc root@$1:/opt/fast/web/sb-api/.irbrc > /dev/null
    #ssh -t root@$1 "bash --rcfile /tmp/.bashrc_temp; rm /tmp/.bashrc_temp"
    ssh root@$1 
}

alias getlog="scp root@172.100.51.192:/opt/fast/log/sb_generic.log production.log"
alias bash90="scp ~/Dev/tools/bashrc root@172.100.51.27:~/.bashrc"
alias imin="sb 172.100.51.107"

alias eva13="ssh admin@192.168.1.100"
alias eva13b="ssh admin@192.168.178.52 -p 10000"

# cheat
export CHEATPATH='~/Notes'

# go
export PATH=$PATH:$(go env GOPATH)/bin

#function
#
mkcd() {
    mkdir "$1"
    cd "$1"
}

# search for content
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# search for files
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# port
export PATH=$PATH:/opt/local/bin:/opt/local/sbin

# mysql
export PATH=$PATH:/usr/local/mysql/bin/:/usr/local/opt/openssl/bin/openssl
export PATH=/usr/local/opt/mysql@5.6/bin:$PATH
export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include -I/usr/local/opt/openssl/include"

# openssl
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# pure theme
autoload -U promptinit; promptinit
prompt pure

export LC_ALL=en_US.UTF-8

# eclipse
alias start-eclipse='open /Applications/Eclipse.app'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export TERM=xterm-256color

alias bundleinstall=bundle _1.12.5_ install
eval "$(rbenv init -)"

#emacs
alias emacs="emacsclient -t"

# zsh profiling
# zmodload zsh/zprof

#dotfiles
DOTFILES_PATH=$HOME/.df
alias dtf="/usr/bin/git --git-dir $DOTFILES_PATH --work-tree=$HOME"
