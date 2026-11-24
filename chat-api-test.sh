#!/usr/bin/env bash
# chat-api-test.sh — llama-server চলছে কি না, curl দিয়ে পরীক্ষা করুন
# আগে চালান: ./server-bangla.sh (আরেক টার্মিনালে)
# তারপর: ./chat-api-test.sh "বাংলাদেশের রাজধানী কোনটি?"
set -e
MSG="${1:-বাংলাদেশের রাজধানী কোনটি?}"
curl -s http://localhost:8080/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d "$(python3 -c "import json,sys; print(json.dumps({'model': 'qwen2.5-7b-instruct', 'messages': [{'role': 'user', 'content': sys.argv[1]}]}))" "$MSG")" \
  | python3 -c "import json,sys; d=json.load(sys.stdin); print(d['choices'][0]['message']['content'])"
