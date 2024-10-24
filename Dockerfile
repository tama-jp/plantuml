# ベースイメージをAlpineに設定
FROM openjdk:8-jdk-alpine

# フォントファイルを追加
COPY SourceHanSansJP.zip /tmp/SourceHanSansJP.zip
COPY NotoSansJP.zip /tmp/NotoSansJP.zip

# 必要なパッケージをインストール
RUN apk add --no-cache graphviz curl fontconfig unzip && \
    mkdir -p /usr/share/fonts/noto && \
    unzip -o -d /usr/share/fonts/noto /tmp/NotoSansJP.zip && \
    unzip -o -d /usr/share/fonts/noto /tmp/SourceHanSansJP.zip && \
    chmod 644 /usr/share/fonts/noto/*.otf && \
    fc-cache -fv

# フォント設定ファイルを追加
COPY local.conf /etc/fonts/local.conf

# PlantUMLをインストール
RUN curl -L -o /usr/local/bin/plantuml.jar https://github.com/plantuml/plantuml/releases/download/v1.2023.7/plantuml-1.2023.7.jar

# PlantUMLを実行するためのスクリプトを作成
RUN echo -e '#!/bin/sh\njava -jar /usr/local/bin/plantuml.jar "$@"' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# 作業ディレクトリ
WORKDIR /workspace

# PlantUMLをデフォルトでPNG出力
ENTRYPOINT ["plantuml", "-tpng"]
