# Add debian wheezy-backports
echo "# Add debian backports to list" >> /etc/apt/sources.list
echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
aptitude update
aptitude safe-upgrade

# Install basics
aptitude install git-core autoconf automake curl emacs24-nox terminator

# Install and use fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_7.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
chsh -s /usr/bin/fish zangther

# Delete old config files and put new ones instead
rm .config/terminator/config 2> /dev/null
rm .config/fish/config.fish 2> /dev/null

# Add terminator config file
echo '[global_config]
  geometry_hinting = False
  window_state = fullscreen
  tab_position = hidden
  handle_size = -2
  borderless = True
[profiles]
  [[default]]
    use_system_font = False
    font = Monospace 11
    scrollbar_position = hidden
    show_titlebar = False
    foreground_color = "#ffffff"
[layouts]
  [[default]]
    [[[child1]]]
      profile = default
      type = Terminal
      parent = window0
    [[[window0]]]
      type = Window
      parent = ""
[plugins]
' > ~/.config/terminator/config

# Get fish config.fish file
echo "echo # Makes emacs no window
alias emacs='emacs -nw'

# Aliases
alias la='ls -la'
alias ll='ls -l'
" > ~/.config/fish/config.fish

# Install prompt
mkdir ~/.config/fish/functions
wget -O ./.config/fish/functions/fish_prompt.fish https://raw.githubusercontent.com/bpinto/oh-my-fish/master/themes/integral/fish_prompt.fish

# Git config
git config --global user.name "Bastien Duplessier"
git config --global user.email "bastien.duplessier@gmail.com"
git config --global color.ui true
git config --global core.editor emacs
