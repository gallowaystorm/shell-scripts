#!/bin/bash

# Get profiles
awsProfiles=$(aws configure list-profiles | sort -V)

PS3="Enter a profile number: "

echo "** Select an AWS Profile:"
select profile in $awsProfiles; do
    echo "-> Selected AWS Profile: ${profile}"
    selectedAWSProfile="${profile}"
    break
done

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
export AWS_PROFILE="${selectedAWSProfile}"

checkSelectedAWSProfile=$(aws configure list 2>&1)

# If the profile is SSO and session has expired, try to re-login
if echo "$checkSelectedAWSProfile" | grep 'The SSO session' > /dev/null 2>&1 ; then
    echo "-> SSO session has expired"
    aws sso login
fi

echo "-> Profile Details:"
echo "${checkSelectedAWSProfile}"

echo -e "\n"

# Get EKS Clusters
awsEKSClusters=$(aws eks list-clusters | jq -r '.clusters[]')

PS3="Enter a cluster number: "

echo "** Select an EKS Cluster:"
select cluster in $awsEKSClusters; do
    echo "-> Selected Cluster: ${cluster}"
    selectedEKSCluster="${cluster}"
    break
done

aws eks update-kubeconfig --name="${selectedEKSCluster}"
