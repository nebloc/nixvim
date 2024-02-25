{ pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./welcome.nix
    ./bufferline.nix
    ./git.nix
    ./lsp.nix
    ./keymaps.nix
    ./telescope.nix
    ./treesitter.nix
    ./harpoon.nix
  ];
  colorschemes.rose-pine = {
    enable = true;
    style = "moon";
  };


  globals = {
    mapleader = " ";
    undofile = true;
    clipboard = "unnamedplus";
  };
  
  localOptions = {
    relativenumber = true;
    mouse = "a";
    hlsearch = false; # Don't leave searches highlighted 
    breakindent = true;
  };

  plugins.comment-nvim.enable = true; # use gc<Motion> to comment lines
  plugins.indent-blankline.enable = true; # show indent lines


  extraPlugins = with pkgs.vimPlugins; [
    vim-sleuth
  ];

  # Yank on Highlight
  autoGroups = {
    YankHighlight = {
      clear = true;
    };
  };

  autoCmd = [
  {
    event = "TextYankPost";
    callback = { __raw = ''
    function()
      vim.highlight.on_yank()
    end
    '';};
    group = "YankHighlight";
    pattern = "*";
  }
  ];
}
