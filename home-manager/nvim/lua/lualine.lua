local yo_lualine = function ()
    local lualine_colors = require("catppuccin.palettes").get_palette()
    local lualine_navic = require("nvim-navic")
    local icons = require("icons")

    local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end

    local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
        return function(str)
            local win_width = vim.fn.winwidth(0)
            if hide_width and win_width < hide_width then
                return ""
            elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
                return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
            end
            return str
        end
    end

    local function search_result()
        if vim.v.hlsearch == 0 then
            return ""
        end
        local last_search = vim.fn.getreg("/")
        if not last_search or last_search == "" then
            return ""
        end
        local searchcount = vim.fn.searchcount({ maxcount = 9999 })
        return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
    end

    local function location_with_icons()
        return "%l " .. icons.ui.LineNumber .. " %c " .. icons.ui.ColumnNumber
    end

    local function linenumber_with_icons()
        return "%p%%" .. icons.ui.SeparatorForward .. "  %L"
    end

    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "catppuccin",
            component_separators = {
                left = icons.ui.PowerlineRightEmpty,
                right = icons.ui.PowerlineLeftEmpty,
            },
            section_separators = {
                left = icons.ui.PowerlineRightFill,
                right = icons.ui.PowerlineLeftFill,
            },
            disabled_filetypes = {
                "alpha",
                "calendar",
                "dap-repl",
                "dapui_breakpoints",
                "dapui_scopes",
                "dapui_stacks",
                "dapui_watches",
                "dashboard",
                "dbout",
                "dbui",
                "guihua",
                "neo-tree",
                "qf",
                "toggleterm",
                winbar = {
                    "help",
                },
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = trunc(80, 4, nil, true),
                },
            },
            lualine_b = {
                {
                    "b:gitsigns_head",
                    icon = "",
                    fmt = trunc(80, 4, nil, true),
                },
                {
                    'diff',
                    symbols = {
                        added = icons.git.Add .. ' ',
                        modified = icons.git.Mod .. ' ',
                        removed = icons.git.Remove .. ' ',
                    },
                    source = diff_source,
                },
            },
            lualine_c = {},
            lualine_x = {
                {
                    "diagnostics",
                    source = { "nvim" },
                    sections = { "error", "warn", "info", "hint" },
                    diagnostics_color = {
                        error = { bg = lualine_colors.red, fg = lualine_colors.crust },
                        warn = { bg = lualine_colors.yellow, fg = lualine_colors.crust },
                        info = { bg = lualine_colors.teal, fg = lualine_colors.crust },
                        hint = { bg = lualine_colors.rosewater, fg = lualine_colors.crust },
                    },
                },
            },
            lualine_y = { search_result },
            lualine_z = {
                "fileformat",
                location_with_icons,
                linenumber_with_icons,
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {
                {
                    "b:gitsigns_head",
                    icon = "",
                    fmt = trunc(80, 4, nil, true),
                },
                {
                    'diff',
                    symbols = {
                        added = icons.git.Add .. ' ',
                        modified = icons.git.Mod .. ' ',
                        removed = icons.git.Remove .. ' ',
                    },
                    source = diff_source,
                },
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                "fileformat",
                location_with_icons,
                linenumber_with_icons,
            },
        },
        tabline = {},
        winbar = {
            lualine_a = {
                {
                    "filename",
                    icon = icons.ui.NewFile .. " ",
                    icons_enabled = true,
                    file_status = false,
                    path = 1,
                    shorting_target = 50,
                },
            },
            lualine_b = {
                {
                    function()
                        return lualine_navic.get_location()
                    end,
                    cond = function()
                        return lualine_navic.is_available()
                    end,
                },
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = { "filetype" },
            lualine_z = {},
        },
        inactive_winbar = {
            lualine_a = {
                {
                    "filename",
                    icon = icons.ui.NewFile .. " ",
                    icons_enabled = true,
                    file_status = false,
                    path = 1,
                    shorting_target = 50,
                },
            },
            lualine_b = {
                {
                    function()
                        return lualine_navic.get_location()
                    end,
                    cond = function()
                        return lualine_navic.is_available()
                    end,
                },
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = { "filetype" },
            lualine_z = {},
        },
        extensions = {},
    })
end

yo_lualine()
