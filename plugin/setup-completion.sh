if [ -n "$ZSH_VERSION" ]; then
  first_arg_possibilities="new list attach send"

  function list_vmux_sessions() {
    abduco -l | awk '$NF ~ /^vmux-/ { gsub("vmux-", "", $NF); print($NF); }'
  }

  function _vmux_attach {
    _arguments -C "1: :($(list_vmux_sessions))" "*::arg:->args"
  }

  function _vmux {
    local _line
    _arguments -C "1: :($first_arg_possibilities)" "*::arg:->args"

    case $line[1] in
      attach) _vmux_attach ;;
      send) _vmux_attach
    esac
  }
  compdef _vmux vmux  
fi

