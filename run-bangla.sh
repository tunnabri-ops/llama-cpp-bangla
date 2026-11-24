#!/usr/bin/env bash
# run-bangla.sh — llama.cpp বিল্ড করে বাংলায় চ্যাট করুন
# মডেল: Qwen2.5-7B-Instruct Q4_K_M (~4.7 GB) — বাংলায় ভালো
set -e
MODEL_URL="https://huggingface.co/Qwen/Qwen2.5-7B-Instruct-GGUF/resolve/main/qwen2.5-7b-instruct-q4_k_m.gguf"
MODEL_FILE="qwen2.5-7b-instruct-q4_k_m.gguf"
SYSTEM_PROMPT="তুমি একজন সহায়ক সহকারী। সবসময় বাংলায় উত্তর দাও, যদি না ব্যবহারকারী ইংরেজিতে লেখে। সংক্ষিপ্ত উত্তর দাও আগে, তারপর বিস্তারিত। কোড বাংলায় ব্যাখ্যা করো।"

if [ ! -d llama.cpp ]; then
  echo "llama.cpp ক্লোন করা হচ্ছে..."
  git clone https://github.com/ggml-org/llama.cpp.git
fi
cd llama.cpp
cmake -B build -DGGML_NATIVE=ON >/dev/null && cmake --build build --config Release -j"$(nproc)" --target llama-cli
if [ ! -f "../$MODEL_FILE" ]; then
  echo "মডেল ডাউনলোড হচ্ছে (~4.7 GB)..."
  curl -L -o "../$MODEL_FILE" "$MODEL_URL"
fi
cd ..
echo "বাংলায় চ্যাট শুরু — বের হতে Ctrl+C চাপুন"
./llama.cpp/build/bin/llama-cli -m "$MODEL_FILE" -c 4096 --temp 0.7 -sys "$SYSTEM_PROMPT" --color -i
