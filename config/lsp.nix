{
  plugins.lsp = {
    enable = true;
    servers = {
      gopls.enable = true;
      tsserver.enable = true;
      lua-ls.enable = true;
      rust-analyzer = {
        enable = true;
        installRustc = false;
        installCargo = false;
      };
      metals = {
        enable = true;
        filetypes = [ "sbt" "scala" ];
      };
    };
    keymaps = {
      lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        "<leader>rn" = "rename";
        "<C-k>" = "signature_help";
      };
    };
  };

  plugins.cmp-nvim-lsp.enable = true;
  plugins.cmp-path.enable = true;
  plugins.luasnip.enable = true;
  plugins.cmp_luasnip.enable = true;

  plugins.nvim-cmp = {
    enable = true;
    autoEnableSources = true;
    sources = [
      { name = "nvim_lsp"; }
      { name = "luasnip"; }
      { name = "path"; }
    ];
    snippet.expand = "luasnip";
    mapping = {
      "<C-n>" = "cmp.mapping.select_next_item()";
      "<C-p>" = "cmp.mapping.select_prev_item()";
      "<C-b>" = "cmp.mapping.scroll_docs(-4)";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-Space>" = "cmp.mapping.complete {}";
      "<CR>" = "cmp.mapping.confirm({select = true})";
      "<Tab>" = {
        action = ''
        function(fallback)
          local luasnip = require 'luasnip'
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end
        '';
        modes = [ "i" "s" ];
      };
      "<S-Tab>" = { 
        action = ''
        function(fallback)
          local luasnip = require 'luasnip'
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end
        '';
        modes = [ "i" "s" ];
      };
    };
  };

  plugins.fidget.enable = true;
}
