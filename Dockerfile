FROM ubuntu
RUN apt-get update
RUN apt-get install -y software-properties-common 

RUN add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update

RUN apt-get install -y neovim zsh httpie ssh git ruby htop curl tmux


RUN useradd -m ryan && \
    echo "ryan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chsh -s /bin/zsh ryan

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/zsh /bin/sh



ADD files/ssh/main-id_rsa.pub /home/ryan/.ssh/authorized_keys

RUN chown -R ryan:ryan /home/ryan/.ssh

USER ryan


RUN git clone https://github.com/rschmukler/dotfiles.git ~/.dotfiles && \
    cd ~/.dotfiles && \
    mkdir -p ~/.dotfiles/zsh/antigen && \
    curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.dotfiles/zsh/antigen/antigen.zsh && \
    ./install.rb && \
    /bin/zsh ~/.dotfiles/zsh/load-antigen.zsh && \
    mkdir -p ~/src

# Install nvm with node and npm
ENV NVM_DIR /home/ryan/.nvm
ENV NODE_VERSION 5.3
ENV IS_DOCKER true

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default


EXPOSE 22
VOLUME /home/ryan/Dev

ADD start.sh /

USER root
CMD ["/start.sh"]
