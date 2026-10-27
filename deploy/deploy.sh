#!/usr/bin/env bash
# 拉取式部署：git fetch 检查新提交，有变更才同步到网站目录。
# 由 cron 每分钟调用（见 /etc/cron.d/personalcourses），flock 防并发。
set -euo pipefail
REPO=/opt/personalcourses/repo
DEST=/var/www/personalcourses
LOG=/var/log/personalcourses-deploy.log

cd "$REPO"
old=$(git rev-parse HEAD)
git fetch --depth 20 origin main 2>>"$LOG"
new=$(git rev-parse origin/main)
[ "$old" = "$new" ] && exit 0

git reset --hard origin/main >>"$LOG" 2>&1
rsync -a --delete \
  --exclude '.git' --exclude '.github' --exclude '.screenshots' \
  --exclude '.trae-html-share-packages' --exclude 'deploy' \
  "$REPO"/ "$DEST"/
echo "$(date -Is) deployed $new" >> "$LOG"
