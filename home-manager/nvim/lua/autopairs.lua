---@module 'autopairs'
---@author 'Roger Steve Ruiz'
---@license 'MIT'

local yo_autopairs = function ()
    local autopairs = require("nvim-autopairs")
    local cmp = require("cmp")

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

    autopairs.setup({
        disable_filetype = {
            "TelescopePrompt",
        },
    })
end

yo_autopairs()
