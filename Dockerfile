# This is only used for developing the zsh-in-docker script, but can be used as an example.

FROM ubuntu:24.04

ARG USERNAME=eli 
ARG USER_UID=1002
ARG USER_GID=$USER_UID

RUN groupadd -g $USER_GID $USERNAME && useradd -u $USER_UID -g $USER_GID -m $USERNAME 
RUN apt-get update && apt-get upgrade -y
RUN apt-get install apt-utils sudo wget curl python3-pip python3-venv git grc zsh -y
RUN apt-get install ripgrep bat tini iputils-ping ethtool fping iftop virtualenv zsh virtualenvwrapper util-linux openssl git netcat-openbsd dnsutils -y
RUN apt-get install -y yq jq eza wget fzf
# tsharks
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && chmod 0440 /etc/sudoers.d/$USERNAME 
# Clean up
RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
COPY motd /etc/motd

USER $USERNAME

# ZSH Themes
RUN curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
COPY zshrc .zshrc
COPY motd /home/$USERNAME/motd

# Default powerline10k theme, no plugins installed
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"
RUN mkdir /home/$USERNAME/.pip
COPY pip.conf /etc/
COPY pip.conf /home/$USERNAME/.pip
RUN wget https://github.com/tellerops/teller/releases/download/v2.0.7/teller-x86_64-linux.tar.xz -O /home/eli/teller-x86_64-linux.tar.xz
RUN xz -d /home/eli/teller-x86_64-linux.tar.xz 
RUN tar xvf /home/eli/teller-x86_64-linux.tar -C /home/eli 
RUN sudo cp /home/eli/teller-x86_64-linux/teller /usr/bin/teller
RUN  wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -O /home/eli/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
RUN sudo apt-get install /home/eli/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
RUN wget https://go.dev/dl/go1.22.6.linux-amd64.tar.gz -O /home/eli/go1.22.6.linux-amd64.tar.gz
RUN sudo tar -xzf /home/eli/go1.22.6.linux-amd64.tar.gz -C /usr/local/
RUN rm /home/eli/go1.22.6.linux-amd64.tar.gz /home/eli/teller-x86_64-linux.tar /home/eli/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
RUN rm -rf /home/eli/teller-x86_64-linux
COPY ./.zsh_aliases /home/$USERNAME/ 
RUN echo 'source  ~/.zsh_aliases' >> /home/$USERNAME/.zshrc
RUN mkdir ~/.virtualenvs
WORKDIR /home/$USERNAME
COPY zshrc /home/$USERNAME
RUN cat /home/$USERNAME/zshrc >> /home/$USERNAME/.zshrc
ENTRYPOINT [ "/usr/bin/zsh" ]