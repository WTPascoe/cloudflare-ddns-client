FROM python:alpine3.11
RUN apk add --no-cache iproute2
RUN python3 -m pip install \
   argparse \
   requests \
   tld
RUN addgroup -g 1001 cloudflare-ddns-client && \
  adduser -D -u 1001 -G cloudflare-ddns-client cloudflare-ddns-client
USER cloudflare-ddns-client
COPY --chown=cloudflare-ddns-client cloudflare-ddns /usr/local/bin/cloudflare-ddns-client
CMD /usr/local/bin/cloudflare-ddns-client --update
