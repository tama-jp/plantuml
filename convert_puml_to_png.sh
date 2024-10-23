#!/bin/bash

# 現在のディレクトリ以下の全ての .puml ファイルを探して処理する
find . -name "*.puml" | while read puml_file; do
    # .puml のファイルを .png に変換するファイル名を設定
    png_file="${puml_file%.puml}.png"

    # カレントディレクトリに移動してからDockerでPlantUMLを実行
    dir=$(dirname "$puml_file")
    base=$(basename "$puml_file")
    docker_image=ghcr.io/tama-jp/plantuml:v202410232200

    docker run --rm -v "$(pwd)/$dir":/workspace ${docker_image} \
        -tpng "/workspace/$base" -o "/workspace"

    echo "Converted $puml_file to $png_file"
done
