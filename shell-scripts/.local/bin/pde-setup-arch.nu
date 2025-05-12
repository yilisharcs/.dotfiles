#!/usr/bin/env nu

##################
### PACMAN-WSL ###
##################

[
  atool                          # compression and extraction tools
  bat                            # better cat
  bob                            # neovim version manager
  btop                           # tui system monitor
  chafa                          # terminal image visualizer
  fd                             # better find
  ffmpeg
  ffmpegthumbnailer
  # imagemagick
  less                           # pager utility
  lf                             # tui file explorer
  man-db                         # man command
  man-pages                      # Linux man pages
  mesa-utils                     # gpu utils
  mold                           # better linker
  ncdu                           # disk space checker
  openssh
  pass                           # cli password manager
  # picard                         # music metadata editor
  ripgrep                        # better grep
  # ripgrep-all (also what's repgrep lmao)
  skim                           # fuzzy finder
  starship                       # shell prompt tool
  stow                           # symlink manager
  syncthing                      # peer-to-peer file sync
  trash-cli
  tree                           # dir viewer
  wl-clipboard                   # pass dependency
  xclip                          # in use because wl-clip creates a window to access the clipboard
  yt-dlp
  zk
  zoxide                         # better cd

  # dev libs and tools
  bacon                          # background code checker
  base-devel                     # provides gnu make
  cmake
  curl
  dioxus-cli
  git
  github-cli
  go
  jujutsu                        # another version control system
  ninja
  pkgconf
  python
  python-pipx                    # python package manager
  rustup                         # rust toolchain manager
  sccache                        # build cache tool
  sqlite
  tmux
  tokei                          # loc counter
  wget
  yq                             # cli json, yaml, and xml processor
] | sudo pacman -S ...$in --noconfirm

bob use nightly

# sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

[
  carapace-bin                   # multishell completion engine
  ctpv                           # lf previewer
  fnm                            # fast node version manager
  pandoc-bin                     # markup converter
  wsl-open
] | yay -s --noconfirm ...$in

####################
### RUST-N-CARGO ###
####################

rustup default stable
rustup component add rust-analyzer
rustup target install wasm32-unknown-unknown

[
  # [ "--locked" "wiki-tui" ]
  # [ "cargo-audit" ]
  # [ "cargo-auditable" ]
  [ "cargo-binstall" ]
  [ "cargo-generate" ]
  [ "cargo-modules" ]
  # [ "cargo-nextest" ]
  # [ "cargo-sweep" ]
  [ "cargo-update" ]
  [ "porsmo" ]
  [ "ra-multiplex" ]
  [ "speedtest-rs" ]
] | each {|e| cargo install ...$e } | ignore

##################
### NU-PLUGINS ###
##################

# CORE
[
  /usr/bin/nu_plugin_gstat
  /usr/bin/nu_plugin_inc
  /usr/bin/nu_plugin_query
] | each { plugin add $in } | ignore

# THIRD-PARTY
[
  [ "--locked" "nu_plugin_skim" ]
  [ "--locked" "nu_plugin_regex" ]
] | each {|e| cargo install ...$e } | ignore

[
  "~/.cargo/bin/nu_plugin_skim"
  "~/.cargo/bin/nu_plugin_regex"
] | each {|e| plugin add $e } | ignore

echo $'(ansi blue_bold)    Added Nushell plugins!(ansi reset)'

###############
### DEV-ENV ###
###############

# Stow symlinks whole dirs if they don't exist. Without this,
# the system will cram stuff where it isn't supposed to go.
[
  .config
  .local/bin
  .local/include
  .local/lib
  .local/share/icons/hicolor/128x128/apps
  .local/share/nvim/lazy
  .local/share/nvim/mason
  .local/share/man/man1
  .local/state
  opt
  stow
] | each {|e| $env.HOME | path join $e | mkdir $in }

# Symlinks that stow can't automate
ln -s "~/.local/share/Trash" "~/Trash"

make -C "~/.dotfiles"
