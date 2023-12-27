FROM debian:11

RUN apt update \
    && apt install -y wget tar build-essential clang

WORKDIR /roc-install

RUN wget https://github.com/roc-lang/roc/releases/download/nightly/roc_nightly-linux_x86_64-latest.tar.gz

RUN tar -xf roc_nightly-linux_x86_64-latest.tar.gz && \
    cd roc_nightly-linux_x86_64-2023-12-27-5d98783 \
    && export PATH=$PATH:/roc-install/roc_nightly-linux_x86_64-2023-12-27-5d98783/roc

ENV PATH="${PATH}:/roc-install/roc_nightly-linux_x86_64-2023-12-27-5d98783"

WORKDIR /roc-dev

CMD tail -f /dev/null
