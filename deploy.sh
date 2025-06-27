
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
echo "🔧 Adding and committing changes to main/master..."
git add .
git commit -m "$COMMIT_MSG"
git push

echo "🛠 Building the Vue project..."
npm run build

echo "🌿 Fetching latest gh-pages branch..."
git fetch origin gh-pages

echo "🌲 Creating subtree split from dist/..."
git subtree split --prefix dist -b deploy-temp

echo "🚀 Checking out gh-pages and merging changes..."
git checkout gh-pages
git pull
git merge deploy-temp

echo "📤 Pushing to origin/gh-pages..."
git push origin gh-pages

echo "🔙 Switching back to main/master..."
git checkout master

echo "🧹 Cleaning up temporary branch..."
git branch -D deploy-temp

echo "✅ Deployment complete!"
