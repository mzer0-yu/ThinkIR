# ThinkIR 工具包总结

本文档总结了 ThinkIR 项目中所有新增的工具和模板，帮助您快速上手使用 ThinkIR。

## 📁 文件结构

```
ThinkIR/
├── README.md                      # 主文档（已更新）
├── ThinkIR.txt                    # 核心规范文档
├── CLAUDE.md                      # Claude Code 集成指南
├── TOOLKIT_SUMMARY.md             # 本总结文档
│
├── skill-thinkir.md              # ThinkIR skill 规范
├── .thinkir-rules.md             # 基础使用规则
├── .thinkir-project-rules.md     # 项目集成规则
│
├── templates/
│   └── thinkir-template.cpp       # 标准模板
│
├── scripts/
│   └── thinkir-init.sh           # 初始化脚本
│
└── THINKIR_USAGE.md              # 详细使用指南
```

## 🚀 快速开始

### 步骤 1：使用初始化脚本
```bash
# 运行初始化脚本（自动创建目录结构）
./scripts/thinkir-init.sh
```

### 步骤 2：进入 ThinkIR 模式
1. 将 `ThinkIR.txt` 的内容粘贴给您的 LLM
2. 等待响应：`// ThinkIR Environment Ready.`

### 步骤 3：开始使用
- **Command Line Mode**（默认）：直接输入自然语言
- **其他模式**：使用模式切换指令

## 🎯 工具说明

### 1. Skill 系统 (`skill-thinkir.md`)

虽然无法直接创建 Claude Code skill，但这个文档定义了 ThinkIR skill 的规范：

- **基本模式**：Command Line, Execution, Translation, Silent, Standard
- **自动控制**：格式化输出、模式切换、环境管理
- **项目集成**：规则注入、模板管理

### 2. 规则系统

#### 基础规则 (`.thinkir-rules.md`)
- 模式检测和切换
- 输出格式规范
- 快捷指令定义

#### 项目规则 (`.thinkir-project-rules.md`)
- 项目集成规范
- 团队协作指南
- 质量保证流程

### 3. 模板系统

#### 标准模板 (`templates/thinkir-template.cpp`)
```cpp
#include "ThinkIR.hpp"

LLMctx main() {
    LLMctx logic = LLMctx::keyword("[Domain]");
    logic.purpose("[Objective]");
    logic.st("[Constraints]");

    id t1 = logic.think("[Step 1]");
    id t2 = logic.think("[Step 2]");
    logic.link(t1, t2);

    LLMctx pure;
    pure.push(logic.program("[Intent]"));
    return pure;
}
```

### 4. 自动化工具

#### 初始化脚本 (`scripts/thinkir-init.sh`)
- 自动创建目录结构
- 检查环境
- 显示配置信息
- 提供使用提示

## 📚 使用指南

### 详细文档
- **THINKIR_USAGE.md**：完整的使用教程，包含：
  - 基础使用流程
  - 高级技巧
  - 常见模式
  - 调试方法

### 实践示例
查看 README.md 中的：
- 天气 API 示例
- 比较分析
- 完整的使用说明

## 🔧 项目集成方法

### 1. 新项目
```bash
# 1. 克隆 ThinkIR
# 2. 运行初始化脚本
# 3. 设置项目规则
# 4. 开始开发
```

### 2. 现有项目
```bash
# 1. 添加 ThinkIR 目录
mkdir -p thinkir/{scripts,templates,examples}

# 2. 复制模板
cp templates/thinkir-template.cpp thinkir/templates/

# 3. 创建项目规则
echo "// Project-specific rules" > .thinkir-project-rules

# 4. 更新 README
```

## 🎯 最佳实践

### 1. 模式选择
- **Command Line**：探索性任务
- **Execution**：重复性任务
- **Translation**：学习和调试
- **Silent**：生产环境
- **Standard**：正常对话

### 2. 脚本管理
- 使用版本控制管理关键脚本
- 为不同类型的项目创建模板
- 记录成功案例供参考

### 3. 团队协作
- 统一使用项目规则
- 共享模板和最佳实践
- 定期 review 生成质量

## 🔍 故障排除

### 常见问题
1. **LLM 不响应 ThinkIR**：
   - 检查 LLM 是否支持提示词注入
   - 尝试不同的 LLM

2. **输出格式错误**：
   - 确认是否在正确的模式
   - 检查输入是否被正确识别

3. **约束不生效**：
   - 检查语法是否正确
   - 确认约束是否合理

### 调试步骤
1. 使用 Translation 模式查看脚本
2. 逐步测试节点
3. 检查链接关系

## 🚀 下一步

1. **阅读详细指南**：`THINKIR_USAGE.md`
2. **尝试示例**：修改 README 中的示例
3. **创建自己的模板**：根据项目需求定制
4. **分享经验**：贡献到社区

## 📞 支持

- 查阅 `ThinkIR.txt` 了解完整规范
- 使用 `THINKIR_USAGE.md` 获取详细帮助
- 查看 `CLAUDE.md` 了解开发集成