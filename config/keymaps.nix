{
  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>g";
          desc = "[G]it";
        }
        {
          __unkeyed-1 = "<leader>h";
          desc = "[H]arpoon";
        }
        {
          __unkeyed-1 = "<leader>r";
          desc = "[R]ename";
        }
        {
          __unkeyed-1 = "<leader>s";
          desc = "[S]earch";
        }
        {
          __unkeyed-1 = "<leader>t";
          desc = "[T]oggle";
        }
        {
          __unkeyed-1 = "<leader>w";
          desc = "[W]orkspace";
        }
        {
          __unkeyed-1 = "<leader>d";
          desc = "[D]AP Debug";
        }
      ];
    };
  };
  keymaps = [
    ##############################
    ### LEADER KEY              ##
    ##############################
    {
      key = "<Space>";
      mode = [
        "n"
        "v"
      ];
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
      action = ''
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
    {
      key = "gD";
      mode = "n";
      action = "require('telescope.builtin').lsp_implementations";
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
      key = "<leader>Q";
      mode = "n";
      action = "vim.diagnostic.setloclist";
      lua = true;
      options.desc = "Open diagnostic list";
    }
    {
      key = "<leader>q";
      mode = "n";
      action = "vim.diagnostic.open_float";
      lua = true;
      options.desc = "Open float for diagnostic";
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
    ### HARPOON ###
    {
      mode = "n";
      key = "<leader>hm";
      action.__raw = # lua
        ''
          function()
            require'harpoon':list():add()
          end
        '';
      options.desc = "[H]arpoon [M]ark";
    }
    {
      mode = "n";
      key = "<leader>hl";
      action.__raw = # lua
        ''
          function()
            local conf = require("telescope.config").values
            local file_paths = {}
            for _, item in ipairs(require'harpoon':list().items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
          end
        '';
      options.desc = "[H]arpoon [L]ist (Telescope)";
    }
    {
      mode = "n";
      key = "<leader>hL";
      action.__raw = # lua
        ''
          function()
            local harpoon = require('harpoon')
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end
        '';
      options.desc = "[H]arpoon [L]ist (Standard)";
    }
    {
      mode = "n";
      key = "<leader>hn";
      action.__raw = # lua
        ''
          function()
            require'harpoon':list():next()
          end
        '';
      options.desc = "[H]arpoon [N]ext";
    }
    {
      mode = "n";
      key = "<leader>hp";
      action.__raw = # lua
        ''
          function()
            require'harpoon':list():prev()
          end
        '';
      options.desc = "[H]arpoon [P]rev";
    }

    ### Toggle Hint ###
    {
      key = "<leader>th";
      mode = "n";
      action.__raw = # lua
        ''
          function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {bufnr = vim.api.nvim_get_current_buf()})
          end
        '';
      options.desc = "[T]oggle [H]ints";
    }
    ### QUICK FIX MENU###
    {
      key = "<M-q>";
      mode = "n";
      action = "vim.diagnostic.open_float";
      options.desc = "Show diagnostic float";
    }
    {
      key = "<M-j>";
      mode = "n";
      action = "<cmd>cnext<CR>";
      options.desc = "Next quick fix option";
    }
    {
      key = "<M-k>";
      mode = "n";
      action = "<cmd>cprev<CR>";
      options.desc = "Previous quick fix option";
    }
    ### DAP ###
    {
      key = "<leader>db";
      mode = "n";
      action = "require('dap').toggle_breakpoint";
      options.desc = "Toggle Breakpoint";
      lua = true;
    }
    {
      key = "<leader>dc";
      mode = "n";
      action = "require('dap').continue";
      options.desc = "Continue";
      lua = true;
    }
    {
      key = "<leader>dn";
      mode = "n";
      action = "require('dap').step_over";
      options.desc = "Step Over";
      lua = true;
    }
    {
      key = "<leader>dp";
      mode = "n";
      action = "require('dap').step_back";
      options.desc = "Step Back";
      lua = true;
    }
    {
      key = "<leader>di";
      mode = "n";
      action = "require('dap').step_into";
      options.desc = "Step Into";
      lua = true;
    }
    {
      key = "<leader>do";
      mode = "n";
      action = "require('dap').step_out";
      options.desc = "Step Back";
      lua = true;
    }
    {
      key = "<leader>d?";
      mode = "n";
      action = # lua
        ''
          function()
            require('dapui').eval(nil, {enter = true})
          end
        '';
      options.desc = "Evaluate Under Cursor";
      lua = true;
    }
  ];
}
