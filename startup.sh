# Add debian wheezy-backports
echo "# Add debian backports to list" >> /etc/apt/sources.list
echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
aptitude update
aptitude safe-upgrade

# Install basics
aptitude install git-core autoconf automake curl emacs24-nox

# Install terminator (terminal emulator)
aptitude install terminator


# Install and use fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
chsh -s /usr/bin/fish

# Delete old config files and put new ones instead
#rm .config/terminator/config 2> /dev/null
#rm .config/fish/config.fish 2> /dev/null
# [TODO] Fetch files and paste them where they belong
# Get terminator config file
# Get fish config.fish file
# Get fish fish_prompt.fish file
