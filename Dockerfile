FROM deepnote/python:3.7

ENV GAP_VERSION 4.11.1
ENV GAP_BASE_VERSION 4

RUN    apt update \
    && apt install -y m4 libzmq3-dev libgmp-dev \
    && pip install notebook

RUN    cd /usr/lib \
    && wget -q https://github.com/gap-system/gap/releases/download/v${GAP_VERSION}/gap-${GAP_VERSION}.tar.gz \
    && tar xzf gap-${GAP_VERSION}.tar.gz \
    && rm gap-${GAP_VERSION}.tar.gz \
    && cd gap-${GAP_VERSION} \
    && ./configure \
    && make \
    && cp bin/gap.sh bin/gap \
    && cd pkg \
    && pkgname='io-*' \
    && mv ${pkgname} io \
    && cd io \
    && ./configure \
    && make \
    && cd .. \
    && pkgname='crypting-*' \
    && mv ${pkgname} crypting \
    && cd crypting \
    && ./configure \
    && make \
    && cd .. \
    && pkgname='json-*' \
    && mv ${pkgname} json \
    && cd json \
    && ./configure \
    && make \
    && cd .. \
    && pkgname='ZeroMQInterface-*' \
    && mv ${pkgname} ZeroMQInterface \
    && cd ZeroMQInterface \
    && ./configure \
    && make \
    && cd .. \
    && pkgname='JupyterKernel-*' \
    && mv ${pkgname} JupyterKernel \
    && cd JupyterKernel \
    && python3 setup.py install --user

ENV GAP_HOME="/usr/lib/gap-${GAP_VERSION}"
ENV JUPYTER_KERNEL_BIN="${GAP_HOME}/pkg/JupyterKernel/bin"
ENV GAP_BIN="${GAP_HOME}/bin"
ENV PATH="${GAP_HOME}/bin:${GAP_HOME}/pkg/JupyterKernel/bin:${PATH}"
ENV JUPYTER_GAP_EXECUTABLE="${GAP_HOME}/bin/gap.sh"
ENV DEFAULT_KERNEL_NAME="gap-${GAP_BASE_VERSION}"