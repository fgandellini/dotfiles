# Set terminal to support 256 color schemes
export TERM="xterm-256color"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# Allow to type Bash style comments on command line
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

# Set default editor to VSCode (mainly for tmuxinator)
# export EDITOR="code"

# Set git aliases
# alias gt="git tag \`date +v%y.%m.%d.%H%M\` && git push origin --tags"
alias glolaa="git log --all --graph --decorate --oneline --format=format:\"%C(bold blue)%h%C(reset) %C(green)(%ar)%C(reset) %C(white)%s%C(reset) %C(yellow)%an%C(reset)%C(bold red)%d%C(reset)\""
alias gcb="git checkout -b"
alias gbd="git branch -d"
alias gbD="git branch -D"

# Install utilities, if missing
if [[ ! -a ~/antigen.zsh ]]; then
  echo "Installing antigen..."
  curl -L git.io/antigen > ~/antigen.zsh
fi
if [[ ! -a ~/ngrok ]]; then
  echo "Installing ngrok..."
  curl -L https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > ~/ngrok.zip
  unzip ~/ngrok.zip
  rm -f ~/ngrok.zip
fi

# Other aliases
alias ngrok="~/ngrok"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias mux="tmuxinator"

# Load antigen
source ~/antigen.zsh

# Export env vars
source ~/.env

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle tmuxinator
antigen bundle tmux
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle npm
antigen bundle web-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle Tarrasch/zsh-autoenv
antigen bundle bobsoppe/zsh-ssh-agent

# Install and configure slimline
antigen bundle mgee/slimline

slimline::section::nodejs::init() {
  return 1 # disable Node.js section in slimline
}

slimline::section::nodeprojectversion::precmd() {
  unset slimline_section_nodeprojectversion_output
}

slimline::section::nodeprojectversion::async_task() {
  builtin cd "${1}"
  if [[ ! -f "package.json" ]]; then return; fi
  command node --eval "console.log(require('./package.json').version)"
}

slimline::section::nodeprojectversion::async_task_complete() {
  local output="${2}"
  slimline_section_nodeprojectversion_output="${output}"
}

slimline::section::nodeprojectversion::render() {
  if [[ -z "${slimline_section_nodeprojectversion_output}" ]]; then return; fi
  slimline::utils::expand "nodejs" "%F{white}[%F{green}⬢ |version|%F{white}]%f" \
      "version" "${slimline_section_nodeprojectversion_output}"
}

# Add nodeprojectversion to the right prompt
export SLIMLINE_RIGHT_PROMPT_SECTIONS="|default| nodeprojectversion"

# Tell antigen that you're done.
antigen apply
