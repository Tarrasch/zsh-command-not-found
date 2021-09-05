# Uses the command-not-found package zsh support
# as seen in http://www.porcheron.info/command-not-found-for-zsh/
# this is installed in Ubuntu

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Homebrew (Linuxbrew) command-not-found support
# https://docs.brew.sh/Manpage#command-not-found-init
if [[ -z $HOMEBREW_PREFIX ]] && (($+commands[brew])); then
  eval $(brew shellenv)
fi
if [[ -n $HOMEBREW_PREFIX ]]; then
  HB_CNF_HANDLER="$HOMEBREW_PREFIX/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
  [[ -e "$HB_CNF_HANDLER" ]] && source "$HB_CNF_HANDLER"
fi
