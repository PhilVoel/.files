if test "$TERM" = "linux"
	exec bash
end

set -U fish_greeting
set FZF_DEFAULT_COMMAND 'fd --type f'
set PATH $PATH /opt/insomnia ~/.local/share/gem/ruby/3.0.0/bin

alias cat=bat
alias dir="dir --color=auto"
alias ls="ls --color=auto"
alias l=ls
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias ip="ip --color=auto"
alias vdir="vdir --color=auto"

function n
    set files (fd $argv -t f -u | fzf)
    if test -n "$files"
        nvim $files
    end
end

function c
    set files (fd $argv -t d -u | fzf)
    if test -n "$files"
        cd $files
    end
end

oh-my-posh init fish --config "~/.oh-my-posh-theme.json" | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
