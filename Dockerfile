FROM alpine:latest

# Install required packages
RUN apk --no-cache add jq bash python py-yaml

# Copy startup
COPY entrypoint.yaml /
COPY docker-entrypoint.py /
COPY startup.sh /

RUN chmod +x /startup.sh
RUN chmod +x /docker-entrypoint.py

ENTRYPOINT ["/docker-entrypoint.py"]

CMD ["/startup.sh"]
