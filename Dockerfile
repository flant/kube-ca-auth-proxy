FROM nginx:1.16.1-alpine@sha256:5057451e461dda671da5e951019ddbff9d96a751fc7d548053523ca1f848c1ad

RUN apk add openssl --update && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/nginx/*

COPY run-proxy /bin/run-proxy

ENTRYPOINT ["/bin/run-proxy"]
