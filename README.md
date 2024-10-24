# plantuml

```
v202410242200
```

```shell
docker build -t plantuml-to-png .
docker run --rm -v $(pwd):/workspace plantuml-to-png sample/sample1.puml
docker run --rm -v $(pwd):/workspace plantuml-to-png sample/sample2.puml
docker run --rm -v $(pwd):/workspace plantuml-to-png sample/sample3.puml
docker run --rm -v $(pwd):/workspace plantuml-to-png sample/sample4.puml
docker run --rm -v $(pwd):/workspace plantuml-to-png sample/sample5.puml

```

