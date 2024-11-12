{config, pkgs, ... }:
let
        unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { config = { allowUnfree = true; };  };
in

 {
  
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
    packageOverrides = pkgs: with pkgs; {
  };
};

  environment.systemPackages = with pkgs; [
    # Desktop apps
    pkgs.vinegar  
    audacity
    kitty
    obs-studio
    kdenlive
    librewolf # web browser of choice
    tor-browser
    vscode
    #sublime
    dolphin
    gimp
    vlc
    protonvpn-cli

    # user packages, for my personal uses
    #rmg # n64 emulator
    plover.dev #stenography engine
    kicad #pcb designing software
    unstable.osu-lazer-bin # osu rhythmm game
    steam # games
    obsidian #markdown notes app
    unstable.renoise #best daw :3
    lmms # daw that actually works :c
    discord #no
    aseprite # pixel artsss
    krita # paint 
    anki # flashcards
    alvr # virtual reality streaming

    # Coding stuff
    gnumake
    lxde.lxsession
    gcc
    nodejs
    python
    (python3.withPackages (ps: with ps; [ requests ]))

    # CLIs & utils
    xorg.setxkbmap
    vim
    speedcrunch
    neovim
    #spacevim
    neofetch
    file
    tree
    wget
    git
    fastfetch
    cowsay
    catnip
    fortune
    htop
    nix-index
    unzip
    scrot
    xclip
    ffmpeg
    light
    lux
    mediainfo
    ranger
    zram-generator
    cava
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    swww
    openssl
    lazygit
    bluez
    bluez-tools
    kdePackages.qtsvg
    wine
    wine64
    winetricks
    wineasio
    
    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx
    opentabletdriver
    # stuff
    papirus-icon-theme

    # WMs and stuff
    blugon
    bspwm
    polybar
    #waybar
    eww
    unstable.picom
    dmenu
    rofi
    dunst


    # Sound
    pipewire
    pulseaudio
    pamixer

    # GPU stuff 
    amdvlk
    rocm-opencl-icd
    glaxnimate


    # Other

   # home-manager

  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    comic-mono
    maple-mono-NF
    zpix-pixel-font
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}

