FROM alpine:latest

LABEL "com.github.actions.name"="Commit Status Success"
LABEL "com.github.actions.description"="Puts the commit status to 'success'"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

RUN apk add --no-cache \
	bash \
	ca-certificates \
	coreutils \
	curl \
	jq

COPY commit-success.sh /usr/local/bin/commit-success

CMD ["commit-success"]
