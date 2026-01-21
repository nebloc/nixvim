{pkgs, ...}:
{
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c
        cpp
        go
        lua
        python
        elixir
        rust
        tsx
        javascript
        json
        typescript
        vimdoc
        vim
        bash
        scala
        nix
        rust
        zig
    ];
    settings = {
      highlight.enable = true;
      indent.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<c-space>";
          node_incremental = "<c-space>";
          scope_incremental = "<c-s>";
          node_decremental = "<M-space>";
        };
      };
    };
  };
  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "aa" = {
          query = "@parameter.outer";
        };
        "ia" = {
          query = "@parameter.inner";
        };
        "af" = {
          query = "@function.outer";
        };
        "if" = {
          query = "@function.inner";
        };
        "ac" = {
          query = "@class.outer";
        };
        "ic" = {
          query = "@class.inner";
        };
      };
    };
    swap = {
      enable = true;
      swapNext = {
        "<leader>a" = {
          query = "@parameter.inner";
        };
      };
      swapPrevious = {
        "<leader>A" = {
          query = "@parameter.inner";
        };
      };
    };
  };
}
