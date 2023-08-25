# docker-image-build-push-ecr


#### Note: 
- Make sure your configure aws iam user for aws cli has enough permissions to push to a repository
- Make sure you have the repo (can be private/public) already created from aws console (or by other means), before running this script
- Make sure you change the build-n-push-to-ecr.sh script's permissions to +x (executable) before running, for linux based users, it will be `chown +x build-n-push-to-ecr.sh`
