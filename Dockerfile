FROM ubuntu:trusty

MAINTAINER ADAMA MAIGA A., adamamaiga@gmail.com

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        tcl \
        tk \
        sudo \
        make \
        gcc \
        git-core \
        libcurl4-gnutls-dev \
        libncurses5-dev \
        libssl-dev \
        openssh-client \
        openssh-server \
        uuid-runtime \
        libldap2-dev \
        golang-openldap-dev \
        libghc-ldap-dev \
        libroot-net-ldap-dev \
        lua-ldap-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/capensis/canopsis.git
WORKDIR /canopsis
RUN git reset --hard 4c53ed29b8f0b3686d267f3f8fb8baafa919afc5
RUN git submodule init
RUN git submodule update

RUN /canopsis/build-install.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
