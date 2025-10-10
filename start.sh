#!/bin/bash

REPOSITORY=$REPO
ACCESS_TOKEN=$TOKEN

echo "REPO ${REPOSITORY}"
echo "ACCESS_TOKEN ${ACCESS_TOKEN}"

REG_TOKEN=$(curl -k -X POST -H "Authorization: token ${ACCESS_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${REPOSITORY}/actions/runners/registration-token | jq .token --raw-output)

echo "REG_TOKEN ${REG_TOKEN}"

echo "CONTENTS OF /etc/pki/ca-trust/extracted/pem: "
ls /etc/pki/ca-trust/extracted/pem
echo "CONTENTS OF /etc/pki/ca-trust/extracted/pem^^^^^^^^^^^^^^^^"

export GIT_CURL_VERBOSE=1
git ls-remote https://github.com/actions/runner HEAD

cd /home/docker/actions-runner

echo "env:"
env
echo "end of env"

./config.sh --check --url https://github.com/${REPOSITORY} --pat ${ACCESS_TOKEN}
RUNNER_ALLOW_RUNASROOT=${RUNNER_ALLOW_RUNASROOT} ./config.sh --url https://github.com/${REPOSITORY} --token ${REG_TOKEN} --labels SRE-Runner,DEV,${RUNNER_LABELS} --disableupdate --name ${HOSTNAME}_${BUILD_NUMBER}_${RUNNER_SCALED_RANK}

cleanup() {
  echo "Removing runner..."
  ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh &
wait $!
