return {
    {
        "darkvoid-theme/darkvoid.nvim", 
        lazy = false, 
        priority = 1000, 
        config = function() 
            require("darkvoid").setup({
                transparent = true,
                glow = false,
            })
            vim.cmd.colorscheme("darkvoid") 
        end 
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-web-devicons" },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                view = { width = 30, side = "left" },
                filters = { dotfiles = false },
            })
        end,
    },

    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local status_ok, configs = pcall(require, "nvim-treesitter.configs")
            if not status_ok then return end

            configs.setup({
                ensure_installed = { "c", "cpp", "python", "bash", "lua", "vim", "vimdoc" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local servers = { "clangd", "pyright", "bashls" }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {})
            end

            vim.lsp.enable(servers)
        end,
    },

    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Logo personalizado de STRIX
            dashboard.section.header.val = {
                [[                                     ]],
                [[  _____ _______ _____  _______   __  ]],
                [[ / ____|__   __|  __ \|_   _\ \ / /  ]],
                [[| (___    | |  | |__) | | |  \ V /   ]],
                [[ \___ \   | |  |  _  /  | |   > <    ]],
                [[ ____) |  | |  | | \ \ _| |_ / . \   ]],
                [[|_____/   |_|  |_|  \_\_____/_/ \_\  ]],
                [[                                     ]],
                [[        -- OS DEVELOPMENT --         ]],
                [[                                     ]],
            }

            dashboard.section.buttons.val = {
                dashboard.button("e", "  File Explorer", ":NvimTreeToggle<CR>"),
                dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
                dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
                dashboard.button("q", "󰅙  Quit", ":qa<CR>"),
            }

            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#cba6f7", bold = true })
            dashboard.section.header.opts.hl = "AlphaHeader"

            dashboard.config.layout = {
                { type = "padding", val = 4 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            }

            alpha.setup(dashboard.opts)
        end,
    },

    {
        "vyfor/cord.nvim",
        build = ":Cord update",
        event = "VeryLazy",
        opts = {
            usercmds = true,
            log = { level = "error" },
            timer = {
                enable = true,
                interval = 1000,
                reset_on_idle = false,
                reset_on_change = false,
            },
            editor = {
                client = "neovim",
                tooltip = "Neovim IDE",
            },
            display = {
                show_time = true,
                show_repository = true,
                show_cursor_position = true,
                swap_fields = false,
                swap_icons = false,
            },
            idle = {
                enable = true,
                show_idle = true,
                timeout = 300000,
                tooltip = "Away from keyboard",
                text = "Idle / AFK",
            },

            text = {
                workspace = function(opts) 
                    return "In " .. (opts.workspace or "Neovim") 
                end,
                viewing = function(opts) 
                    return "Viewing " .. (opts.filename or "a file") 
                end,
                editing = function(opts) 
                    return "Editing " .. (opts.filename or "a file") 
                end,
                file_browser = function(opts)
                    return "Browsing " .. (opts.name or "files")
                end,
                plugin_manager = "Managing Plugins (Lazy)",
                lsp = "Configuring LSP",
                docs = "Reading Documentation",
                vcs = "Working with Git",
                notes = "Taking Notes",
                debug = "Debugging Code",
                terminal = "In Terminal",
            },

            buttons = {
                {
                    label = "View GitHub Profile",
                    url = "https://github.com/S-havl",
                },
            },
            advanced = {
                discord = {
                    reconnect = {
                        enabled = true,
                        interval = 5000,
                    },
                },
            },
        },
    }

}

