return {
    {
        "olexsmir/gopher.nvim",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,

    }
}
