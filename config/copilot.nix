{pkgs, ...}:
{
  plugins.copilot-vim = {
    enable = true;
    settings = {
      filetypes = {
        "python" = true;
        "html" = true;
        "nix" = true;
        "*" = false;
      };
    };
  };
}
