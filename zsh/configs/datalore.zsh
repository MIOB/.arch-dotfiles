
export PATH="/home/miob/.datalore/bin:${PATH}"

export DATALORE_HOME="${HOME}/datalore"
export PULLER_TIMEOUT=9999999

function dl-k() {
  local env="$1"
  local profile
  local cluster

  function _kill-sessions() {
    ps ax | grep session-manager | grep '["8440"]' | awk '{ print $1 }' | xargs kill -9 &> /dev/null
    ps ax | grep port_forward_to_eks.sh | grep -v grep | awk '{ print $1 }' | xargs kill -9 &> /dev/null
  }

  case "$env" in
  dev|staging|prod|infra|on-prem-aws|berkeley|analytics)
    profile="default"
    cluster="${env}"
    ;;
  internal)
    profile="datalore-internal"
    cluster="${env}"
    ;;
  stop)
    _kill-sessions
    return 0
    ;;
  *)
    echo "Usage: dl-k dev|staging|prod|infra|on-prem-aws|berkeley|analytics|internal"
    return 1
  esac
  export AWS_PROFILE="${profile}"
  if ! aws sts get-caller-identity --no-cli-pager --profile "${profile}" &> /dev/null; then
    aws sso login --profile "${profile}"
  fi

  _kill-sessions
  () {
    setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR
    "${DATALORE_HOME}/infra/auxilary-scripts/port_forward_to_eks.sh" "${env}" &> /dev/null &
  }
  kubectx "${cluster}"
}

function dl-pf() {
  "${DATALORE_HOME}/infra/auxilary-scripts/port_forward_to_eks.sh" "$@"
}

function dl-docker-minikube() {
  echo "Switching to minikube's docker"
  eval "$(minikube -p minikube docker-env)"
}

function dl-docker-reset() {
  echo "Switching to local docker"
  eval "$(minikube -p minikube docker-env --unset)"
}

function dl-i() {
  (
    dl-docker-minikube
    cd "${DATALORE_HOME}"
    bazel run //docker/datalore:compose-images
    dl-docker-reset
  )
}

function dl-minikube-up() {
  (
    cd "${DATALORE_HOME}"
    infra/kubernetes/scripts/local/start.sh
  )
}

function dl-minikube-down() {
  (
    cd "${DATALORE_HOME}"
    infra/kubernetes/scripts/local/stop.sh
  )
}

function dl-t() {
  (
    cd "${DATALORE_HOME}"
    bazel test //... "$@"
  )
}

function dl-dev() {
  (
    cd "${DATALORE_HOME}"
    bazel run '//notebook/local:datalore'
  )
}

function dl-ea() {
  (
    cd "${DATALORE_HOME}"
    bazel run //docker/datalore/external-agents-manager:image
    docker run --rm \
      --net=host \
      -v /var/run/docker.sock:/var/run/docker.sock \
      registry.internal.datalore.io/datalore/external-agents-manager:latest \
      --access-token 'qwertyuiop' \
      --datalore-host '127.0.0.1' \
      --datalore-port 5123 --cpus 4 --memory 8G --gpus 1
  )
}
