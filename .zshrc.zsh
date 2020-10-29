# fix zh_CN garbled
# export LANG=zh_CN.UTF-8
# export LC_ALL=zh_CN.utf8

# for debug
# zmodload zsh/zprof

### Added by Zinit's installer
# if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#     print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#     command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
#         print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#         print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi
# 
# source "$HOME/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
# 
# # Load a few important annexes, without Turbo
# # (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-rust \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-bin-gem-node
# 
### End of Zinit's installer chunk

zinit snippet OMZ::lib/compfix.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/spectrum.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/prompt_info_functions.zsh

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit snippet OMZ::lib/bzr.zsh
zinit snippet OMZ::lib/cli.zsh
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/misc.zsh
zinit snippet OMZ::lib/nvm.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit ice svn
zinit snippet OMZ::plugins/z

zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit snippet OMZ::themes/imajes.zsh-theme

# settings for proxy
# export http_proxy="http://127.0.0.1:10809"
# export https_proxy=$http_proxy
# export HTTP_PROXY=$http_proxy
# export HTTPS_PROXY=$https_proxy
# export ftp_proxy=$http_proxy
# export rsync_proxy=$http_proxy
# export no_proxy="localhost,127.0.0.1,localaddress,local"

# custom alias
source .alias_conf
