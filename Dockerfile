FROM ubuntu:16.04
MAINTAINER Koen De Keyser <koen.dekeyser@gmail.com>

RUN apt-get update -q && apt-get install -y --no-install-recommends \
      software-properties-common \
      tmux \
      vim-gnome \
      libnotify4 \
      libnss3 \
      libxtst6 \
      libxss1

# "netbase" package needed as workaround because otherwise "stack" cannot access network during Docker build, see https://github.com/bos/wreq/issues/5 for related issue
RUN apt-get install -y --no-install-recommends \
      gcc \
      g++ \
      netbase \ 
      xz-utils \
      libz-dev \
      haskell-stack

ADD https://vscode-update.azurewebsites.net/1.10.2/linux-deb-x64/stable /tmp/vscode.deb

RUN dpkg -i /tmp/vscode.deb && rm /tmp/vscode.deb

RUN adduser developer

USER developer 

RUN stack upgrade

ENV PATH=/home/developer/.local/bin:$PATH

RUN echo 0 | code --install-extension Vans.haskero



