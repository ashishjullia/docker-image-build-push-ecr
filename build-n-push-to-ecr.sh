#!/bin/bash

# Note: 
# 1. Make sure your configure aws iam user for aws cli has enough permissions to push to a repository
# 2. Make sure you have the repo (can be private/public) already created from aws console (or by other means), before running this script
# 3. Make sure you change the build-n-push-to-ecr.sh script's permissions to +x (executable) before running, for linux based users, it will be chown +x build-n-push-to-ecr.sh

# Set your AWS region and ECR repository name
AWS_REGION="us-east-1"
ECR_REPOSITORY="my-hello-world-ecr"
ACCOUNT_NUMBER=<your-aws-account-number>

# Set the image name and tag
IMAGE_NAME="my-hello-world-ecr"
IMAGE_TAG="latest"

# Build the Docker image
docker build \
    -t $IMAGE_NAME .

# Get the ECR login command
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_NUMBER.dkr.ecr.$AWS_REGION.amazonaws.com 

# Log in to ECR
# eval $ECR_LOGIN

# Tag the image with ECR repository information
ECR_IMAGE_URI="$ACCOUNT_NUMBER.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG"
docker tag $IMAGE_NAME:latest $ECR_IMAGE_URI

# Push the image to ECR
docker push $ECR_IMAGE_URI

# Clean up local Docker images (optional)
docker rmi $IMAGE_NAME:latest $ECR_IMAGE_URI
