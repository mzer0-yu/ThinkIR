# ThinkIR Skill

这个 skill 为 Claude Code 提供 ThinkIR 模式的集成支持，让用户能够方便地在项目中使用 ThinkIR 进行编程任务。

## 功能特性

### 1. **基本 ThinkIR 模式**
- `/thinkir` - 进入 ThinkIR Command Line 模式（默认）
- `/thinkir exec` - 进入 ThinkIR Execution 模式
- `/thinkir translate` - 进入 ThinkIR Translation 模式
- `/thinkir silent` - 进入 ThinkIR Silent 模式

### 2. **自动模式切换**
- `/thinkir rule` - 将 ThinkIR 作为项目的默认规则
- `/thinkir disable` - 禁用项目中的 ThinkIR 规则
- `/thinkir status` - 查看当前 ThinkIR 状态

### 3. **快速操作**
- `/thinkir new` - 创建新的 ThinkIR 脚本模板
- `/thinkir format` - 格式化当前 ThinkIR 输出
- `/thinkir help` - 显示帮助信息

## 使用方法

### 基本使用
```bash
# 进入 ThinkIR 模式
/thinkir

# 直接执行 ThinkIR 脚本
/thinkir exec

# 创建新的 ThinkIR 脚本
/thinkir new
```

### 项目集成
```bash
# 将 ThinkIR 作为项目默认规则
/thinkir rule

# 查看项目状态
/thinkir status

# 临时禁用 ThinkIR 规则
/thinkir disable
```

## 输出格式

ThinkIR skill 会自动处理输出格式：

1. **Phase 1**: 显示生成的 ThinkIR 脚本
2. **Phase 2**: 显示拓扑结构和节点内容

## 配置文件

Skill 会在项目根目录创建 `.thinkir-config` 文件：
```json
{
  "default_mode": "command_line",
  "auto_format": true,
  "version": "1.18.71"
}
```

## 兼容性

支持以下 LLM：
- Gemini 3 Fast/3 Thinking/3.1 Pro: ✅ 非常好
- DeepSeek v4: ✅ 非常好
- GPT-5.3: ✅ 好
- Claude Sonnet 4.6: ⚠️ 一般