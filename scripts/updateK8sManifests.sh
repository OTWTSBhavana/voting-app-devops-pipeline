#!/bin/bash

set -x

# Set the repository URL
REPO_URL="https://sjlw7yceyye6hdjmob3atctpxn2lrhmzeyebyyacg24ftiplk46a@dev.azure.com/bhanuhiran/voting-app/_git/voting-app"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Define your ACR name
ACR_NAME="bhavanaazurecicd"

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: $ACR_NAME.azurecr.io/$2:$3|g" k8s-specifications/$1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo