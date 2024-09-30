path=("/home/miob/.datalore/bin" $path)
export PATH
export DATALORE_HOME="${HOME}/projects/datalore"

eval "$(dl completions)"

export PULLER_TIMEOUT=9999999
