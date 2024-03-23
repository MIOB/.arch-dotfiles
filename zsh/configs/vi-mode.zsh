
function() {
  function vi-prompt() {
    case "${KEYMAP}" in
    viins | main)
      VI_PROMPT='%F{blue}%B[I]%b%f'
    ;;
    vicmd)
      VI_PROMPT="%F{blue}%B[N]%b%f"
      ;;
    *)
      VI_PROMPT=''
    esac
  }

  function zle-keymap-select() {
    if [[ "${KEYMAP}" == 'vicmd' || "$1" == 'block' ]]; then
      echo -ne '\e[2 q'
    elif [[ "${KEYMAP}" == 'main'  || 
	    "${KEYMAP}" == 'viins' ||
	    "${KEYMAP}" == ''      || 
	    "$1" == 'beam'         ]]; then
      echo -ne '\e[6 q'
    fi
    zle vi-prompt
    zle reset-prompt
  }

  function zle-line-init {
    echo -ne '\e[6 q'
    zle vi-prompt
    zle reset-prompt
  }

  zle -N vi-prompt
  zle -N zle-line-init
  zle -N zle-keymap-select

  bindkey -v
  export KEYTIMEOUT=1
  
  bindkey '^[[1;5C' forward-word
  bindkey '^[[1;5D' backward-word

  bindkey '^w' backward-kill-word
}



