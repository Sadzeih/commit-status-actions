#!/bin/bash

set -e
set -o pipefail

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable"
	exit 1
fi

if [[ -z "$GITHUB_REPOSITORY" ]]; then
	echo "Set the GITHUB_REPOSITORY env variable"
	exit 1
fi

URI=https://api.github.com
API_VERSION=v3
API_HEADER="Accept: application/vnd.github.${API_VERSION}+json"
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"

set_commit_status() {
	curl -sSL -H "${AUTH_HEADER}" -H "${API_HEADER}" -d '{"state": "success"}' -H "Content-Type: application/json" -X POST "${URI}/repos/${GITHUB_REPOSITORY}/statuses/${GITHUB_SHA}"
}

set_commit_status
exit 0
