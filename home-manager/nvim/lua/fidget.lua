local yo_fidget = function()
    require('fidget').setup({
        progress = {
            display = {
                progress_icon = {
                    pattern = "dots",
                    period = 1,
                },
            },
        },
        notification = {
            window = {
                winblend = 30,
            },
        },
    })
end

yo_fidget()
