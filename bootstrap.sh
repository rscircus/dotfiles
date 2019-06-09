#TODO: Input such that the user doesn't destroy his/her existing config files

####
echo "Create local *nix-ish filesystem..."
####
#
mkdir -p ~/local/bin
# TODO: Move to ~/.local and adapt ~/.zshrc

####
echo "Executables get copied to ~/local/bin..."
####

# Copy ~/dotfiles/bin to ~/local/bin
cp ~/dotfiles/bin/* ~/local/bin
cp ~/dotfiles/utils/autohide-Panel.sh ~/local/bin

####
echo "Installing oh-my-zsh..."
####

# Install oh-my-zsh:
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# TODO: This interrupts this script. Maybe a silent way is possible

# Copy my theme into theme dir
cp ~/dotfiles/zsh/themes/rawland.zsh-theme ~/.oh-my-zsh/themes

# Install various zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions

####
echo "Install linux/homebrew..."
####
git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -s ../Homebrew/bin/brew ~/.linuxbrew/bin
eval $(~/.linuxbrew/bin/brew shellenv)

####
echo "Installing tpm for tmux..."
####

# Install tmux add ons
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

####
echo "Installing driller..."
####

wget https://raw.githubusercontent.com/jonhiggs/driller/latest/driller -O ~/local/bin/driller
chmod +x ~/local/bin/driller

####
echo "Potentially installing many practical bins via brew..."
echo "Prompt: (Warning: this can fail)"
####

while true; do
    read -p "Do you wish to install a bunch of brews?" yn
    case $yn in
        [Yy]* ) make brews_install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes [Y/y] or no [N/n].";;
    esac
done

# TODO:
####
echo "git-time-metric is nice, but doesn't install well..."
echo "Check: https://github.com/git-time-metric/gtm ..."
####


####
echo "Linking rc files..."
####

# Configuration files:
######################
# TODO: Check if not overwriting files:
#
#ln -sf ~/dotfiles/config/bashrc ~/.bashrc
ln -sf ~/dotfiles/config/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/config/ctags ~/.ctags
ln -sf ~/dotfiles/config/screenrc ~/.screenrc
ln -sf ~/dotfiles/config/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/config/Xmodmap ~/.Xmodmap
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc


####
echo "Installing hosts based adblocking: hosts-gen...(sudo required)"
####
# TODO: This moved, have to paths
# cd ~/local/src
# git clone http://git.r-36.net/hosts-gen
# cd hosts-gen
# sudo make install
# sudo hosts-gen
#
# # Now that gets you a few blockable domains:
# sudo cp examples/gethostszero /bin
# sudo chmod 775 /bin/gethostszero
# sudo /bin/gethostszero
# sudo hosts-gen
#
# # Update it from time to time:
# echo "Add this to root's crontab -e:"
# echo "@weekly gethostszero"
# echo "@weekly hosts-gen"
