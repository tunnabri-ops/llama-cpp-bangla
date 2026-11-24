#!/usr/bin/env bash
# server-bangla.sh — llama-server চালু করুন বাংলা সিস্টেম প্রম্পট সহ
# API: http://localhost:8080/v1/chat/completions (OpenAI-compatible)
set -e
MODEL_FILE="${MODEL_FILE:-qwen2.5-7b-instruct-q4_k_m.gguf}"
SYSTEM_PROMPT="তুমি একজন সহায়ক সহকারী। সবসময় বাংলায় উত্তর দাও, যদি না ব্যবহারকারী ইংরেজিতে লেখে। সংক্ষিপ্ত উত্তর দাও আগে, তারপর বিস্তারিত। কোড বাংলায় ব্যাখ্যা করো।"
if [ ! -f "$MODEL_FILE" ]; then
  echo "মডেল ফাইল পাওয়া যায়নি: $MODEL_FILE — আগে ./run-bangla.sh চালান"
  exit 1
fi
echo "সার্ভার চলছে: http://localhost:8080 — বন্ধ করতে Ctrl+C"
./llama.cpp/build/bin/llama-server -m "$MODEL_FILE" -c 4096 --temp 0.7 --port 8080 --api-key "" -sys "$SYSTEM_PROMPT"
