#!/bin/bash
set -e

read -p "Enter AWS Profile: " AWS_PROFILE

echo "You entered '$AWS_PROFILE'"

echo "Setting AWS Profile..."

read -p "Enter AWS region: " AWS_REGION

echo "You entered '$AWS_REGION'"

echo "Setting AWS region..."

export AWS_PROFILE=$AWS_PROFILE

read -p "Enter name of AWS EKS Cluster: " EKS_CLUSTER

echo "You entered '$EKS_CLUSTER'"

echo "Connecting to cluster..."

aws eks --region $AWS_REGION update-kubeconfig --name $EKS_CLUSTER



