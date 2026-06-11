#!/bin/bash
# ATM 系统实验报告 — PlantUML PNG 生成脚本
# 用法: bash generate.sh
# 依赖: python3, curl (均预装于大多数 Linux 发行版)
# 使用 PlantUML 公共服务器渲染，无需本地安装 Java 或 plantuml

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_DIR="${SCRIPT_DIR}/png"
mkdir -p "${OUTPUT_DIR}"

echo "=== 生成 UML 图 (PlantUML 在线服务器) ==="
echo "输出目录: ${OUTPUT_DIR}"
echo ""

COUNT=0
OK=0

for f in "${SCRIPT_DIR}"/*.puml; do
    name=$(basename "$f" .puml)
    out="${OUTPUT_DIR}/${name}.png"
    COUNT=$((COUNT + 1))
    printf "  [%2d/10] %-30s ... " "$COUNT" "${name}.puml"

    python3 -c "
import zlib, base64, urllib.request, sys, os

puml_path = '${f}'
png_path = '${out}'

with open(puml_path, 'r', encoding='utf-8') as fh:
    source = fh.read()

# PlantUML 编码: deflate + 自定义 base64
compressed = zlib.compress(source.encode('utf-8'), level=9)[2:-4]
STANDARD = b'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
CUSTOM   = b'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_'
b64 = base64.b64encode(compressed)
trans = bytes.maketrans(STANDARD, CUSTOM)
encoded = b64.translate(trans).decode('ascii').rstrip('=')

url = f'https://www.plantuml.com/plantuml/png/{encoded}'
try:
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req, timeout=30) as resp:
        with open(png_path, 'wb') as out:
            out.write(resp.read())
    size = os.path.getsize(png_path)
    if size > 500:
        print(f'OK  ({size/1024:.1f} KB)')
    else:
        raise Exception('too small')
except Exception as e:
    # fallback: kroki.io
    import json
    url2 = 'https://kroki.io/plantuml/png'
    data = json.dumps({'diagram_source': source, 'output_format': 'png'}).encode('utf-8')
    try:
        req2 = urllib.request.Request(url2, data=data,
            headers={'Content-Type': 'application/json', 'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req2, timeout=30) as resp:
            with open(png_path, 'wb') as out:
                out.write(resp.read())
        size = os.path.getsize(png_path)
        if size > 500:
            print(f'OK  ({size/1024:.1f} KB) [kroki]')
        else:
            raise Exception('kroki returned small file')
    except Exception as e2:
        print(f'FAIL ({e2})')
        sys.exit(1)
" && OK=$((OK + 1)) || true

done

echo ""
echo "=== 完成: ${OK}/${COUNT} ==="
ls -lh "${OUTPUT_DIR}"/*.png 2>/dev/null
