# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ThinkIR is a specification and documentation project for an intermediate scripting language designed to bridge natural language and programming. It's not a traditional software project but rather a conceptual framework for interacting with LLMs using structured intermediate representation.

## Key Files

- **README.md** - Comprehensive documentation about ThinkIR concept, usage examples, and comparison with natural language prompting
- **ThinkIR.txt** - XML specification file (version 1.18.71) containing the complete language specification, operators, execution rules, and runtime pipeline
- **BoostLicense** - Boost Software License file

## Development Workflow

Since this is a specification project, there are no traditional development commands:

- **No build system** - This project doesn't use npm, yarn, pnpm, or any package manager
- **No tests** - There is no test framework or testing infrastructure
- **No scripts** - No package.json scripts or Makefiles

## ThinkIR Language Architecture

ThinkIR is based on C++26 syntax and operates through a dual-layer graph architecture:

### Core Components
1. **Logic Graph** (Bottom Layer) - Persistent reasoning nodes created with `think()` and connected with `link()`
2. **Artifact Graph** (Top Layer) - Final deliverables (code, docs) created with `push()` and rendered with `create()`/`program()`

### Execution Pipeline
- **Phase 1**: Translation - Maps natural language to ThinkIR script
- **Phase 2**: Serialization - Outputs topology and node content

### Key Operators
- `think()` - Creates persistent inference nodes
- `st()` - Adds hard constraints
- `link()` - Establishes logical dependencies
- `keyword()`/`purpose()` - Sets context and goals
- `push()` - Promotes artifacts to output
- `create()` - Generates natural language text
- `program()` - Generates executable code

### Environment Modes
- **Command Line Mode** (default) - Phase 1 + Phase 2
- **Execution Mode** - Phase 2 only
- **Translation Mode** - Phase 1 only
- **Silent Mode** - Full pipeline, Phase 1 hidden
- **Standard Mode** - Comment input exits ThinkIR mode

## Working with ThinkIR

When modifying this specification:
1. **ThinkIR.txt is the source of truth** - All language specifications are defined here
2. **XML structure must be maintained** - The specification follows strict XML formatting
3. **Version tracking** - The specification version is tracked in the XML header
4. **Update README.md** - When adding new features or changing behavior, update examples and documentation

## Compatibility Notes

The specification mentions compatibility with various LLMs:
- Gemini 3 Fast/3 Thinking/3.1 Pro: Very good
- DeepSeek v4: Very good
- GPT-5.3: Good
- Claude Sonnet 4.6: General

When updating the specification, consider these compatibility constraints as different LLMs may have varying support for prompt injection techniques.