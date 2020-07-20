THISDIR=`pwd`

# Backup
BACKUPNAME="backup-`date +%y-%m-%d-%H:%M:%S`"
mkdir $BACKUPNAME

function backup {
	cp -r $@ $BACKUPNAME
}

echo "Start to setup..."
echo "Old config was in $BACKUPNAME"

#work dir
if [ ! -e /data/lleoli/ ]; then 
   sudo mkdir -p /data/lleoli
fi

if [ ! -e ~/work ]; then 
    ln -sf /data/lleoli ~/work
fi

if [ ! -e ~/mybin ]; then 
    mkdir ~/mybin
fi

# Bash
backup ~/.bashrc
ln -sf $THISDIR/_bashrc ~/.bashrc
#ln -sf $THISDIR/_testbash.py ~/.testbash.py

# Git
#backup ~/.gitconfig
#ln -sf $THISDIR/_gitconfig ~/.gitconfig

# tmux
backup ~/.tmux.conf
rm -rf ~/.tmux.conf
ln -sf $THISDIR/_tmux.conf ~/.tmux.conf

# Vim
backup ~/.vim ~/.vimrc
rm -rf ~/.vim ~/.vimrc
#下载vim插件的子模块
git submodule init
git submodule update
ln -s $(pwd)/_vim ~/.vim
ln -s $(pwd)/_vimrc ~/.vimrc


