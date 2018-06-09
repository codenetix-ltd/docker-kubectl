FROM alpine

MAINTAINER Egor Zyuskin <ezyuskin@codenetix.com>

ENV KUBECTL_CONFIG=""
ENV KUBECTL_VERSION="v1.10.2"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

COPY ./container-entrypoint.sh /usr/local/sbin/

ENTRYPOINT ["/usr/local/sbin/container-entrypoint.sh"]

