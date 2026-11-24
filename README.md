# llama.cpp Bangla — C/C++ দিয়ে লোকাল LLM চালান

Bangla-ready llama.cpp setup, built on **ggml-org/llama.cpp**.

- **Original repo:** https://github.com/ggml-org/llama.cpp (LLM inference in C/C++ — the engine behind Ollama, LM Studio and many local-AI apps)

## কী আছে / What is inside

- `run-bangla.sh` — builds llama.cpp, downloads Qwen2.5-7B-Instruct (Q4_K_M, ~4.7 GB) and chats in Bangla from the terminal.
- `server-bangla.sh` — starts `llama-server` with a Bangla system prompt on port 8080, OpenAI-compatible API (`/v1/chat/completions`).

## যা ঠিক করা হয়েছে / What was fixed

- **Repo moved:** the old name `ggerganov/llama.cpp` no longer exists — the project is now `ggml-org/llama.cpp`. Old clone URLs and old guides point at a redirect. This README uses the current name and URL.
- Upstream is a bare engine: no model choice, no Bangla prompt, no one-command start. These scripts pick a model with strong Bangla support, pass the Bangla system prompt, and set a 4096-token context, so the first run already speaks Bangla.
- The server script exposes the OpenAI-compatible endpoint, so any OpenAI-style client (including the AI Chat Bot's custom endpoint) can talk to the local model.

## ব্যবহার / How to use

```bash
# 1. Build + download model + chat in Bangla (one command)
./run-bangla.sh

# 2. Or run as a local API server instead
./server-bangla.sh
#    then: curl http://localhost:8080/v1/models
```

Requirements: git, cmake, a C++ compiler, ~6 GB free disk. No API key, no account — everything runs on your own computer.
