# ThinkIR - Think Intermediate Representation, TIR

[TOC]

## 目录
- [项目概述](#项目概述)
- [快速开始](#快速开始)
- [工具和模板](#工具和模板)
- [使用指南](#使用指南)
- [项目集成](#项目集成)
- [高级特性](#高级特性)

## 项目概述

## 核心理念

使用自然语言来进行人类和 LLM 间的对话是低效率的，因为自然语言是弱逻辑和低熵的。

- **强逻辑输入**: 需要一种强逻辑性并且对 LLM 友好的输入语言，使用伪代码来操控 LLM 的思维链和输出结果
- **解压过程**: 将 **提示词 --> 程序代码** 的过程视作是 LLM 的解压过程，与 LLM 的训练过程相反，训练是一个压缩过程
- **降低随机性**: Vibe Coding 是 **自然语言 --> 程序代码** 的解压过程，这个过程是高度随机的。使用 **自然语言 --> IR（中间语言）--> 程序代码** 来降低随机性并提高可控性，IR 可以被人为修改和微调
- **可重现性**: 在数百轮沟通后，LLM 终于生成了你想要的编程结果。执行 **程序代码 --> IR**，可以告诉你 **如何一次性让 LLM 生成此结果**

**不要向别人分享你的提示词，而是分享你的 IR。提示词生成的代码的过程是高度随机的，但是 IR 生成代码的过程是高度可控的。**

## 工具和模板

ThinkIR 提供了一套完整的工具和模板，帮助您更有效地使用 ThinkIR：

### 🛠️ 核心工具

1. **Skill 支持** - 集成 ThinkIR 到您的开发工作流
   - `skill-thinkir.md` - ThinkIR skill 规范文档
   - 支持多种模式切换和自动格式化

2. **项目规则** - 标准化 ThinkIR 在项目中的使用
   - `.thinkir-rules.md` - 基础使用规则
   - `.thinkir-project-rules.md` - 项目集成规范

3. **模板系统** - 快速创建 ThinkIR 脚本
   - `templates/thinkir-template.cpp` - 标准模板
   - 支持自定义模板和项目特定规则

4. **初始化脚本** - 快速设置 ThinkIR 环境
   - `scripts/thinkir-init.sh` - 自动化环境设置
   - 创建必要的目录结构

### 📚 文档资源

1. **使用指南** - 详细的使用教程和最佳实践
   - `THINKIR_USAGE.md` - 完整使用指南
   - 包含常见模式和调试技巧

2. **规范文档** - 语言规范和参考
   - `ThinkIR.txt` - 完整语言规范（v1.18.71）
   - 包含所有操作符和执行规则
   
## About ThinkIR

我们设计了一个被称为ThinkIR的脚本语言，它介于自然语言和编程语言之间。用于将 Vibe Coding 变得精细化和可控制，而不是由LLM随机产生垃圾代码。将ThinkIR.txt输入给LLM，即可让LLM进入ThinkIR模式。ThinkIR是使用C++语法的伪代码脚本语言。

## 快速开始

### 方法一：使用初始化脚本（推荐）

```bash
# 1. 运行初始化脚本
./scripts/thinkir-init.sh

# 2. 复制 ThinkIR.txt 内容到 LLM
# 3. 等待确认响应：// ThinkIR Environment Ready.
# 4. 开始使用 ThinkIR
```

### 方法二：手动设置

```bash
# 1. 创建项目目录结构
mkdir -p thinkir/{scripts,templates,examples}

# 2. 复制模板
cp templates/thinkir-template.cpp thinkir/templates/

# 3. 复制规则文件
cp .thinkir-rules.md thinkir/rules.md

# 4. 使用 ThinkIR.txt 进入模式
```

### 基本使用流程

1. **加载规范**：将 ThinkIR.txt 内容粘贴给 LLM
2. **确认模式**：等待 `// ThinkIR Environment Ready.`
3. **输入指令**：
   - 直接输入自然语言（Command Line Mode）
   - 或使用模式切换指令
4. **获取输出**：查看 Phase 1（脚本）和 Phase 2（结果）

## 快速命令

### 模式切换
```bash
// use execution mode          # 执行模式
// use translation mode       # 翻译模式
// use silent mode            # 静默模式
// use standard mode          # 标准模式（// 开头）
```

### 常用操作
```bash
# 创建新脚本
/thinkir new

# 查看项目规则
/thinkir rules

# 格式化输出
/thinkir format
```

## Quick Start with Gemini

将ThinkIR.txt输入给LLM，或是将ThinkIR.txt中的内容粘贴并输入给LLM，即可进入ThinkIR模式。

<img width="587" height="1195" alt="image" src="https://github.com/user-attachments/assets/b15f74b0-f4d8-4c4b-b5f5-4befce15ef0b" />

## Samples

以下是 ThinkIR 脚本的示例，由 LLM 通过自然语言"write a program to get local weather information"生成。

通过自然语言来产生 ThinkIR 脚本被称为 Phase 1（翻译）。

```cpp
#include "ThinkIR.hpp"

/*
 * Goal: Create a Python program to fetch local weather information.
 * * Logic Chain:
 * 1. Choice of API: Open-Meteo is preferred for 2026 local scripts because it is 
 * free for non-commercial use and requires no API key (reducing user friction).
 * 2. Geolocation: To get "local" weather automatically, we need the user's IP-based 
 * coordinates or a manual city input. I will implement a robust city-based lookup.
 * 3. Library: Use 'requests' for HTTP calls.
 */

LLMctx main() {
    LLMctx logic = LLMctx::keyword("Python Weather Development");
    
    // Define logic nodes
    id t1 = logic.think("Utilize Open-Meteo API for high-resolution, keyless weather data.");
    id t2 = logic.think("Incorporate geocoding to translate city names into latitude/longitude.");
    id t3 = logic.think("Fetch current temperature, wind speed, and weather codes.");
    
    logic.link(t1, t2);
    logic.link(t2, t3);

    // Create a pure artifact container for the final response
    LLMctx pure;
    
    string code_intent = "A Python script using requests to fetch weather for a city via Open-Meteo. "
                         "Includes error handling and displays temperature, wind, and conditions.";
    
    pure.push(logic.program(code_intent));
    
    return pure;
}
```

执行该 ThinkIR 脚本后会产生最终输出，这被称为 Phase 2（执行）。

执行结果可能包含多个文本片段，包含多个程序文件及文档，每个文本片段被视为一个 node。

先输出 [Phase 2: Topology]，即node之间的图拓扑关系。然后输出[Phase 2: Nodes]，即每个node的文本内容。

以下是 ThinkIR 脚本执行结果（仅有一个 node）：

```python
import requests

def get_weather(city_name):
    """
    Fetches weather data for a specified city using Open-Meteo (No API Key required).
    """
    # 1. Geocoding: Get Lat/Lon for the city
    geo_url = f"https://geocoding-api.open-meteo.com/v1/search?name={city_name}&count=1&language=en&format=json"
    
    try:
        geo_response = requests.get(geo_url)
        geo_response.raise_for_status()
        geo_data = geo_response.json()
        
        if not geo_data.get('results'):
            return f"Error: Could not find coordinates for '{city_name}'."
            
        location = geo_data['results'][0]
        lat, lon = location['latitude'], location['longitude']
        display_name = f"{location['name']}, {location.get('admin1', '')} {location['country']}"

        # 2. Weather Fetch: Get current conditions
        weather_url = "https://api.open-meteo.com/v1/forecast"
        params = {
            "latitude": lat,
            "longitude": lon,
            "current_weather": True,
            "windspeed_unit": "kmh",
            "timezone": "auto"
        }
        
        weather_response = requests.get(weather_url, params=params)
        weather_response.raise_for_status()
        data = weather_response.json()
        
        current = data['current_weather']
        
        return {
            "location": display_name,
            "temp": current['temperature'],
            "wind": current['windspeed'],
            "code": current['weathercode']
        }

    except Exception as e:
        return f"Request failed: {e}"

# Example Usage
if __name__ == "__main__":
    city = input("Enter a city name: ")
    result = get_weather(city)
    
    if isinstance(result, dict):
        print(f"\n--- Weather for {result['location']} ---")
        print(f"Temperature: {result['temp']}°C")
        print(f"Wind Speed:  {result['wind']} km/h")
        print(f"Weather Code: {result['code']} (Refer to WMO codes for descriptions)")
    else:
        print(result)
```

## Comparison

ThinkIR 提示词：
```
TIR: Hangzhou's weather
```
LLM 输出：
```
[Phase 2: Topology]
edge[0]: node[0] (Integrated inference from Logic Graph)

[Phase 2: Nodes]
node[0]: [Think]
In Hangzhou, it is currently 9°C and mostly cloudy. Today's forecast calls for cloudy skies with a high of 13°C and a low of 2°C.
```
自然语言提示词：
```
// Hangzhou's weather
```
LLM 输出：
```
In Hangzhou, it is currently 9°C and mostly cloudy. Today's forecast calls for cloudy skies with a high of 13°C and a low of 2°C.
```
以上案例说明，ThinkIR 模式下的输出，相比于自然语言并不会有显著区别。但是，ThinkIR 模式同时输出了 ThinkIR 脚本，可以用于精调输出结果。
ThinkIR 提示词：
```
TIR: Hangzhou's weather
```
LLM 输出的 ThinkIR 脚本：
```
#include "ThinkIR.hpp"

/*
 * Goal: Retrieve and structure Hangzhou's current weather and forecast.
 * Context: Hangzhou, 2026-03-09.
 */

LLMctx main() {
    LLMctx logic = LLMctx::keyword("Meteorological Data Retrieval");
    
    // Logic nodes based on current search result data
    id t1 = logic.think("Hangzhou current: 9°C, mostly cloudy, 71% humidity.");
    id t2 = logic.think("Wind: 5 mph from North.");
    id t3 = logic.think("Today's forecast: High 13°C, Low 2°C, predominantly cloudy.");
    
    logic.link(t1, t3);
    
    // Selective output for a clean report
    LLMctx pure;
    string report = logic.create("Structure Hangzhou's weather report with current conditions and daily range.");
    pure.push(report);
    
    return pure;
}
```
人工修改 ThinkIR 脚本，添加一行 st 命令：
```
id t4 = logic.st("accurate temperature changes"); // ONLY ADD THIS LINE
```
完整 ThinkIR 脚本：
```
#include "ThinkIR.hpp"

LLMctx main() {
    LLMctx logic = LLMctx::keyword("Meteorological Data Retrieval");
    
    id t1 = logic.think("Hangzhou current: 9°C, mostly cloudy, 71% humidity.");
    id t2 = logic.think("Wind: 5 mph from North.");
    id t3 = logic.think("Today's forecast: High 13°C, Low 2°C, predominantly cloudy.");
    id t4 = logic.st("accurate temperature changes"); // ONLY ADD THIS LINE
    
    logic.link(t1, t3);
    
    LLMctx pure;
    string report = logic.create("Structure Hangzhou's weather report with current conditions and daily range.");
    pure.push(report);
    
    return pure;
}
```
LLM 执行结果：
```
[Phase 2: Topology]
edge[0]: node[0] (Logic Graph Projection)

[Phase 2: Nodes]
node[0]: [Think]
Hangzhou Meteorological Data Report (2026-03-09)

1. Current Atmospheric State

Temperature: 9°C

Sky Conditions: Mostly Cloudy

Humidity: 71%

Wind: 5 mph from the North

2. Forecast & Thermal Gradient Analysis

Temperature Range: 2°C (Low) to 13°C (High)

Sky Trend: Predominantly cloudy throughout the day.

Thermal Analysis (st: accurate temperature changes): An 11°C diurnal temperature swing is observed. The transition from the 13°C peak to the 2°C trough represents a high-velocity cooling gradient, critical for systems requiring sub-mK thermal stability or active compensation.
```

## Instructions

LLMctx（LLM Context）是基本数据对象，它有以下方法：

| 方法 | 效果 |
| --- | --- |
| think | 思考 |
| st | 强约束 |
| bind | 逻辑绑定 |
| keyword | 每次思考时回顾 |
| purpose | 思考的主题 |
| push | 压栈输出 |
| create | 生成文档 |
| program | 生成程序 |

我们要求LLM模拟一个ThinkIR解释器，LLM先读取ThinkIR脚本的指令，然后逐行执行并输出结果。

如果用户输入自然语言，则先充当ThinkIR翻译器，将自然语言翻译到ThinkIR脚本，然后再执行脚本。

## Modes

输入 ThinkIR.txt 后，LLM 有以下工作模式：

* 命令行模式。对于任何自然语言输入，都先翻译成 ThinkIR 脚本，然后再执行该 脚本。即 Phase 1 + Phase 2。
* 执行模式。将所有输入视为 ThinkIR 脚本，只执行 Phase 2。
* 翻译模式。将所有输入视为自然语言，只执行 Phase 1。
* 静默模式。这是个特殊模式，通常仅用于调试。命令行模式的基础上，将 Phase 1 视为隐式思维链，执行 Phase 1 但是不输出 Phase 1的内容，使得输出结果只有 Phase 2。
* 常规模式。使用 // 或 /**/ 将输入注释，或者使用提示词退出 ThinkIR 模式，LLM 将输入完全理解为自然语言并产生常规输出。

默认为命令行模式，通过提示词来切换模式。
切换成执行模式的提示词：
```
// use execution mode
```

常规模式输入：
```
// hello
```
LLM 输出：
```
// Hello! How can I assist you with ThinkIR today?
```

命令行模式输入：
```
hello
```
LLM 输出：
```
LLM 输出：
[Phase 1: TIR Script]
C++
#include "ThinkIR.hpp"

LLMctx main() {
    LLMctx logic = LLMctx::keyword("General Assistant");
    logic.purpose("Respond to user greeting and offer assistance");
    
    id t1 = logic.think("User issued a greeting without a specific command.");
    id t2 = logic.think("Establish readiness to execute TIR scripts or natural language tasks.");
    logic.link(t1, t2);

    LLMctx pure;
    pure.push(logic.create("A polite greeting and confirmation of environment status."));
    return pure;
}
[Phase 2: Topology]
(Empty)

[Phase 2: Nodes]
node[0]: [Think]
Hello! I am currently operating in the ThinkIR environment. I am ready to translate your requirements into structured logic or execute complex reasoning tasks. How can I help you today?
```

## Principles

* ThinkIR 是基于C++的伪代码，我们期望 ThinkIR 是合法的 C++ 代码、符合 C++ 代码规范。
* 将 ThinkIR 作为提示词输入到LLM，相较于自然语言，能更精确地控制思维链和生成结果。
* 自然语言 --> LLM生成ThinkIR -> 人工调整ThinkIR -> LLM执行ThinkIR并输出Vibe Coding结果
* 输入 ThinkIR.txt 后默认进入命令行模式，自然语言输入会先被翻译成 ThinkIR，然后再执行 ThinkIR 产生输出结果。所有自然语言输入会先被 LLM 翻译成 ThinkIR，然后再执行 ThinkIR 产生输出结果。

## Compatibility

ThinkIR 的实现机理是提示词注入，改变 LLM 的工作模式和输出模式。

因此，对于不同的 LLM，有兼容性差异，ChatGPT 和 Claude 均有反提示词注入机制。

| 模型 | 兼容性 |
| --- | ---  |
| Gemini 3 Fast | 非常好 |
| Gemini 3 Thinking | 非常好 |
| Gemini 3.1 Pro | 非常好 |
| DeepSeek v4 | 非常好 |
| GPT-5.3 | 好 |
| Claude Sonnet 4.6 | 一般 |

## 项目集成

### 将 ThinkIR 集成到您的项目中

1. **初始化项目**
```bash
# 克隆或下载 ThinkIR 项目
git clone [repository-url]
cd project-name

# 运行初始化脚本
./scripts/thinkir-init.sh
```

2. **创建项目特定规则**
```bash
# 在项目根目录创建 .thinkir-project-rules
echo "// Project-specific ThinkIR rules" > .thinkir-project-rules
```

3. **设置项目结构**
```
your-project/
├── .thinkir-project-rules    # 项目规则
├── thinkir/
│   ├── scripts/              # ThinkIR 脚本
│   ├── templates/           # 自定义模板
│   └── examples/            # 示例输出
└── src/
    └── generated/           # ThinkIR 生成的代码
```

### 不同项目的 ThinkIR 配置

#### Web 项目
```bash
// .thinkir-project-rules
st("Use TypeScript/JavaScript")
st("Include React/Vue/Angular")
st("Follow project linting rules")
```

#### API 项目
```bash
// .thinkir-project-rules
st("Include OpenAPI/Swagger")
st("Add authentication middleware")
st("Implement proper error handling")
```

#### 数据科学项目
```bash
// .thinkir-project-rules
st("Use pandas/numpy/scikit-learn")
st("Include data visualization")
st("Add Jupyter notebook examples")
```

## 高级特性

### 1. 自定义模板

创建项目特定的 ThinkIR 模板：
```cpp
// templates/my-project-template.cpp
#include "ThinkIR.hpp"

LLMctx main() {
    LLMctx logic = LLMctx::keyword("[Your Domain]");
    logic.purpose("[Your Goal]");

    // Project-specific constraints
    logic.st("[Project Requirement 1]");
    logic.st("[Project Requirement 2]");

    // Your logic here
    id t1 = logic.think("[First step]");
    id t2 = logic.think("[Second step]");
    logic.link(t1, t2);

    LLMctx pure;
    pure.push(logic.program("[Generate output]"));
    return pure;
}
```

### 2. 自动化工作流

使用脚本自动化 ThinkIR 流程：
```bash
#!/bin/bash
# scripts/generate-code.sh

# 1. 生成 ThinkIR 脚本
echo "Generating ThinkIR script..."
cat > temp_script.cpp << EOF
# [ThinkIR script here]
EOF

# 2. 执行脚本
echo "Executing ThinkIR..."
# [Execution logic here]

# 3. 保存结果
echo "Saving results..."
# [Save logic here]
```

### 3. 版本控制集成

将 ThinkIR 脚本纳入版本控制：
```bash
# .gitignore
# 忽略生成的代码，保留 ThinkIR 脚本
src/generated/
!thinkir/scripts/
!thinkir/templates/
```

## 最佳实践

1. **保持 ThinkIR 脚本简洁** - 避免过度复杂的逻辑
2. **使用纯净容器** - 过滤推理过程，只显示最终结果
3. **版本控制关键脚本** - 重要的 ThinkIR 脚本应该保存在仓库中
4. **文档化模式** - 记录为什么选择特定的 ThinkIR 模式
5. **测试生成代码** - 始终验证 ThinkIR 生成的代码质量
