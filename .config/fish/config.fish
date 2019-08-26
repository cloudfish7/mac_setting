# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
eval (direnv hook fish)
set -x EDITOR vim
set -xU PYTHONPATH /Library/Python/2.7/site-packages
set -x PATH $HOME/.mycmd $PATH
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.nodebrew/current/bin/ $PATH

#aws cli complemention
complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); /usr/local/bin/aws_completer; end)'

alias cddev="cd ~/Documents/develop/"
alias cddevwork="cd ~/Documents/dev_workspace/"



# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/kawamura/.nodebrew/node/v5.8.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/kawamura/.nodebrew/node/v5.8.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/kawamura/.nodebrew/node/v5.8.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/kawamura/.nodebrew/node/v5.8.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
