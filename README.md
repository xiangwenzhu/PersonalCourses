# PersonalCourses

这个仓库用来存放我自己感兴趣的一些主题的 **互动式 HTML 课程**。

每门课程都是一个独立的单文件 HTML 页面，直接用浏览器打开就能看，不需要安装依赖、也不需要构建步骤。页面里包含分层讲解、图表/交互演示和小测验，适合当作自学笔记与入门材料。

## 课程列表

| 课程 | 主题 | 文件 |
| --- | --- | --- |
| 快速傅里叶变换（FFT） | 信号处理 · 数学 | [fft-course.html](./fft-course.html) |
| Pi Agent 入门到进阶 | AI Agent · 工程实践 | [pi-agent-course.html](./pi-agent-course.html) |
| 邓普顿的逆向投资方法 | 投资 · 金融 | [templeton-course.html](./templeton-course.html) |
| 读懂高赔率逆向评估报告（宁德时代案例） | 投资 · 金融 | [catl-report-course.html](./catl-report-course.html) |
| 股票估值指标互动实验室 | 投资 · 金融工具 | [stock-valuation-lab.html](./stock-valuation-lab.html) |
| Microduck 复刻工程（12 课系列，入口页） | 机器人 · 具身智能 | [microduck.html](./microduck.html) |

## 使用方式

- 本地直接双击对应的 `.html` 文件，或拖进浏览器打开即可。
- 也可以部署到任意静态托管服务（GitHub Pages、Netlify 等）后通过链接访问。
- 数学公式通过 KaTeX 的 CDN 渲染，离线打开时公式会退化为普通文本，其余内容不受影响。

## 新增课程

按同样的方式新增一个单文件 `.html` 课程，并**必须**同时在 [index.html](./index.html) 补一张卡片、在上面的课程列表里补一行记录。详细规则见 [AGENTS.md](./AGENTS.md)。
