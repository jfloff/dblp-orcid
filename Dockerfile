FROM jfloff/alpine-python:latest
LABEL maintainer="jfloff@inesc-id.pt"

# install lxml
RUN set -ex ;\
    apk add --update --no-cache \
            g++ \
            gcc \
            libxslt-dev \
            py-lxml\
            ;\
    rm /var/cache/apk/*

# copy application and run
WORKDIR /home/dblp-orcids
COPY . /home/dblp-orcids
RUN pip --no-cache-dir install -r requirements.pip

CMD ./parse.py