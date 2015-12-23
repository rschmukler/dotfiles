FROM ubuntu
RUN apt-get update
RUN apt-get install -y software-properties-common 

RUN apt-get update
RUN apt-get install -y neovim zsh httpie ssh software-properties-common git

RUN chsh -s /bin/zsh root
RUN service ssh start

EXPOSE 22

ADD start.sh /

CMD ["/start.sh"]
