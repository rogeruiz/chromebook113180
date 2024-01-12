local yo_fidget = function()
    require('fidget').setup({
        text = {
            spinner = "triangle",
        },
        window = {
            blend: 30,
        }
    })
end

yo_fidget()
