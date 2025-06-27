#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "❌ Error: Please provide a commit message."
  echo "Usage: ./deploy.sh \"Your commit message here\""
  exit 1
fi

COMMIT_MSG="$1"
DEFAULT_BRANCH="master"  # Change to "main" if needed

echo "🔧 Committing changes to $DEFAULT_BRANCH..."
git add .
git commit -m "$COMMIT_MSG"
git push

echo "🛠 Building Vue project..."
npm run build

# Optional: Include custom domain CNAME
# echo 'www.yourdomain.com' > dist/CNAME

echo "🌲 Creating and pushing subtree to gh-pages..."
git subtree split --prefix dist -b deploy-temp
git push origin deploy-temp:refs/heads/gh-pages --force
git branch -D deploy-temp

echo "✅ Deployed to gh-pages successfully!"
