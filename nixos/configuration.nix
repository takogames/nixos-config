{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];


#  nixpkgs.overlays = [ inputs.polymc.overlay ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.userControlled.enable =true;
  users.extraUsers.tonii.extraGroups = [ "wheel" ];
  time.timeZone = "America/Chicago"; # Set your time zone.
  
  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  # nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "23.05"; # Don't change it bro
  
  hardware.opentabletdriver.enable = true;

  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};
}
