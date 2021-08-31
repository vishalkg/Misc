# dependencies
sudo yum install openssl-devel -y

# install libevent
cd ~
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
tar -zxf libevent-*.tar.gz
cd libevent-*/
./configure --prefix=$HOME/.local --enable-shared
make && sudo make install

# install ncurses
cd ~
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
tar -zxf ncurses-*.tar.gz
cd ncurses-*/
./configure --prefix=$HOME/.local --with-shared --with-termlib --enable-pc-files --with-pkg-config-libdir=$HOME/.local/lib/pkgconfig
make && sudo make install

# install tmux
cd ~
wget https://github.com/tmux/tmux/releases/download/3.2a/tmux-3.2a.tar.gz
tar -zxf tmux-*.tar.gz
cd tmux-*/
PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig ./configure --prefix=$HOME/.local
make && sudo make install

rm -rf libevent* ncurses* tmux*

echo "export LD_LIBRARY_PATH=$HOME/.local/lib" >> ~/.zshrc
echo "export PATH=$HOME/.local/bin:$PATH" >> ~/.zshrc
source ~/.zshrc
tmux -V  # should say `tmux 3.2a`
