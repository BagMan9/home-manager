{ config, lib, pkgs, ... }:

with lib;

{
  config = {
    programs.kitty = {
      enable = true;
      package = pkgs.writeScriptBin "dummy-kitty" "";
      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        update_check_interval = 0;
      };

      font.name = "DejaVu Sans";
      font.size = 8;

      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+f>2" = "set_font_size 20";
      };
    };

    nmt.script = ''
      assertFileExists home-files/.config/kitty/kitty.conf
      assertFileContent \
        home-files/.config/kitty/kitty.conf \
        ${./example-settings-expected.conf}
    '';
  };
}
