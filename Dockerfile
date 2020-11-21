# syntax=docker/dockerfile:experimental
FROM node:10.22.0-alpine3.11

ENV GITBOOK_VERSION 3.2.3

RUN --mount=type=cache,target="/usr/local/lib/node_modules" \
    --mount=type=cache,target="/root/.npm" \
    npm install gitbook-cli -g \
    && gitbook fetch ${GITBOOK_VERSION}

# 修复问题 <https://github.com/GitbookIO/gitbook-cli/issues/55>
COPY copyPluginAssets.js /root/.gitbook/versions/$GITBOOK_VERSION/lib/output/website/copyPluginAssets.js

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4000 35729

CMD ["gitbook"]
