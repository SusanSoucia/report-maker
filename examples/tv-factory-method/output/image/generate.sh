#!/bin/bash
# 一键生成所有 PlantUML 图片
for f in image/*.puml; do
  plantuml -tpng "$f" -o image/
done
# PlantUML 会将 png 放到 image/image/，移动到 image/ 下
mv image/image/*.png image/ 2>/dev/null
rmdir image/image/ 2>/dev/null
echo "Done."
