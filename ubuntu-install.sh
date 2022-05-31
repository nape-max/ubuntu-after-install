#!/bin/bash

# Docker install
sudo apt-get update && \
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt-get update && \
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# ~~~

# ~~~
# Install PHP
sudo apt-get install software-properties-common
# Ставим недостающий пакет
sudo apt-get install software-properties-common
# Добавляем репозиторий в систему
sudo add-apt-repository ppa:ondrej/php
# Обновляем список пакетов
sudo apt-get update
# Ставим РНР7.2
sudo apt-get install -y php7.2
# ~~~

# Configuring Git
echo "Please enter your git email:"
read gitEmail

echo "Please enter your git username:"
read gitUsername

git config --global user.name "$gitUsername"
git config --global user.email "$gitEmail"
# ~~~

ssh-keygen -t ed25519 -C "$gitEmail"

# ZSH Install
sudo apt-get install zsh

sudo usermod -s $(which zsh) $USER

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# ~~~

# Copying SSH key to clipboard
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
echo "Your public SSH key now in clipboard, paste it to your Version Control Service."
# ~~~
