#!/bin/bash

# ThinkIR 初始化脚本
# 用于快速设置 ThinkIR 环境

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 显示欢迎信息
echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}   ThinkIR Environment Setup             ${NC}"
echo -e "${BLUE}===========================================${NC}"
echo ""

# 检查是否在正确的目录
if [ ! -f "ThinkIR.txt" ]; then
    echo -e "${RED}Error: ThinkIR.txt not found in current directory${NC}"
    echo "Please run this script in the ThinkIR project root directory"
    exit 1
fi

# 创建必要的目录
echo -e "${YELLOW}Creating directories...${NC}"
mkdir -p templates
mkdir -p examples
mkdir -p scripts

# 复制模板文件
if [ ! -f "templates/thinkir-template.cpp" ]; then
    cp templates/thinkir-template.cpp ../templates/ 2>/dev/null || true
fi

echo -e "${GREEN}✓ Directories created successfully${NC}"

# 显示 ThinkIR 状态
echo ""
echo -e "${BLUE}ThinkIR Configuration:${NC}"
echo -e "  Version: $(grep -o 'version="[^"]*"' ThinkIR.txt | cut -d'"' -f2)"
echo -e "  Status: $(grep -o 'status="[^"]*"' ThinkIR.txt | cut -d'"' -f2)"

# 显示使用提示
echo ""
echo -e "${YELLOW}Quick Start:${NC}"
echo -e "  1. Copy the content of ThinkIR.txt to your LLM"
echo -e "  2. Wait for '// ThinkIR Environment Ready.' response"
echo -e "  3. Start using ThinkIR commands"
echo ""
echo -e "${YELLOW}Available Modes:${NC}"
echo -e "  • Command Line Mode (default) - Natural language input"
echo -e "  • Execution Mode - Execute ThinkIR scripts only"
echo -e "  • Translation Mode - Generate ThinkIR scripts only"
echo -e "  • Silent Mode - Clean output without script display"
echo -e "  • Standard Mode - Use // for normal conversation"
echo ""
echo -e "${YELLOW}Examples:${NC}"
echo -e "  // use execution mode"
echo -e "  // use translation mode"
echo -e "  // use silent mode"
echo ""
echo -e "${GREEN}ThinkIR environment setup complete!${NC}"