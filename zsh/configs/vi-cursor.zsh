
function() {
  function zle-keymap-select() {
  set -u
    if [[ "${KEYMAP}" == 'vicmd' || "$1" == 'block' ]]; then
      echo -ne '\e[2 q'
    elif [[ "${KEYMAP}" == 'main'  || 
	    "${KEYMAP}" == 'viins' ||
	    "${KEYMAP}" == ''      || 
	    "$1" == 'beam'         ]]; then
      echo -ne '\e[6 q'
    fi
  }

  function zle-line-init {
    echo -ne '\e[6 q'
  }

  zle -N zle-line-init
  zle -N zle-keymap-select

  bindkey -v
  export KEYTIMEOUT=1
}



