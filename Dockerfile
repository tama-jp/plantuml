# ベースイメージはAlpineを使用（軽量で効率的）
FROM openjdk:8-jdk-alpine

# 必要なパッケージ（Graphvizとフォント）をインストール
RUN apk add --no-cache graphviz ttf-dejavu curl && \
    curl -L -o /usr/local/bin/plantuml.jar https://github.com/plantuml/plantuml/releases/download/v1.2023.7/plantuml-1.2023.7.jar

# PlantUMLを実行するためのスクリプトを作成
RUN echo -e '#!/bin/sh\njava -jar /usr/local/bin/plantuml.jar "$@"' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# 作業ディレクトリ
WORKDIR /workspace

# PlantUMLをデフォルトでPNG出力
ENTRYPOINT ["plantuml", "-tpng"]
