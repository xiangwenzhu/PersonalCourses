#!/usr/bin/env bash
# 课程站服务器初始化（与服务器当前实际状态一致，仅用于重建参考）。
#
# 架构：
#   - nginx 监听 80 前置分流：
#       course.leozhu.cn     -> 静态文件 /var/www/personalcourses
#       其余（IP 直连/默认）  -> 反代 FinanceAssistant（127.0.0.1:8000，由 FA 仓库的部署体系管理）
#   - 部署为拉取模式：cron 每分钟运行 deploy.sh，git fetch GitHub，
#     有新提交才 rsync 到网站目录。
#     （GitHub Actions 海外 runner 到国内服务器 22 端口不可达，SSH 推送方案不可行）
set -euo pipefail

sudo apt-get update
sudo apt-get install -y nginx rsync git cron

# 1) 克隆仓库
sudo mkdir -p /opt/personalcourses
sudo git clone --depth 20 https://github.com/xiangwenzhu/PersonalCourses.git /opt/personalcourses/repo

# 2) 安装部署脚本与 cron（先把本目录的 deploy.sh、cron-personalcourses scp 到 /tmp）
sudo install -m 755 /tmp/deploy.sh /opt/personalcourses/deploy.sh
sudo install -m 644 /tmp/cron-personalcourses /etc/cron.d/personalcourses

# 3) nginx 站点配置（本目录 nginx/*.conf 先 scp 到 /tmp）
sudo install -m 644 /tmp/course-leozhu.conf /etc/nginx/sites-available/
sudo install -m 644 /tmp/financeassistant-proxy.conf /etc/nginx/sites-available/
sudo ln -sf /etc/nginx/sites-available/course-leozhu.conf /etc/nginx/sites-enabled/
sudo ln -sf /etc/nginx/sites-available/financeassistant-proxy.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# 4) 首次同步网站内容
sudo mkdir -p /var/www/personalcourses
sudo rsync -a --delete \
  --exclude '.git' --exclude '.github' --exclude '.screenshots' \
  --exclude '.trae-html-share-packages' --exclude 'deploy' \
  /opt/personalcourses/repo/ /var/www/personalcourses/

# 5) FinanceAssistant 从 80 挪到 8000（其 deploy.sh 会从 shared/.env 读取该端口）
if [ -f /opt/financeassistant/shared/.env ]; then
  sudo sed -i 's/^FA_PORT=80$/FA_PORT=8000/' /opt/financeassistant/shared/.env
  sudo systemctl restart financeassistant
fi

sudo nginx -t
sudo systemctl enable --now nginx cron
sudo systemctl reload nginx

echo "done: nginx 80 分流 -> course.leozhu.cn 静态 / 其余反代 FA(8000)；cron 每分钟拉取部署"
