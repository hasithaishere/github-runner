#!/bin/bash

get_latest_runner_version() {
  curl --silent "https://api.github.com/repos/actions/runner/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                                        # Get tag line
    sed -E 's/.*"v([^"]+)".*/\1/'                                               # Pluck JSON value
}

LATEST_RUNNER_VERSION=$(get_latest_runner_version)
DOCKER_HUB_UNAME=${1}
DOCKER_HUB_PWD=${2}
BASE_IMAGE_OS=${3:-ubuntu}
BASE_IMAGE_TAG=${4:-20.04}

CURRENT_TAG="$LATEST_RUNNER_VERSION-$BASE_IMAGE_OS$BASE_IMAGE_TAG"
BASE_IMAGE="${BASE_IMAGE_OS}:${BASE_IMAGE_TAG}"
TEMP_DOCKER_FILE="dockerfile.$BASE_IMAGE_OS.build"

cp "dockerfile.$BASE_IMAGE_OS" $TEMP_DOCKER_FILE
sed -i "s/__BASE_IMAGE__/$BASE_IMAGE/g" $TEMP_DOCKER_FILE

#Build container: docker build [OPTIONS] PATH
docker build --build-arg RUNNER_VERSION=$LATEST_RUNNER_VERSION -t $DOCKER_HUB_UNAME/github-runner -t $DOCKER_HUB_UNAME/github-runner:$CURRENT_TAG -f $TEMP_DOCKER_FILE .

echo "$DOCKER_HUB_PWD" | docker login --username="$DOCKER_HUB_UNAME" --password-stdin

docker push $DOCKER_HUB_UNAME/github-runner:$CURRENT_TAG

docker push $DOCKER_HUB_UNAME/github-runner

rm -rf $TEMP_DOCKER_FILE