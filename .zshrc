############################################
#
# コマンドのエリアス設定
############################################
# workspace
hash -d w=/var/www

# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim # エディタをvimに設定
export LANG=ja_JP.UTF-8 # 文字コードをUTF-8に設定
export KCODE=u # KCODEにUTF-8を設定
export AUTOFEATURE=true # autotestでfeatureを動かす
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.terraform_0.6.14:$PATH

#bindkey -e # キーバインドをemacsモードに設定
#bindkey -v # キーバインドをviモードに設定


### Complement ###
# 補完機能を有効にする
autoload -U compinit; compinit 
# 補完候補を一覧で表示する(d)
setopt auto_list 
# 補完キー連打で補完候補を順に表示する(d)
setopt auto_menu 
# 補完候補をできるだけ詰めて表示する
setopt list_packed 
# 補完候補にファイルの種類も表示する
setopt list_types 
# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete 
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
# 補完ファイルの背景色を変更
zstyle ':completion:*:default' menu select=2

# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''



### History ###
HISTFILE=~/.zsh_history # ヒストリを保存するファイル
HISTSIZE=10000 # メモリに保存されるヒストリの件数
SAVEHIST=10000 # 保存されるヒストリの件数
setopt bang_hist # !を使ったヒストリ展開を行う(d)
setopt extended_history # ヒストリに実行時間も保存する
setopt hist_ignore_dups # 直前と同じコマンドはヒストリに追加しない
setopt share_history # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
tmp_prompt="%B%U${tmp_prompt}%u%b"
tmp_prompt2="%B%U${tmp_prompt2}%u%b"
tmp_rprompt="%B%U${tmp_rprompt}%u%b"
tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt # 通常のプロンプト
PROMPT2=$tmp_prompt2 # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt # 右側のプロンプト
SPROMPT=$tmp_sprompt # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

### Title (user@hostname) ###
#case "${TERM}" in
#kterm*|xterm*|)
#precmd() {
#echo -ne "\033]0;${USER}@${HOST%%.*}\007"
#}
#;;
#esac

# ------------------------------
# Other Settings
# ------------------------------
### RVM ###
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

### Macports ###
case "${OSTYPE}" in
darwin*)
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
;;
esac

### Aliases ###
alias r=rails
alias v=vim
alias ll='ls -l'
alias la='ls -la'
alias sshlist='cat ~/.ssh/config |grep "Host " |grep -v "*" |sed s/"^Host "//'
alias rdp='open -a "Microsoft Remote Desktop"'
alias cdanken='cd "odrive/Box/Ops/doc/0\ 案件"'
alias whether_tokyo='curl -4 http://wttr.in/Tokyo'
alias whether_osaka='curl -4 http://wttr.in/Osaka'
alias tempa_osaka='finger osaka@graph.no'

# cdコマンド実行後、lsを実行する
#function cd() {
# builtin cd $@ && ls;
#}

autoload bashcompinit
bashcompinit
setopt PROMPT_SUBST
#source ~/incr-0.2.zsh

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
psvar=()
LANG=en_US.UTF-8 vcs_info
[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"

function run-fglast {
      zle push-input
          BUFFER="fg %"
              zle accept-line
}

zle -N run-fglast
bindkey "^z" run-fglast

export PYTHONPATH="/Library/Python/2.7/site-packages:$PYTHONPATH"

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"


export NVM_DIR="/Users/kawamura/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
#nvm use default
#npm_dir=${NVM_PATH}_modules
#export NODE_PATH=$npm_dir

