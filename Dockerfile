FROM alpine

LABEL maintainer="lwzm@qq.com"

RUN apk add --no-cache python3 \
    && cd /usr/lib/python3* \
    && rm -r ensurepip \
    && python3 -O -m compileall -q -b -f . \
    && find . -name __pycache__ | xargs rm -rf \
    && find . -name '*.py' -delete

CMD [ "python3" ]
