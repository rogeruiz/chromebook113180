-- return {
--     {
--         "olexsmir/gopher.nvim",
--         config = function(_, opts)
--             require("gopher").setup(opts)
--         end,
--
--     }
-- }
--
local yo_gopher = function ()
    require("gopher").setup({})
end

yo_gopher()
