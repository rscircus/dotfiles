#TODO: Input such that the user doesn't destroy his/her existing config files

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
ln -sf ~/dotfiles/utils/bitpocket/bin/bitpicket ~/dotfiles/bin/bitpocket 
ln -sf ~/dotfiles/utils/todo/todo.sh ~/dotfiles/bin/t 

echo "Installing oh-my-zsh..."

# Install oh-my-zsh:
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#TODO: copy rawland theme to .oh-my-zsh
#
# Install various zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

echo "Installing diff-highlight, ack and tpm for tmux..."

# Install diff-highlight
curl https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight > ~/bin/diff-highlight && chmod +x ~/bin/diff-highlight

# Install ack:
curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack && chmod 0755 !#:3

# Install tmux add ons
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

# Autojump:
git clone git://github.com/joelthelion/autojump.git ~/dotfiles/utils/autojump
cd ~/dotfiles/utils/autojump
./install.py
