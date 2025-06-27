
#!/bin/bash
# Exit on error
set -e
# Ensure a commit message is provided
if [ -z "$1" ]; then
  echo "❌ Error: Please provide a commit message."
  echo "Usage: ./deploy.sh \"Your commit message here\""
  exit 1
fi
COMMIT_MSG="$1"

echo "🛠 Building the Vue project..."
npm run build

echo "🔧 Adding and committing changes to main/master..."
git add .
git commit -m "$COMMIT_MSG"
git push

echo "🚀 Deploying to gh-pages via subtree..."
git subtree split --prefix dist -b deploy-temp
git push origin deploy-temp:refs/heads/gh-pages --force
git branch -D deploy-temp

echo "✅ Deployment complete!"
