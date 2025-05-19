{pkgs, ...}:
{
  extraPlugins = with pkgs.vimPlugins; [
    nvim-metals
  ];

  plugins.cmp-nvim-lsp.enable = true;

  autoCmd = [
    {
      event = "FileType";
      pattern = [ "scala" "sbt" "java" ];
      callback = {
        __raw = /*lua*/''
          function()
            local opts = { noremap = true, silent = true }
            local metals = require("metals")

            local metals_config = metals.bare_config()
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            metals_config.init_options = {
              statusBarProvider = "lualine",
              icons = "unicode",
              disableColorOutput = false,
              decorationsProvider = "on",
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
