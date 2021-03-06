#!/bin/bash
set -eo pipefail

echo "Hello Buildkite Agent ${BUILDKITE_AGENT_NAME}"
echo "Hello Buildkite Agent $BUILDKITE_SOURCE"
if [[ "$BUILDKITE_SOURCE" == "webhook" ]]; then
echo "Build Source  webhook"
else
echo "Build Source WEB"
fi

mychange=$(git show --name-only )
echo "Dev changes  ${mychange}"

devchange=$(git show --name-only | grep -i 'Apigee/proxies/helloworld' || true)

if [[ -z ${devchange} ]]; then 
echo "Dev changes not in src "
fi

if [[ -n ${devchange} ]]; then 
echo "Dev changes  in src "
echo "Dev changes  ${devchange}"
fi



if [[ -z ${TF_NAME} ]]; then 
echo "TF_NAME Env Variable not passed"
TF_NAME="apiproxy"
echo "TF_NAME Env Variable value set through scrtip value is  $TF_NAME"
else
echo "TF_NAME Env Variable passed with value $TF_NAME"
fi

checkfld=$(find Apigee/proxies -type d | grep -v 'targets' | grep 'apiproxy' | sort)

echo "Find command with hardcoded value $checkfld"

checkscriptval=$(find Apigee/proxies -type d | grep -v 'targets' | grep "${TF_NAME}" | sort)

echo "Find command with env variable passed value value from script $checkscriptval"

echo "some change"
#checkenv=$(find Apigee/proxies -type d | grep -v 'targets' | grep grep "${UI_VAL}"  | sort)

#echo "Find command with env variable passed value value  $checkenv"



