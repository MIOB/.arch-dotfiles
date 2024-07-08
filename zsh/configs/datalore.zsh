path=("/home/miob/.datalore/bin" $path)
export PATH
export DATALORE_HOME="${HOME}/datalore"

eval "$(dl completions)"

export PULLER_TIMEOUT=9999999
