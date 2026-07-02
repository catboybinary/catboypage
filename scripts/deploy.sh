#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/root/catboypage"
NPM="/root/.local/share/nvm/v24.18.0/bin/npm"
BRANCH="main"
REMOTE="origin"

cd "$REPO_DIR"

git fetch "$REMOTE" "$BRANCH"

LOCAL=$(git rev-parse HEAD)
REMOTE_HASH=$(git rev-parse "$REMOTE/$BRANCH")

if [ "$LOCAL" != "$REMOTE_HASH" ]; then
	echo "[$(date -Is)] New commit detected, building..."
	git pull "$REMOTE" "$BRANCH"
	$NPM ci
	$NPM run build
	systemctl restart catboypage-server
	echo "[$(date -Is)] Deploy complete."
else
	echo "[$(date -Is)] No changes."
fi
