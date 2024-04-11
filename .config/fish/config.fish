if test "$TERM" = "linux"
	exec bash
end

set -U fish_greeting
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x ANDROID_HOME /opt/android-sdk/
set -x PATH $PATH /opt/insomnia ~/.local/share/gem/ruby/3.0.0/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/emulator $ANDROID_HOME/cmdline-tools/latest
set -x DOTNET_CLI_TELEMETRY_OPTOUT 1

alias cat=bat
alias dir="dir --color=auto"
alias ls="ls --color=auto"
alias l=ls
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias ip="ip --color=auto"
alias vdir="vdir --color=auto"
alias ghce="gh copilot explain --"
alias ghcs="gh copilot suggest --"

function oil
	if test -z "$argv"
		set argv .
	end
	set SHELL "fish -c 'nvim -u ~/.config/nvim/oil_init.lua $argv'"
	foot -c ~/.config/foot/oil.ini &; disown
end

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

# opam configuration
source /home/philipp/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
