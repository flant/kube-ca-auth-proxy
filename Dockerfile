FROM nginx:1.27.1-alpine@sha256:c04c18adc2a407740a397c8407c011fc6c90026a9b65cceddef7ae5484360158

RUN apk add openssl --update && \
    rm -rf /var/cache/apk/* && \
    rm -rf /etc/nginx/*

COPY run-proxy /bin/run-proxy

ENTRYPOINT ["/bin/run-proxy"]
