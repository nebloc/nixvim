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
  ];


  config = {
    globals = {
      mapleader = " ";
    };
  
  plugins.dap = {
  enable = true;
  };
    colorschemes.rose-pine = {
      enable = true;
      style = "moon";
    };

    clipboard.register = "unnamedplus";

    options = {
      relativenumber = true;
      undofile = true;
      breakindent = true;
      mouse = "a";
      hlsearch = false; # Don't leave searches highlighted 
      showmode = false;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
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
      {
        event = "FileType";
        pattern = [ "scala" "sbt" "java" ];
        callback = {
          __raw = /*lua */''
            function()
              local opts = { noremap = true, silent = true }
              local api = vim.api
              local cmd = vim.cmd
              local metals = require("metals")
              local metals_config = metals.bare_config()

              local capabilities = vim.lsp.protocol.make_client_capabilities()
              local cmp_nvim_lsp = require("cmp_nvim_lsp")
              metals_config.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

              -- metals_config.on_attach = function(client, bufnr)
              --   metals.setup_dap()
              -- end

              metals_config.init_options = {
                statusBarProvider = "lualine",
                icons = "unicode",
                disableColorOutput = false,
              }

              metals_config.settings = {
                showImplicitArguments = true,
                showImplicitConversionsAndClasses = true,
                showInferredType = true,
              }
              require("metals").initialize_or_attach(metals_config)
            end
          '';
        };
        group = "nvim-metals";
      }
    ];

    # Yank on Highlight
    autoGroups = {
      YankHighlight = {
        clear = true;
      };
      nvim-metals = {
        clear = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-metals
      vim-sleuth
    ];

    plugins.comment-nvim.enable = true; # use gc<Motion> to comment lines
    plugins.indent-blankline.enable = true; # show indent lines

    plugins.surround.enable = true;
  };
}
