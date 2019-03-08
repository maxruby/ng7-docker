FROM ubuntu:17.10
LABEL Maximiliano Suster <mxsstr93@gmail.com>

# -----------------------------------------------------------------------------
# Environment variables
# -----------------------------------------------------------------------------
ENV GIT_EMAIL="mxsstr93@gmail.com" \
    GIT_NAME="Maximiliano Suster"

ENV NODE_VERSION=11.11.0
ENV NPM_VERSION=latest

# -----------------------------------------------------------------------------
# Pre-install
# -----------------------------------------------------------------------------
RUN \
  dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get install -y \
    # tools
    curl \
    wget \
    zip \
    git \
    unzip ruby xdg-utils links links2 w3m nano
# configure git
RUN git config --global user.email "${GIT_EMAIL}"
RUN git config --global user.name "${GIT_NAME}"

# Add terminal color scheme
RUN echo 'export PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\u\[$(tput setaf 1)\] @ \[$(tput setaf 2)\]\h\[$(tput setaf 4)\] \w \[$(tput setaf 1)\]$ \[$(tput sgr0)\]"' >> ~/.bashrc
RUN . ~/.bashrc

# -----------------------------------------------------------------------------
# Install
# -----------------------------------------------------------------------------

# Install Node and NPM
RUN \
  apt-get update -qqy \
  && curl --retry 3 -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
  && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.gz" \
  && npm install -g npm@"$NPM_VERSION" \
  && npm install -g @angular/cli

# awscli
# RUN apt-get update && \
#     apt-get install -y \
#         python3 \
#         python3-pip \
#         python3-setuptools \
#         groff \
#         less \
#     && pip3 install --upgrade pip \
#     && apt-get clean

# RUN pip3 --no-cache-dir install --upgrade awscli

# -----------------------------------------------------------------------------
# Post-install
# -----------------------------------------------------------------------------

WORKDIR /project
EXPOSE 4200 49154 53703
CMD ng serve

# -----------------------------------------------------------------------------
# Clean up
# -----------------------------------------------------------------------------
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
