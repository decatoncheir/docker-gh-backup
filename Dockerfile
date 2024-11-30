FROM alpine:3.20.3

RUN apk add --no-cache git github-cli openssh jq

COPY backup.sh /bin
RUN chmod 700 /bin/backup.sh

WORKDIR /root
ENV HOME=/root

ENTRYPOINT [ "/bin/backup.sh" ]
