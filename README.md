# DevOps-Linux-Tools

# Install eza info https://eza.rocks/

sudo apt install eza

# Installing zsh  and oh-my-zsh + Powerlevel10k is a theme

sudo apt update && sudo apt upgrade && sudo apt install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
source ~/.zshrc
# Installing bat

sudo apt install bat

# Installing fzf Info @ https://junegunn.github.io/fzf/

sudo apt install fzf

# Installing fzf-tab 

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# Install devbox info https://nix.dev/ 

curl -fsSL https://get.jetify.com/devbox | bash







