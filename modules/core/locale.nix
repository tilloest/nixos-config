{ config, pkgs, ... }:

{
  time.timeZone = "Europe/Vilnius";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_TIME = "lt_LT.UTF-8";
    LC_MONETARY = "lt_LT.UTF-8";
    LC_MEASUREMENT = "lt_LT.UTF-8";
  };
}
