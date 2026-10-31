# AGENTS.md

本仓库是个人互动课程库：每门课程是一个独立的单文件 `.html` 页面，由根目录的 [index.html](./index.html) 汇总展示。

## 核心规则：新课程必须同步登记

**创建任何新的课程** **`.html`** **文件后，必须同时在以下两处登记，缺一不可：**

1. **`index.html`**：在 `<div class="grid">` 中新增一张课程卡片，结构与现有卡片一致：

   ```html
   <a class="card" href="你的课程文件.html">
     <span class="tag a">分类 · 子分类</span>
     <h3>课程标题</h3>
     <p>一两句话的课程简介，说清从哪讲起、讲到哪。</p>
     <div class="levels">
       <span class="dot" style="background:var(--l1)"></span>
       <span class="dot" style="background:var(--l2)"></span>
       <span class="dot" style="background:var(--l3)"></span>
       <span class="dot" style="background:var(--l4)"></span>
     </div>
     <span class="more">开始学习 →</span>
   </a>
   ```

   - 分类标签配色：`a`（蓝，理工/技术）、`b`（紫，AI/工程）、`c`（绿，投资/金融），新领域可新增 `--lN` 色值与对应 `.tag.x` 规则。

   **`README.md`**：在「课程列表」表格中新增一行：

   ```markdown
   | 课程标题 | 分类 · 子分类 | [文件名.html](./文件名.html) |
   ```

## 课程文件规范

- 文件放在仓库根目录，命名用小写英文 + 连字符，如 `xxx-course.html`、`xxx-lab.html`。

- 单文件自包含：样式与脚本全部内联，外部依赖仅限 KaTeX 等 CDN，离线打开时正文不受影响。

- 页面 `<title>` 需体现课程主题，便于从浏览器标签识别。

## 完成前自检

- [ ] 新课程 `.html` 文件已创建且能独立打开

- [ ] `index.html` 已新增对应卡片

- [ ] `README.md` 课程列表已新增对应行

三处缺一，视为任务未完成。
