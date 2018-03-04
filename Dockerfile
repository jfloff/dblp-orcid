FROM python:latest
LABEL maintainer="jfloff@inesc-id.pt"

WORKDIR /home/dblp-orcid

# install packages
RUN set -ex ;\
    apt-get update && apt-get install -y --no-install-recommends \
            libxml2-utils \
            python-lxml \
            ;\
    rm -rf /var/lib/apt/lists/*

RUN set -ex ;\
    # install pip packages
    pip --no-cache-dir install \
                lxml \
                requests \
                pandas \
                unidecode \
                orcid \
                tqdm \
                ;

CMD /bin/bash