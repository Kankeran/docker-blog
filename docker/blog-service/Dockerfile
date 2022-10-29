FROM golang:1.19.2-bullseye

RUN useradd -m -u 1000 blog
RUN apt-get update && apt-get install -y inotify-tools

ENV PATH /usr/local/dart-sass:$PATH

RUN chown -R 1000:1000 /go
ADD --chown=1000:1000 ./docker/blog-service/dart-sass-1.55.0-linux-x64.tar.gz /usr/local/
COPY --chown=1000:1000 ./blog-service /go/blog-service
COPY --chown=1000:1000 ./docker/blog-service/run-service.sh /run-service.sh
COPY --chown=1000:1000 ./docker/blog-service/run.sh /run.sh

USER blog

ENV BLOG_WORKDIR=/go/blog-service
WORKDIR $BLOG_WORKDIR

RUN go install github.com/go-delve/delve/cmd/dlv@latest