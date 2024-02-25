{
  plugins.treesitter = {
    enable = true;
    ensureInstalled = [ "c" "cpp" "go" "lua" "python" "rust" "tsx" "javascript" "typescript" "vimdoc" "vim" "bash" "scala" "nix" "rust" ];
    indent = true;
    incrementalSelection = {
      enable = true;
      keymaps = {
        initSelection = "<c-space>";
        nodeIncremental = "<c-space>";
        scopeIncremental = "<c-s>";
        nodeDecremental = "<M-space>";
      };
    };
  };
  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
      "aa" = { query = "@parameter.outer"; };
      "ia" = { query = "@parameter.inner"; };
      "af" = { query = "@function.outer"; };
      "if" = { query = "@function.inner"; };
      "ac" = { query = "@class.outer"; };
      "ic" = { query = "@class.inner"; };
      };
    };
    swap = {
      enable = true; 
      swapNext = {
      "<leader>a" = { query = "@parameter.inner"; };
      };
      swapPrevious = {
      "<leader>A" = { query = "@parameter.inner"; };
      };
    };
  };
}
