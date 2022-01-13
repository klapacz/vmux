pwd=$(dirname "$0")

source "$pwd/setup-completion.sh"
export PATH="$PATH:$pwd"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export EDITOR=vmux-editor
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'

  ncd() {  
    nvr -c "cd $(pwd)"
  }
fi
