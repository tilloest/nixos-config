{ config, pkgs, ... }:

{
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
        "default.clock.min-quantum" = 512;
        "default.clock.max-quantum" = 2048;
      };
    };

    wireplumber.extraConfig."51-disable-dualsense-audio" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            {
              "device.name" = "alsa_input.usb-Sony_Interactive_Entertainment_DualSense_Wireless_Controller*";
            }
          ];
          actions = {
            update-props = {
              "device.disabled" = true;
            };
          };
        }
      ];
    };
  };
}
