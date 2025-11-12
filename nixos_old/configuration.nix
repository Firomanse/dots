{ config, pkgs, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];


  #Auto upgrade & garbage collection
  system.autoUpgrade = {
    enable = true;
    dates = "monthly";
    allowReboot = false;
    persistent = true;
  };

  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 90d";
  };


  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Latest kernel for new hardware
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firmware for new GPU
  hardware.enableRedistributableFirmware = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Graphics configuration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa                  #основные дрова
      vulkan-loader
      vulkan-validation-layers
      libva                 #аппаратное ускорение видео
      libva-utils
      libvdpau-va-gl        #мост для api libva
      rocmPackages.clr.icd  #поддержка OpenCL
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.mesa
    ];
  };


  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Time zone.
  time.timeZone = "Europe/Moscow";

  # internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT    = "ru_RU.UTF-8";
    LC_MONETARY       = "ru_RU.UTF-8";
    LC_NAME           = "ru_RU.UTF-8";
    LC_NUMERIC        = "ru_RU.UTF-8";
    LC_PAPER          = "ru_RU.UTF-8";
    LC_TELEPHONE      = "ru_RU.UTF-8";
    LC_TIME           = "ru_RU.UTF-8";
  };

  # X11 windowing system.
  services.xserver.enable = true;

  # KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Keymap config in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  # Printing
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # User account
  users.users.roman = {
    isNormalUser = true;
    description = "Roman";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Autologin
  services.displayManager.autoLogin = {
    enable = true;
    user = "roman";
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Gamemode performance mode
  programs.gamemode.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    linuxKernel.kernels.linux_zen

    # Gpu & monitoring
    vulkan-tools
    mesa-demos
    radeontop
    clinfo
    lact #разгон/андервольт, но пока нет системного модуля у nixos

    # Games & compatibility
    lutris
    heroic
    bottles-unwrapped
    wineWowPackages.stable
    protonup-qt
    winetricks

    # Utilities
    mpv
    libreoffice-qt6-fresh
    qbittorrent
    neovim
    pciutils

    # Other
    jdk
    glfw3-minecraft
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
  system.stateVersion = "25.05"; # Did you read the comment?
}
