#!/bin/bash

echo "Hello Buildkite Agent $BUILDKITE_AGENT_NAME"
echo "Hello Buildkite Agent $BUILDKITE_SOURCE"
if [[ "$BUILDKITE_SOURCE" == "webhook" ]]; then
echo "Build Source  webhook"
else
echo "Build Source WEB"
fi

devchange=$(git log -n 20 --name-only --oneline --pretty="" | src )

echo "Dev changes Agent $devchange"

if [[ -z ${TF_NAME} ]]; then 
echo "TF_NAME Env Variable not passed"
TF_NAME="platform"
echo "TF_NAME Env Variable value set through scrtip value is  $TF_NAME"
else
echo "TF_NAME Env Variable passed with value $TF_NAME"
fi

if [[( -n $devchange )]]; then
echo "Dev changes Found"
fi
