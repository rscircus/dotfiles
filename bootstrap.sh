#TODO: Input such that the user doesn't destroy his/her existing config files

# Create local *nix-ish filesystem:
mkdir -p ~/local/bin
mkdir -p ~/local/share
mkdir -p ~/local/include
mkdir -p ~/local/src

####
echo "Executables..."
####

# Copy ~/dotfiles/bin to ~/local/bin
cp ~/dotfiles/bin/* ~/local/bin

# Executables:
##############
ln -sf ~/dotfiles/utils/bitpocket/bin/bitpocket ~/local/bin/bitpocket
ln -sf ~/dotfiles/utils/todo/todo.sh ~/local/bin/t

####
echo "Installing oh-my-zsh..."
####

# Install oh-my-zsh:
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Copy my theme into theme dir
cp ~/dotfiles/zsh/themes/rawland.zsh-theme ~/.oh-my-zsh/themes

# Install various zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions

####
echo "Installing fzf..."
####
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

####
echo "Installing diff-highlight, ack and tpm for tmux..."
####

# Install diff-highlight
curl https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight > ~/local/bin/diff-highlight && chmod +x ~/local/bin/diff-highlight

# Install tmux add ons
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

# Autojump:
git clone git://github.com/joelthelion/autojump.git ~/dotfiles/utils/autojump
cd ~/dotfiles/utils/autojump
./install.py

####
echo "Installing marktag & doing..."
####

# Marktag (markdown support for tagbar)
gem install --user-install marktag

# Doing: https://github.com/ttscoff/doing
gem install --user-install doing

####
echo "Installing tig..."
####
git clone https://github.com/jonas/tig ~/dotfiles/utils/tig
cd ~/dotfiles/utils/tig
make configure
make
cd ./src
cp tig ~/local/bin

####
echo "Installing ag..."
####

# ag? https://github.com/ggreer/the_silver_searcher
while true; do
  read -p "Are you on Debian and do you want to install ag? [y/n]" yn
  case $yn in
    [Yy]* ) sudo apt-get install silversearcher-ag; break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no.";;
  esac
done

####
echo "Installing ripgre (requires cargo)..."
####
cargo install ripgrep

####
echo "Installing desk..."
####
curl https://raw.githubusercontent.com/jamesob/desk/master/desk > ~/local/bin/desk
# oh-my-zsh
cd ~/.oh-my-zsh/custom/plugins
git clone git@github.com:jamesob/desk.git /tmp/desk && cp -r /tmp/desk/shell_plugins/zsh desk

####
echo "Installing thefuck..."
####
pip install --user thefuck

####
echo "Installing TaskWarrior..."
####
git clone https://git.tasktools.org/scm/tm/task.git ~/dotfiles/utils/taskwarrior
cd ~/dotfiles/utils/taskwarrior
cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=~/.local .
make
make install


####
echo "Installing tasklib (Python Taskwarrior)..."
####
pip install --user --upgrade git+git://github.com/tbabej/tasklib@develop

####
echo "Installing fasd..."
####
git clone https://github.com/clvv/fasd ~/local/share/fasd
cp ~/local/share/fasd/fasd ~/local/bin/fasd
eval "$(fasd --init auto)"s

####
echo "Linking rc files..."
####

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

####
echo "Installing hosts-gen..."
####
cd ~/local/src
git clone http://git.r-36.net/hosts-gen
cd hosts-gen
sudo make install
sudo hosts-gen

# Now that gets you a few blockable domains:
sudo cp examples/gethostszero /bin
sudo chmod 775 /bin/gethostszero
sudo /bin/gethostszero
sudo hosts-gen

# Update it from time to time:
echo "Add this to root's crontab -e:"
echo "@weekly gethostszero"
echo "@weekly hosts-gen"
