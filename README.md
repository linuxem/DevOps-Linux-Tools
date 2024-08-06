# DevOps-Linux-Tools

# Install eza, Info @ https://eza.rocks/

sudo apt install eza

# Installing zsh  and oh-my-zsh + Powerlevel10k is a theme

sudo apt update && sudo apt upgrade && sudo apt install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
source ~/.zshrc
# Installing bat

sudo apt install bat

# Installing fzf, Info @ https://junegunn.github.io/fzf/

sudo apt install fzf

# Installing fzf-tab 

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# Install devbox info https://nix.dev/ 

curl -fsSL https://get.jetify.com/devbox | bash

# Install GitHub cli, Info @ https://cli.github.com/

(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

sudo apt update
sudo apt install gh








