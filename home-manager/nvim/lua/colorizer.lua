local yo_colorizer = function ()
    require("colorizer").setup({
        css = { css = true },
        scss = { css = true },
        html = { mode = "foreground" },
        "javascript",
        "javascript.jsx",
        "javascriptreact",
        "jsx",
    })
end

yo_colorizer()
