{ pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./welcome.nix
    ./lualine.nix
    ./git.nix
    ./lsp.nix
    ./keymaps.nix
    ./telescope.nix
    ./treesitter.nix
    ./harpoon.nix
    ./metals.nix
    ./dap.nix
    ./copilot.nix
  ];

  config = {
    viAlias = true;
    vimAlias = true;
    globals = {
      mapleader = " ";
    };

    colorschemes.rose-pine = {
      enable = true;
      settings.dark_variant = "moon";
    };

    clipboard.register = "unnamedplus";

    opts = {
      relativenumber = true;
      undofile = true;
      breakindent = true;
      mouse = "a";
      hlsearch = false; # Don't leave searches highlighted
      showmode = false;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      completeopt = "menu,menuone,noinsert";
    };

    autoCmd = [
      {
        event = "TextYankPost";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        };
        group = "YankHighlight";
        pattern = "*";
      }
    ];

    # Yank on Highlight
    autoGroups = {
      YankHighlight = {
        clear = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
    ];

    plugins.comment.enable = true; # use gc<Motion> to comment lines
    plugins.indent-blankline.enable = true; # show indent lines

    plugins.vim-surround.enable = true;
  };
}
