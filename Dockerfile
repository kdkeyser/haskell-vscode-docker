FROM ubuntu:16.04
MAINTAINER Koen De Keyser <koen.dekeyser@gmail.com>

# "netbase" package needed as workaround because otherwise "stack" cannot access network during Docker build, see https://github.com/bos/wreq/issues/5 for related issue
RUN apt-get update -q && apt-get install -y --no-install-recommends \
      software-properties-common \
      sudo \
      tmux \
      vim-gnome \
      libnotify4 \
      libnss3 \
      libxtst6 \
      libxss1 \
      gcc \
      g++ \
      netbase \ 
      xz-utils \
      libz-dev \
      libtinfo-dev \
      libsecret-1-0 \
      libxkbfile1 \
      libx11-xcb1 \
      git \
      ssh \
      wget

RUN wget -qO- https://get.haskellstack.org/ | sh

ENV VSCODE_VERSION 1.19.1

ADD https://vscode-update.azurewebsites.net/$VSCODE_VERSION/linux-deb-x64/stable /tmp/vscode.deb

RUN dpkg -i /tmp/vscode.deb && rm /tmp/vscode.deb

RUN groupadd -g 1000 developer && useradd -u 1000 -g 1000 developer

RUN echo "developer:developer" | chpasswd 

RUN adduser developer sudo 

RUN mkdir /home/developer

RUN chown developer /home/developer

USER developer

RUN echo 0 | code --install-extension Vans.haskero

ENV PATH $PATH:/home/developer/.local/bin

