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
      # metals = {
      #   enable = true;
      #   filetypes = [ "sbt" "scala" ];
      # };
      nixd.enable = true;
      pyright.enable = true;
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

  # plugins.cmp-nvim-lsp.enable = true;
  # plugins.cmp-path.enable = true;
  # plugins.luasnip.enable = true;
  # plugins.cmp_luasnip.enable = true;

  plugins.cmp = {
    autoEnableSources = true;
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

  plugins.nvim-cmp = {
    enable = true;
  };

  plugins.fidget.enable = true;
}
