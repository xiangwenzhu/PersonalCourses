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
| 微电网 · 学习路径（系列入口页） | 能源 · 电力系统 | [microgrid-hub.html](./microgrid-hub.html) |
| 微电网入门 | 能源 · 电力系统 | [microgrid-basics.html](./microgrid-basics.html) |
| 微电网的组成与关键设备 | 能源 · 电力系统 | [microgrid-components.html](./microgrid-components.html) |
| 微电网拓扑结构 | 能源 · 电力系统 | [microgrid-topology.html](./microgrid-topology.html) |
| 微电网运行模式与控制 | 能源 · 电力系统 | [microgrid-control.html](./microgrid-control.html) |
| 微电网能量管理与优化调度 | 能源 · 电力系统 | [microgrid-ems.html](./microgrid-ems.html) |
| 微电网保护与安全 | 能源 · 电力系统 | [microgrid-protection.html](./microgrid-protection.html) |
| 微电网标准、经济与工程实践 | 能源 · 电力系统 | [microgrid-practice.html](./microgrid-practice.html) |
| Microduck 复刻工程（12 课系列，入口页） | 机器人 · 具身智能 | [microduck.html](./microduck.html) |
| 生物信息学学习路径（系列入口页） | 生物信息学 · 学习路线 | [bioinfo-track.html](./bioinfo-track.html) |
| 大模型微调 · 学习路径（系列入口页） | AI 工程 · 学习路线 | [llm-finetuning.html](./llm-finetuning.html) |
| 生物信息学导论：从中心法则到数据库 | 生物信息学 · 导论 | [bioinfo-101-course.html](./bioinfo-101-course.html) |
| 生物学基础速成：DNA、RNA 与蛋白质 | 生物信息学 · 生物学 | [bioinfo-biology-crash-course.html](./bioinfo-biology-crash-course.html) |
| 大模型微调 · 第 1 课：微调的直觉与决策 | AI 工程 · 大模型微调 | [llm-finetuning-01-foundations.html](./llm-finetuning-01-foundations.html) |
| 大模型微调 · 第 2 课：LoRA 原理与调参 | AI 工程 · 大模型微调 | [llm-finetuning-02-lora.html](./llm-finetuning-02-lora.html) |
| 大模型微调 · 第 3 课：数据工程与 SFT 实战 | AI 工程 · 大模型微调 | [llm-finetuning-03-data.html](./llm-finetuning-03-data.html) |
| 大模型微调 · 第 4 课：训练机制与超参 | AI 工程 · 大模型微调 | [llm-finetuning-04-training.html](./llm-finetuning-04-training.html) |
| 大模型微调 · 第 5 课：评估、对齐与上线 | AI 工程 · 大模型微调 | [llm-finetuning-05-alignment.html](./llm-finetuning-05-alignment.html) |
| 生信人的 Linux 命令行实战 | 生物信息学 · 工具链 | [bioinfo-linux-course.html](./bioinfo-linux-course.html) |
| 生信文件格式完全指南：FASTA 到 VCF | 生物信息学 · 工具链 | [bioinfo-file-formats-course.html](./bioinfo-file-formats-course.html) |
| 序列比对：从打分矩阵到 BLAST | 生物信息学 · 算法 | [bioinfo-alignment-course.html](./bioinfo-alignment-course.html) |

## 使用方式

- 本地直接双击对应的 `.html` 文件，或拖进浏览器打开即可。
- 也可以部署到任意静态托管服务（GitHub Pages、Netlify 等）后通过链接访问。
- 数学公式通过 KaTeX 的 CDN 渲染，离线打开时公式会退化为普通文本，其余内容不受影响。

## 新增课程

按同样的方式新增一个单文件 `.html` 课程，并**必须**同时在 [index.html](./index.html) 补一张卡片、在上面的课程列表里补一行记录。详细规则见 [AGENTS.md](./AGENTS.md)。
