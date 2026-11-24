# 🖥️ llama.cpp Bangla

[![Bangla](https://img.shields.io/badge/UI-Bangla%20%2B%20English-orange)](#)

**Run a Bangla LLM on your own computer — terminal chat and a local OpenAI-compatible API server, no API key, no account.**

> বাংলা সংস্করণ নিচে আছে। / Bangla version below.

## ✨ Features

- `run-bangla.sh` — one command: builds the inference engine, downloads the Qwen2.5-7B-Instruct model (Q4_K_M, ~4.7 GB) and starts a Bangla terminal chat (4096-token context, temperature 0.7, Bangla system prompt).
- `server-bangla.sh` — starts a local API server on port 8080 with a Bangla system prompt: OpenAI-compatible `POST /v1/chat/completions` and `GET /v1/models`.
- `chat-api-test.sh "your question"` — tests the running server with `curl` and prints the Bangla answer (default question: "বাংলাদেশের রাজধানী কোনটি?").

## 🚀 How to use

```bash
# 1. Build + download model + chat in Bangla (one command)
./run-bangla.sh
#    exit the chat with Ctrl+C

# 2. Or run it as a local API server instead (another terminal)
./server-bangla.sh
#    then: curl http://localhost:8080/v1/models

# 3. Test the server
./chat-api-test.sh "বাংলাদেশের রাজধানী কোনটি?"
```

Requirements: `git`, `cmake`, a C++ compiler, ~6 GB free disk. Set `MODEL_FILE` to use a different model file with `server-bangla.sh`.

## ⚠️ Honest limits

- The first run builds the engine and downloads ~4.7 GB of model — it takes a while and needs the disk space.
- Everything runs on your own computer, so answer speed depends on your CPU/GPU.
- The server has no API key set (`--api-key ""`) — it is meant for your own machine only, not for exposing to the internet.

## 🇧🇩 বাংলা

**llama.cpp বাংলা — নিজের কম্পিউটারে বাংলায় চলা LLM।**

- `./run-bangla.sh` — এক কমান্ডে বিল্ড + মডেল ডাউনলোড + বাংলায় টার্মিনাল চ্যাট।
- `./server-bangla.sh` — লোকাল API সার্ভার (`http://localhost:8080`), OpenAI-এর মতো করে ব্যবহার করা যায়।
- `./chat-api-test.sh "প্রশ্ন"` — সার্ভার চলছে কি না পরীক্ষা করে।
- কোনো API key লাগে না — তবে সার্ভারটা শুধু নিজের মেশিনের জন্য, ইন্টারনেটে খুলে দেবেন না।

## 📄 License

MIT — use it however you like; credit is appreciated.
