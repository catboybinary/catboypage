#!/usr/bin/env fish

set REPO_DIR "/root/catboypage"
set BRANCH "main"
set REMOTE "origin"

nvm use 24

cd "$REPO_DIR"

git fetch "$REMOTE" "$BRANCH"

set LOCAL $(git rev-parse HEAD)
set REMOTE_HASH $(git rev-parse "$REMOTE/$BRANCH")

if [ "$LOCAL" != "$REMOTE_HASH" ]; then
	echo "[$(date -Is)] New commit detected, building..."
	git pull "$REMOTE" "$BRANCH"
	npm ci
	npm run build
	systemctl restart catboypage-server
	echo "[$(date -Is)] Deploy complete."
else
	echo "[$(date -Is)] No changes."
fi
