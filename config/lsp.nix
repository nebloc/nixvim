{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      gopls.enable = true;
      ts_ls.enable = true;
      lua_ls.enable = true;
      rust_analyzer = {
        enable = true;
        installRustc = false;
        installCargo = false;
      };
      nixd = {
        enable = true;
        extraOptions = {
          formatting = {
            command = "nixfmt";
          };
      	};
      };
      pyright.enable = true;
    };
    keymaps = {
      lspBuf = {
        "<leader>ff" = "format";
        K = "hover";
        gD = "references";
        gd = "definition";
        "<leader>rn" = "rename";
        "<C-k>" = "signature_help";
      };
    };
  };

  plugins.cmp-path.enable = true;
  plugins.luasnip.enable = true;
  plugins.cmp_luasnip.enable = true;

  plugins.cmp = {
    enable = true;
    autoEnableSources = false;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "path"; }
      ];
      snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete {}";
        "<C-y>" = "cmp.mapping.confirm({select = true})";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
    }; 
  };

  plugins.fidget.enable = true;
}
