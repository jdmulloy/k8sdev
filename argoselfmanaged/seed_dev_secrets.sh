#!/bin/bash

if ! vault secrets list | grep secret/ ; then
    vault secrets enable --path secret kv-v2
fi

if ! vault auth list | grep kubernetes/ ; then
    vault auth enable kubernetes
fi

if ! vault auth list | grep approle/ ; then
    vault auth enable approle
fi


vault kv put secret/jenkins jenkins_personal_access_token=$GITHUB_TOKEN
vault write sys/policy/jenkins policy=@vault-policies/jenkins.hcl


vault write auth/kubernetes/role/jenkins \
    bound_service_account_names=jenkins \
    bound_service_account_namespaces=jenkins \
    policies=jenkins \
    ttl=1h
