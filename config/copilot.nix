{pkgs, ...}:
{
  plugins.copilot-vim = {
    enable = true;
    settings = {
      filetypes = {
        "python" = true;
        "html" = true;
        "nix" = true;
        "elixir" = true;
        "*" = false;
      };
    };
  };
  globals.copilot_no_tab_map = true;
  plugins.copilot-chat = {
    enable = true;
    settings = {
      model = "claude-sonnet-4";
      
    };
  };
}
