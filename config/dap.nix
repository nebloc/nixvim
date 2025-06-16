{ ... }:
{
  plugins.dap = {
    enable = true;
    adapters = {
      executables = {
        gdb = {
          command = "gdb";
          args = [
            "--interpreter=dap"
            "--quiet"
          ];
        };
      };
    };
    configurations = {
      c = [
        {
          name = "GDB_LAUNCH";
          type = "gdb";
          request = "launch";
          command = "gdb";
          program.__raw = # lua
            ''
              function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end
            '';
        }
      ];
    };
  };
  plugins.dap-ui = {
    enable = true;
    settings.controls.enabled = true;
    luaConfig.post = ''
      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    '';
  };
}
