FROM golang:1.19.2-bullseye

RUN useradd -m -u 1000 blog
RUN apt-get update && apt-get install -y inotify-tools

RUN chown -R 1000:1000 /go
COPY --chown=1000:1000 ./blog-service /go/blog-service
COPY --chown=1000:1000 ./docker/blog-service/run-service.sh /run-service.sh

USER blog

ENV BLOG_WORKDIR=/go/blog-service
WORKDIR $BLOG_WORKDIR

RUN go install github.com/go-delve/delve/cmd/dlv@latest