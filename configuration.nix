{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./spicetify.nix
  ];

  # --- Bootloader & Kernel ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernel.sysctl."vm.max_map_count" = 2147483642;
  boot.kernelParams = [ "amdgpu.backlight=0" "acpi_backlight=vendor" ];

  # --- Networking ---
  networking.hostName = "sofia";
  networking.networkmanager.enable = true;

  # --- Localization & Time ---
  time.timeZone = "Europe/Vilnius";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_TIME = "lt_LT.UTF-8";
    LC_MONETARY = "lt_LT.UTF-8";
    LC_MEASUREMENT = "lt_LT.UTF-8";
  };

  # --- Hardware & Drivers ---
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # --- Input Devices ---
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0";
    };
  };

  # --- Desktop Environment & Window Manager ---
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.xkb = {
    layout = "us,lt";
    variant = ",";
    options = "grp:alt_shift_toggle";
  };

  # --- Audio & Sound ---
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 128;
        "default.clock.max-quantum" = 2048;
      };
    };
  };

  # --- Nix Settings & Maintenance ---
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };

  # --- User Accounts ---
  users.users.tillo = {
    isNormalUser = true;
    description = "tillo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # --- System-wide Packages ---
  environment.systemPackages = with pkgs; [
    onlyoffice-desktopeditors
    tealdeer
    wget
    git
    mangohud
    floorp-bin
    fastfetch
    discord
    easyeffects
    lsp-plugins
    unrar
    unzip
    ghostty
    vscode
    winetricks
    protontricks
    qalculate-qt
    protonplus
    pinta
    parabolic
    obs-studio
    inkscape
    input-remapper
    lutris
    heroic
    czkawka
    obsidian
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  # --- Fonts ---
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  # --- Programs & Additional Services ---
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.dconf.enable = true;
  programs.corectrl.enable = true;
  services.flatpak.enable = true;
  services.fwupd.enable = true;
  services.thermald.enable = true;
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
    dates = "04:00";
    randomizedDelaySec = "30min";
  };
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.printing.enable = true;
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "tilloest";
        email = "178488902+tilloest@users.noreply.github.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  # --- Shell ---
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "fzf"
        "zoxide"
      ];
      theme = "";
    };
    shellAliases = {
      ll    = "ls -lah";
      ".."  = "cd ..";
      "..." = "cd ../..";
      update  = "nh os switch";
      cleanup = "nh clean all";
    };
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
  };

  users.users.tillo.shell = pkgs.zsh;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol   = "[❯](bold red)";
      };
      directory = {
        truncation_length = 4;
        truncate_to_repo  = true;
      };
      git_branch.symbol = " ";
      nix_shell = {
        symbol = " ";
        format = "via [$symbol$state]($style) ";
      };
    };
  };

  programs.fzf = {
    fuzzyCompletion = true;
    keybindings     = true;  # Ctrl+R history, Ctrl+T file, Alt+C cd
  };

  programs.zoxide = {
    enable               = true;
    enableZshIntegration = true;
  };

  # --- System Version ---
  system.stateVersion = "25.11";
}
