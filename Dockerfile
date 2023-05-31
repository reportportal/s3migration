FROM alpine:latest

RUN apk --no-cache add curl bash && \
	curl https://dl.min.io/client/mc/release/linux-amd64/mc \
    -o /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

COPY migration.sh /migration.sh
RUN chmod +x /migration.sh

ENTRYPOINT ["/migration.sh"]
CMD ["up"]

