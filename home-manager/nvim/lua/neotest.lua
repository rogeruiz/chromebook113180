return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-jest",
        "thenbe/neotest-playwright",
    },
    --- Esta funcíon se esta usando para iniciar el "setup" de Neotest y para ayudar con la configuracíon de
    --  diagnosticos para el texto virtual.
    init = function()
        -- get neotest namespace (api call creates or returns namespace)
        -- https://github.com/nvim-neotest/neotest-go#installation
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message =
                        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)
        -- Tuve que hacer el "Setup" aqui porque requiero los adaptadores de neotest.
        require("neotest").setup({
            adapters = {
                require("neotest-jest")({
                    -- jestCommand = "yarn test:coverage",
                    jestConfigFile = "package.json",
                    env = { CI = true },
                    cwd = function( --[[ path ]])
                        return vim.fn.getcwd()
                    end,
                }),
                require("neotest-playwright").adapter({
                    options = {
                        persist_project_selection = true,
                        enable_dynamic_test_discovery = true,
                    }
                }),
                require("neotest-go"),
            }
        })
    end,
}
