#!/bin/bash

echo "Hello Buildkite Agent $BUILDKITE_AGENT_NAME"
echo "Hello Buildkite Agent $BUILDKITE_SOURCE"
if [[ "$BUILDKITE_SOURCE" == "webhook" ]]; then
echo "Build Source  webhook"
else
echo "Build Source WEB"
fi
