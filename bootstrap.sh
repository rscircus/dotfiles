#TODO: Input such that the user doesn't destroy his/her existing config files

# Create local *nix-ish filesystem:
mkdir -p ~/local/bin
mkdir -p ~/local/share
mkdir -p ~/local/include

echo "Linking rc files..."
# Configuration files:
######################
#ln -sf ~/dotfiles/config/bashrc ~/.bashrc
ln -sf ~/dotfiles/config/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/config/ctags ~/.ctags
ln -sf ~/dotfiles/config/screenrc ~/.screenrc
ln -sf ~/dotfiles/config/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/config/Xmodmap ~/.Xmodmap
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# Executables:
##############
ln -sf ~/dotfiles/utils/bitpocket/bin/bitpocket ~/local/bin/bitpocket 
ln -sf ~/dotfiles/utils/todo/todo.sh ~/dotfiles/bin/t 

echo "Installing oh-my-zsh..."

# Install oh-my-zsh:
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#TODO: copy rawland theme to .oh-my-zsh
#
# Install various zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions

echo "Installing diff-highlight, ack and tpm for tmux..."

# Install diff-highlight
curl https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight > ~/local/bin/diff-highlight && chmod +x ~/local/bin/diff-highlight

# Install ack:
curl http://beyondgrep.com/ack-2.14-single-file > ~/local/bin/ack && chmod 0755 !#:3

# Install tmux add ons
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

# Autojump:
git clone git://github.com/joelthelion/autojump.git ~/dotfiles/utils/autojump
cd ~/dotfiles/utils/autojump
./install.py

# Marktag (markdown support for tagbar)
gem install --user-install marktag

# Doing: https://github.com/ttscoff/doing
gem install --user-install doing

# Tig:

echo "Installing tig..."
git clone https://github.com/jonas/tig ~/dotfiles/utils/tig
cd ~/dotfiles/utils/tig
make configure
make
cd ~/src
cp tig ~/local/bin

# Copy ~/dotfiles/bin to ~/local/bin
cp ~/dotfiles/bin/* ~/local/bin

# ag? https://github.com/ggreer/the_silver_searcher
while true; do
  read -p "Are you on Debian and do you want to install ag? [y/n]" yn
  case $yn in
    [Yy]* ) sudo apt-get install silversearcher-ag; break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done

