local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
}
local paths = vim.fs.find(root_files, { stop = vim.env.HOME })

vim.lsp.start({
    name = "lua-language-server",
    cmd = { 'lua-language-server' },
    before_init = require("neodev.lsp").before_init,
    root_dir = vim.fs.dirname(paths[1]),
    settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = {
                "vim",
            },
            disable = { "missing-fields" },
          },
          completion = {
              callSnippet = "Replace",
          }
        },
    },
})
