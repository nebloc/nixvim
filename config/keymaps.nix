{
  plugins.which-key = {
    enable = true;
    registrations = {
      "<leader>c" = "[C]ode";
      "<leader>d" = "[D]ocument";
      "<leader>g" = "[G]it";
      "<leader>h" = "Git [H]unk";
      "<leader>r" = "[R]ename";
      "<leader>s" = "[S]earch";
      "<leader>t" = "[T]oggle";
      "<leader>w" = "[W]orkspace";
    };
  };
  keymaps = [
  ##############################
  ### LEADER KEY              ##
  ##############################
  {
    key = "<Space>";
    mode = [ "n" "v" ];
    action = "<Nop>";
    options.silent = true;
  }
  ##############################
  ### TELESCOPE SEARCH        ##
  ##############################
  {
    key = "<leader>?";
    mode = "n";
    action = "require('telescope.builtin').oldfiles";
    lua = true;
    options.desc = "[?] Find recently opened files";
  }
  {
    key = "<leader><space>";
    mode = "n";
    action = "require('telescope.builtin').buffers";
    lua = true;
    options.desc = "[ ] Find existing buffers";
  }
  {
    key = "<leader>/";
    mode = "n";
    action = ''
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end
    '';
    lua = true;
    options.desc = "[/] Fuzzy search current buffer";
  }
  {
    key = "<leader>s/";
    mode = "n";
    action =''
    function()
      require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
    end
    '';
    lua = true;
    options.desc = "[S]earch [/] in Open files";
  }
  {
    key = "<leader>ss";
    mode = "n";
    action = "require('telescope.builtin').builtin";
    lua = true;
    options.desc = "[S]earch [S]elect Telescope";
  } 
  {
    key = "<leader>gf";
    mode = "n";
    action = "require('telescope.builtin').git_files";
    lua = true;
    options.desc = "Search [G]it [F]iles";
  }
  {
    key = "<leader>sf";
    mode = "n";
    action = "require('telescope.builtin').find_files";
    lua = true;
    options.desc = "[S]earch [F]iles";
  }
  {
    key = "<leader>sh";
    mode = "n";
    action = "require('telescope.builtin').help_tags";
    lua = true;
    options.desc = "[S]earch [H]elp";
  } 
  {
    key = "<leader>sw";
    mode = "n";
    action = "require('telescope.builtin').grep_string";
    lua = true;
    options.desc = "[S]earch [W]ord";
  }
  {
    key = "<leader>sg";
    mode = "n";
    action = "require('telescope.builtin').live_grep";
    lua = true;
    options.desc = "[S]earch by [G]rep";
  }
  {
    key = "<leader>sG";
    mode = "n";
    action = ":LiveGrepGitRoot<cr>";
    lua = false;
    options.desc = "[S]earch by [G]rep on Git Root";
  }
  {
    key = "<leader>sd";
    mode = "n";
    action = "require('telescope.builtin').diagnostics";
    lua = true;
    options.desc = "[S]earch [D]iagnostics";
  }
  {
    key = "<leader>sr";
    mode = "n";
    action = "require('telescope.builtin').resume";
    lua = true;
    options.desc = "[S]earch [R]esume";
  }
  ##############################
  ### LSP SNIP                ##
  ##############################
  {
    key = "K";
    mode = "n";
    action = "vim.lsp.buf.hover";
    lua = true;
    options.desc = "Hover Documentation";
  }
  {
    key = "gd";
    mode = "n";
    action = "require('telescope.builtin').lsp_definitions";
    lua = true;
    options.desc = "[G]oto [D]efinition";
  }
  ##############################
  ### DIAGNOSTICS             ##
  ##############################
  {
    key = "[d";
    mode = "n";
    action = "vim.diagnostic.goto_prev";
    lua = true;
    options.desc = "Go to previous diagnostic";
  }
  {
    key = "]d";
    mode = "n";
    action = "vim.diagnostic.goto_next";
    lua = true;
    options.desc = "Go to next diagnostic";
  }
  {
    key = "<leader>q";
    mode = "n";
    action = "vim.diagnostic.setloclist";
    lua = true;
    options.desc = "Open diagnostic list";
  }

  ##############################
  ### WORD WRAP               ##
  ##############################
  {
    key = "k";
    mode = "n";
    action = "v:count == 0 ? 'gk' : 'k'";
    lua = false;
    options.silent = true;
    options.expr = true;
  }
  {
    key = "j";
    mode = "n";
    action = "v:count == 0 ? 'gj' : 'j'";
    lua = false;
    options.silent = true;
    options.expr = true;
  }

  ##############################
  ### CHANGE WINDOW           ##
  ##############################
  {
    key = "<leader>w<Up>";
    mode = "n";
    action = "<C-w><Up>";
    options.silent = true;
    options.noremap = true;
  }
  {
    key = "<leader>w<Down>";
    mode = "n";
    action = "<C-w><Down>";
    options.silent = true;
    options.noremap = true;
  }
  {
    key = "<leader>w<Right>";
    mode = "n";
    action = "<C-w><Right>";
    options.silent = true;
    options.noremap = true;
  }
  {
    key = "<leader>w<Left>";
    mode = "n";
    action = "<C-w><Left>";
    options.silent = true;
    options.noremap = true;
  }
  {
    key = "<leader>wk";
    mode = "n";
    action = "<C-w>k";
    options.silent = true;
    options.noremap = true;
  }
  {
    key = "<leader>wj";
    mode = "n";
    action = "<C-w>j";
    options.silent = true;
    options.noremap = true;
  }
  {
    key = "<leader>wl";
    mode = "n";
    action = "<C-w>l";
    options.silent = true;
    options.noremap = true;
  }
  {
    key = "<leader>wh";
    mode = "n";
    action = "<C-w>h";
    options.silent = true;
    options.noremap = true;
  }
  ];
}
