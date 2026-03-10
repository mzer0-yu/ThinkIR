# ThinkIR 使用指南

## 快速开始

### 1. 基础使用流程

**Step 1**: 进入 ThinkIR 模式
- 将 ThinkIR.txt 的内容粘贴给 LLM
- LLM 会回复 `// ThinkIR Environment Ready.`

**Step 2**: 输入你的需求
- 直接用自然语言描述你的编程任务
- 例如："写一个Python函数来计算斐波那契数列"

**Step 3**: 获取 ThinkIR 输出
- Phase 1: 生成的 ThinkIR 脚本
- Phase 2: 执行结果（代码/文档）

### 2. 模式切换

**Command Line Mode（默认）**
```bash
# 直接输入需求
写一个Python爬虫来抓取网页标题
```

**Execution Mode**
```bash
// use execution mode
# 然后直接粘贴 ThinkIR 脚本
```

**Translation Mode**
```bash
// use translation mode
# 只会生成 ThinkIR 脚本，不会执行
```

**Silent Mode**
```bash
// use silent mode
# 只输出最终结果，不显示 ThinkIR 脚本
```

**Standard Mode**
```bash
// 注释内容
# 正常的 LLM 对话模式
```

## 高级技巧

### 1. 精确控制输出

使用纯净容器过滤不需要的节点：
```cpp
LLMctx main() {
    LLMctx logic = LLMctx::keyword("Python Dev");
    logic.st("Code must include type hints");

    // 推理过程（不会显示在最终输出中）
    id t1 = logic.think("Use list comprehension for efficiency");
    id t2 = logic.think("Add error handling for edge cases");
    logic.link(t1, t2);

    // 只推送最终代码
    LLMctx pure;
    pure.push(logic.program("Create factorial function"));
    return pure;
}
```

### 2. 使用全局记忆

```cpp
LLMctx main() {
    // 访问对话历史
    LLMctx ctx = LLMctx::global();

    // 设置专业领域
    ctx.keyword("Machine Learning");
    ctx.purpose("Explain complex concepts simply");

    return ctx;
}
```

### 3. 约束系统

```cpp
// 添加硬约束
logic.st("Function must be recursive");
logic.st("Include docstrings");
logic.st("Handle negative inputs");

// 逻辑绑定
logic.bind("MAX_ITER", "100");
logic.bind("THRESHOLD", "0.001");
```

## 常见模式

### 1. API 封装
```cpp
LLMctx main() {
    LLMctx logic = LLMctx::keyword("API Developer");
    logic.purpose("Create clean API client wrapper");
    logic.st("Include retry logic and timeout");

    id t1 = logic.think("Identify required endpoints");
    id t2 = logic.think("Design request/response models");
    logic.link(t1, t2);

    LLMctx pure;
    pure.push(logic.program("Python API client for REST service"));
    return pure;
}
```

### 2. 数据处理流水线
```cpp
LLMctx main() {
    LLMctx logic = LLMctx::keyword("Data Engineer");
    logic.purpose("Create data processing pipeline");
    logic.st("Use pandas for data manipulation");
    logic.st("Include logging and progress tracking");

    id t1 = logic.think("Load and validate input data");
    id t2 = logic.think("Transform and clean data");
    id t3 = logic.think("Save processed data");
    logic.link(t1, t2);
    logic.link(t2, t3);

    LLMctx pure;
    pure.push(logic.program("Data processing pipeline with error handling"));
    return pure;
}
```

### 3. 算法实现
```cpp
LLMctx main() {
    LLMctx logic = LLMctx::keyword("Algorithm Developer");
    logic.purpose("Implement efficient algorithm");
    logic.st("Include time complexity analysis");
    logic.st("Add unit test examples");

    id t1 = logic.think("Analyze problem requirements");
    id t2 = logic.think("Design optimal approach");
    id t3 = logic.think("Implement with edge cases");
    logic.link(t1, t2);
    logic.link(t2, t3);

    LLMctx pure;
    pure.push(logic.program("Efficient sorting algorithm implementation"));
    return pure;
}
```

## 调试技巧

### 1. 查看完整推理过程
不使用纯净容器，查看所有节点：
```cpp
// 直接返回 logic 而不是 pure 容器
return logic;
```

### 2. 模块化开发
将复杂任务分解为多个 ThinkIR 脚本：
```cpp
// 先设计架构
LLMctx main() {
    LLMctx logic = LLMctx::keyword("System Architect");
    logic.purpose("Design system architecture");

    // ... 系统设计逻辑

    return logic;
}
```

### 3. 迭代优化
基于生成的代码，修改 ThinkIR 脚本并重新执行：
```cpp
// 修改约束或添加新逻辑
id t4 = logic.st("Optimize for memory usage");
```

## 最佳实践

1. **使用纯净容器** - 过滤推理过程，只显示最终结果
2. **明确约束** - 使用 `st()` 确保代码符合要求
3. **分步构建** - 复杂任务分解为多个简单任务
4. **版本控制** - 重要的 ThinkIR 脚本应该保存在项目中
5. **测试验证** - 生成的代码需要实际测试验证

## 注意事项

1. **LLM 兼容性** - 不同 LLM 对 ThinkIR 的支持程度不同
2. **Token 消耗** - ThinkIR 脚本可能消耗更多 tokens
3. **调试困难** - 复杂的逻辑链难以直接调试
4. **学习成本** - 需要理解 ThinkIR 的语法和概念