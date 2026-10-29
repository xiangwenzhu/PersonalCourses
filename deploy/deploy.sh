#!/usr/bin/env bash
# 拉取式部署：fetch 检查新提交，有变更才同步到网站目录。
# 由 cron 每分钟调用（/etc/cron.d/personalcourses），flock 防并发。
#
# 服务器直连 GitHub 间歇超时，故用 gh-proxy 镜像作为主源、直连兜底。
# 镜像 URL 对 fetch 通用（任意 ref），不可用于 pull 的裸 info/refs 端点。
set -euo pipefail
REPO=/opt/personalcourses/repo
DEST=/var/www/personalcourses
LOG=/var/log/personalcourses-deploy.log
MIRROR="https://gh-proxy.com/https://github.com/xiangwenzhu/PersonalCourses.git"

cd "$REPO"
old=$(git rev-parse HEAD)

# 先走镜像，失败走直连，都失败则本轮放弃（下一分钟再试）
if ! git fetch --depth 20 "$MIRROR" main 2>>"$LOG"; then
  echo "$(date -Is) mirror fetch failed, trying direct" >>"$LOG"
  git fetch --depth 20 origin main 2>>"$LOG"
fi
new=$(git rev-parse FETCH_HEAD)

[ "$old" = "$new" ] && exit 0

git reset --hard "$new" >>"$LOG" 2>&1
rsync -a --delete \
  --exclude '.git' --exclude '.github' --exclude '.screenshots' \
  --exclude '.trae-html-share-packages' --exclude 'deploy' \
  "$REPO"/ "$DEST"/
echo "$(date -Is) deployed $new" >>"$LOG"
