#!/usr/bin/env python3
"""使用 PlantUML 在线服务器生成 PNG —— 正确的 deflate+base64 编码方式"""

import zlib
import base64
import urllib.request
import os
import time

PUML_DIR = os.path.dirname(os.path.abspath(__file__))
PNG_DIR = os.path.join(PUML_DIR, "png")
os.makedirs(PNG_DIR, exist_ok=True)

# PlantUML 自定义 base64 字母表
PLANTUML_ALPHABET = b"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_"
STANDARD_ALPHABET = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

def encode_plantuml(source: str) -> str:
    """将 PlantUML 源码编码为服务器 URL 所需的格式"""
    # 1. deflate 压缩 (raw deflate, no zlib header)
    compressed = zlib.compress(source.encode('utf-8'), level=9)[2:-4]
    # 2. 用标准 base64 编码
    b64 = base64.b64encode(compressed)
    # 3. 翻译为 PlantUML 自定义字母表
    trans = bytes.maketrans(STANDARD_ALPHABET, PLANTUML_ALPHABET)
    encoded = b64.translate(trans).decode('ascii').rstrip('=')
    return encoded

SERVER = "https://www.plantuml.com/plantuml/png"

puml_files = sorted(f for f in os.listdir(PUML_DIR) if f.endswith('.puml'))
print(f"找到 {len(puml_files)} 个 .puml 文件\n")

success = 0
for f in puml_files:
    puml_path = os.path.join(PUML_DIR, f)
    png_name = f.replace('.puml', '.png')
    png_path = os.path.join(PNG_DIR, png_name)

    print(f"  {f} → {png_name} ...", end=" ", flush=True)

    try:
        with open(puml_path, 'r', encoding='utf-8') as fh:
            source = fh.read()

        encoded = encode_plantuml(source)
        url = f"{SERVER}/{encoded}"

        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=30) as resp:
            data = resp.read()
            with open(png_path, 'wb') as out:
                out.write(data)

        size_kb = os.path.getsize(png_path) / 1024
        print(f"OK ({size_kb:.1f} KB)")
        success += 1
    except Exception as e:
        print(f"FAIL: {e}")

    time.sleep(0.3)

print(f"\n完成: {success}/{len(puml_files)} 成功")
if success > 0:
    print("PNG 文件:")
    for png in sorted(os.listdir(PNG_DIR)):
        size = os.path.getsize(os.path.join(PNG_DIR, png))
        print(f"  {png}: {size/1024:.1f} KB")
