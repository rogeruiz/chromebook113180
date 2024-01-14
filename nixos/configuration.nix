# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;
    autorun = true;
    libinput.touchpad.naturalScrolling = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3blocks
        i3status
        i3lock
        lxappearance
      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yo = {
    isNormalUser = true;
    description = "Roger Steve Ruiz";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.zsh;
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "yo";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # https://nixos.wiki/wiki/Storage_optimization#Moving_the_store
  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/e6d37150-545c-4ec8-956b-958e70627757";
    fsType = "ext4";
    neededForBoot = true;
    options = [ "noatime" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    dropbox
    dropbox-cli

    alacritty
    starship
    tmux
    rustup
    openssl_3_2
    git
    wget
    curl
    firefox
    thunderbird
    htop
    bottom

    clipmenu
    xclip

    brightnessctl

    picom

    home-manager

    acpi
    fetchutils
    busybox
    iw

    gcc
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Para que `i3blocks` pueda encontrar el camino pa' su configuracion
  environment.pathsToLink = [ "/libexec" "/share/zsh" ];

  programs.dconf.enable = true;


  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.enableAllFirmware = true;

  programs.light.enable = true;

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "yo" ];
  };
}
