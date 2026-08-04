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

}

