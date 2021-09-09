FROM archlinux:base-devel

ARG USER=devc
ARG USER_UID=1000
ARG USER_GID=$USER_UID


RUN useradd --system --create-home $USER \
  && echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER

COPY base.sh /tmp/init/

RUN /bin/bash /tmp/init/base.sh

ENTRYPOINT [ "/bin/zsh" ]