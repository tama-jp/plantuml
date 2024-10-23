# plantuml

docker build -t plantuml-to-png .
docker run --rm -v $(pwd):/workspace plantuml-to-png sample1.puml

