#!/bin/bash
set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Level 4 ArgoCD Setup...${NC}"

# Check for required environment variables
if [ -z "$GITHUB_USER" ] || [ -z "$GITHUB_PAT" ]; then
    echo -e "${RED}Error: GITHUB_USER and GITHUB_PAT environment variables must be set.${NC}"
    echo "Usage: export GITHUB_USER=your_username"
    echo "Usage: export GITHUB_PAT=your_pat_token"
    exit 1
fi

# Get the current Git Repo URL
REPO_URL=$(git config --get remote.origin.url)
if [ -z "$REPO_URL" ]; then
    echo -e "${RED}Error: Could not determine Git repository URL.${NC}"
    exit 1
fi

# Convert SSH URL to HTTPS if needed for ArgoCD
if [[ "$REPO_URL" == git@* ]]; then
    REPO_URL=${REPO_URL/git@github.com:/https:\/\/github.com\/}
fi

echo "Using Repository: $REPO_URL"

# Create repo-credential.yaml from template
echo "Generating repo-credential.yaml..."
# We use sed to replace variables. Note: We need to handle potential special chars in token?
# Safer approach for the token might be just direct substitution or envsubst if available.
# Using envsubst is cleaner.
export REPO_URL
envsubst < repo-credential.yaml.tpl > repo-credential.yaml

# Apply the secret
echo "Applying repository credentials..."
kubectl apply -f repo-credential.yaml

# Create application.yaml from template (we modified the file to use env var)
echo "Generating application.yaml..."
# We need to make sure we don't overwrite if it's the exact same, but here we treat the on-disk file as the template source 
# effectively or we should have renamed it. 
# actually, I modified the file in place to have ${REPO_URL}. 
# Let's read it, substitute, and apply without saving a bad state back to disk if we can avoid it, 
# or just save to a temp file.

envsubst < application.yaml > application-generated.yaml

# Apply the application
echo "Applying ArgoCD Application..."
kubectl apply -f application-generated.yaml

echo -e "${GREEN}Setup applied successfully!${NC}"
echo "Waiting for Sync status..."
echo "You can check status with: argocd app get devops-app-system"

# Optional: Clean up generated files containing secrets
rm repo-credential.yaml
rm application-generated.yaml
