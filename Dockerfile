FROM ubuntu:14.04
MAINTAINER Koen De Keyser <koen.dekeyser@gmail.com>

ADD http://download.fpcomplete.com/ubuntu/fpco.key /tmp/fpco.key
RUN apt-key add /tmp/fpco.key
RUN echo 'deb http://download.fpcomplete.com/ubuntu/trusty stable main'| tee /etc/apt/sources.list.d/fpco.list

RUN apt-get update -q && apt-get install -y --no-install-recommends \
      software-properties-common \
      tmux \
      vim-gnome \
      libnotify4 \
      libnss3 \
      libxtst6 \
      libxss1 \
      stack

ADD https://vscode-update.azurewebsites.net/1.10.2/linux-deb-x64/stable /tmp/vscode.deb

RUN dpkg -i /tmp/vscode.deb
