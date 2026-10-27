#!/usr/bin/env bash
# 课程站服务器初始化（与服务器当前实际状态一致，仅用于重建参考）。
#
# 当前布局：
#   nginx 监听 80 做前置分流：
#     - course.leozhu.cn      -> 静态文件 /var/www/personalcourses（GitHub Actions rsync）
#     - 其余（IP 直连/默认）   -> 反代 FinanceAssistant（127.0.0.1:8000）
#   FinanceAssistant 由独立仓库部署，通过 /opt/financeassistant/shared/.env 的 FA_PORT=8000 监听。
set -euo pipefail

sudo apt-get update
sudo apt-get install -y nginx rsync

sudo mkdir -p /var/www/personalcourses

# 站点配置在仓库 deploy/nginx/ 下，由初始化时手动 scp 到服务器：
#   scp deploy/nginx/*.conf root@<host>:/etc/nginx/sites-available/
sudo ln -sf /etc/nginx/sites-available/course-leozhu.conf /etc/nginx/sites-enabled/
sudo ln -sf /etc/nginx/sites-available/financeassistant-proxy.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# FinanceAssistant 从 80 挪到 8000（其 deploy.sh 会从 shared/.env 读取该端口）
if [ -f /opt/financeassistant/shared/.env ]; then
  sudo sed -i 's/^FA_PORT=80$/FA_PORT=8000/' /opt/financeassistant/shared/.env
  sudo systemctl restart financeassistant
fi

sudo nginx -t
sudo systemctl enable --now nginx
sudo systemctl reload nginx

echo "done: nginx 80 分流 -> course.leozhu.cn 静态 / 其余反代 FA(8000)"
