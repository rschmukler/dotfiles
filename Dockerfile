FROM ubuntu:15.10
RUN apt-get update
RUN apt-get install -y software-properties-common 

RUN add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \
    locale-gen en_US.UTF-8 && \
    apt-get install -y neovim zsh httpie ssh git ruby htop curl tmux gnupg2 \
            git-crypt apt-transport-https sudo python-pip


RUN useradd -m ryan && \
    echo "ryan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chsh -s /bin/zsh ryan

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/zsh /bin/sh

# Install Docker so we can link it in
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-engine


ADD files/ssh/main-id_rsa.pub /home/ryan/.ssh/authorized_keys

RUN chown -R ryan:ryan /home/ryan/.ssh

USER ryan


# Clone dotfiles
RUN git clone https://github.com/rschmukler/dotfiles.git ~/.dotfiles && \
    cd ~/.dotfiles && \
    mkdir -p ~/.dotfiles/zsh/antigen && \
    curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.dotfiles/zsh/antigen/antigen.zsh && \
    ./install.rb && \
    /bin/zsh ~/.dotfiles/zsh/load-antigen.zsh && \
    mkdir /src

# Install nvm with node and npm
ENV NVM_DIR /home/ryan/.nvm
ENV NODE_VERSION 5.3
ENV IS_DOCKER true

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm -g install typescript tslint eslint nip \
    && cd ~/.dotfiles \
    && git reset --hard # Undo NVM install modifying zshrc


EXPOSE 22
VOLUME /src

ADD start.sh /

USER root
CMD ["/start.sh"]
