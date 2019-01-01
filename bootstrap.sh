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
cp ~/dotfiles/utils/autohide-Panel.sh ~/local/bin


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
echo "Installing marktag, doing & maid..."
####


####
echo "Installing ripgrep, fd-find, exa, bat..."
####
cargo install ripgrep       # faster grepping
cargo install fd-find       # find things
cargo install exa           # ls replacement
cargo install bat           # cat replacement


####
echo "Installing desk..."
####
curl https://raw.githubusercontent.com/jamesob/desk/master/desk > ~/local/bin/desk
# oh-my-zsh
cd ~/.oh-my-zsh/custom/plugins
git clone git@github.com:jamesob/desk.git /tmp/desk && cp -r /tmp/desk/shell_plugins/zsh desk


####
echo "Installing thefuck, asciinema, visidata, youtube-dl..."
####

brew install thefuck
brew install youtube-dl
#pip install --user asciinema
#pip install --user visidata


####
echo "Installing tasklib (Python Taskwarrior)..."
####

pip install --user --upgrade git+git://github.com/tbabej/tasklib@develop


####
echo "Installing TaskWarrior..."
####
git clone https://git.tasktools.org/scm/tm/task.git ~/dotfiles/utils/taskwarrior
cd ~/dotfiles/utils/taskwarrior
cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=~/.local .
make
make install


####
echo "Installing fasd..."
####
git clone https://github.com/clvv/fasd ~/local/share/fasd
cp ~/local/share/fasd/fasd ~/local/bin/fasd
eval "$(fasd --init auto)"s


####
echo "Installing oh-my-git..."
####
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git && echo source ~/.oh-my-git/prompt.sh → ~/.zshrc
####
echo "git-time-metric is nice, but doesn't install well..."
echo "Check: https://github.com/git-time-metric/gtm ..."
####


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
echo "Installing hosts-gen...(sudo required)"
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
