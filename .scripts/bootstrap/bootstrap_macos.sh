#!/bin/sh

echo "This script will install xcode cli tools along with Homebrew and common packages "

xcode-select --install

sudo -v

cd ~

echo "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew=(
aom
asciiquarium
bash
bat
bdw-gc
berkeley-db
brotli
c-ares
cairo
cmatrix
coreutils
cowsay
dav1d
docbook
docbook-xsl
emacs
fd
ffmpeg
flac
fontconfig
fortune
freetype
frei0r
fribidi
fzf
gdbm
gettext
ghostscript
giflib
glib
gmp
gnu-getopt
gnutls
gobject-introspection
gotop
graphite2
grep
guile
harfbuzz
htop
icu4c
imagemagick
imath
imlib2
jansson
jbig2dec
jemalloc
jpeg
jq
lame
leptonica
libarchive
libass
libb2
libbluray
libde265
libev
libevent
libexif
libffi
libheif
libidn
libidn2
liblqr
libogg
libomp
libpng
libpthread-stubs
libsamplerate
libsndfile
libsodium
libsoxr
libtasn1
libtiff
libtool
libunistring
libuv
libvidstab
libvorbis
libvpx
libx11
libxau
libxcb
libxdmcp
libxext
libxft
libxrender
libyaml
libzip
little-cms2
lsd
lua
luajit-openresty
lz4
lzo
m4
mas
mpdecimal
mpv
mujs
ncurses
neofetch
nettle
nghttp2
node
oniguruma
opencore-amr
openexr
openjpeg
openssl@1.1
opus
p11-kit
pcre
perl
pfetch
pixman
pkg-config
python@3.9
rav1e
readline
rubberband
ruby
screenresolution
sdl2
shared-mime-info
sl
snappy
speex
sqlite
srt
tesseract
the_silver_searcher
theora
tldr
tree
tty-clock
uchardet
unbound
vapoursynth
vim
webp
wget
x264
x265
xmlto
xorgproto
xvid
xz
youtube-dl
zeromq
zimg
zstd
)

cask=(
alacritty
appcleaner
chromium
font-hack-nerd-font
hiddenbar
rectangle
stats
transmission
)

mas=(
408981434 #iMovie
409201541 #Pages
409183694 #Keynote
425424353 #The Unarchiver
409203825 #Number
497799835 #Xcode
)

brew update 
brew upgrade

brew install ${brew[@]} #Homebrew App Installer
brew install --cask ${cask[@]} #Casks Installer
mas install ${mas[@]} #Mac App Store Installer


cd ~
mkdir repos
cd repos

git clone https://github.com/KunalMamgain/dotfiles.git

ln -sf ~/repos/dotfiles/.vimrc ~/.vimrc
ln -sf ~/repos/dotfiles/.bashrc ~/.bashrc
ln -sf ~/repos/dotfiles/.bash_prompt ~/.bash_prompt
ln -sf ~/repos/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/repos/dotfiles/.aliases ~/.aliases
ln -sf ~/repos/dotfiles/.config ~/.config
ln -sf ~/repos/dotfiles/.scripts ~/.scripts 


wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/    #git autocomplete in bash 
mv ~/git-completion.bash ~/.git-completion.bash

git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons #Ranger devicons

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#MACOS CONFIGURATION
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv" #Changes Default Finder View to List
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false #Stop the automatic save to iCloud thing
defaults write com.apple.finder FXICloudDriveDesktop -bool NO #Doesn't Sync Desktop to iCloud
defaults write com.apple.dock autohide-time-modifier -int 0 #Sets Dock Autohide Time to O Seconds
defaults write com.apple.dock magnification -bool  NO #Turns of Dock Magnification

killall dock
killall Finder
killall SystemUIServer

echo 'Type :PlugInstall in vimrc to install plugins'
echo 'Installation Complete'
