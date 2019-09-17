# Install script based on oh-my-zsh.

# Settings
GIT_CLONE_URL=https://github.com/tspng/zsh-config.git
ZSH_INSTALL_DIR=~/.zsh


CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    printf "zsh is not installed, please install it first.\n"
    exit
fi
unset CHECK_ZSH_INSTALLED

if [ ! -n "$ZSH_DIR" ]; then
    ZSH_DIR=$ZSH_INSTALL_DIR
fi

if [ -d "$ZSH_DIR" ]; then
    printf "You already have a $ZSH_DIR directory\n"
    printf "Do you want to move it to $ZSH_DIR.backup and continue installing (y/n)? "
    read answer
    if echo "$answer" | grep -iq "^y" ;then
        mv $ZSH_DIR $ZSH_DIR.backup
        ZSH_DIR=$ZSH_INSTALL_DIR
    else
        printf "Abort installation.\n"
        exit
    fi
fi

# Prevent the cloned repository from having insecure permissions. Failing to do
# so causes compinit() calls to fail with "command not found: compdef" errors
# for users with insecure umasks (e.g., "002", allowing group writability). Note
# that this will be ignored under Cygwin by default, as Windows ACLs take
# precedence over umasks except for filesystems mounted with option "noacl".
umask g-w,o-w

hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
}

printf "Cloning zsh-config repo...\n"
env git clone --depth=1 $GIT_CLONE_URL $ZSH_DIR || {
    printf "Error: git clone of zsh-config repo failed\n"
    exit 1
}

printf "Getting git submodules...\n"
(cd $ZSH_DIR && \
env git submodule update --init --recursive && \
env git pull --recurse-submodules) || {
    printf "Error: git submodule fetching failed\n"
    exit 1
}


printf "Looking for an existing zsh config...\n"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    printf "Found ~/.zshrc, backing up to ~/.zshrc.backup\n"
    mv ~/.zshrc ~/.zshrc.backup
fi

printf "Creating ~/.zshrc link\n"
ln -s ~/.zsh/zshrc ~/.zshrc

printf "\nInstallation completed!\n"
printf "Custom or private env variables can be added to $ZSH_DIR/env_local.zsh\n"
env zsh
