{pkgs, ...}:
{
  extraPlugins = with pkgs.vimPlugins; [
    nvim-metals
  ];

  autoCmd = [
    {
      event = "FileType";
      pattern = [ "scala" "sbt" "java" ];
      callback = {
        __raw = /*lua*/''
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

  autoGroups = {
    nvim-metals = {
      clear = true;
    };
  };
}
