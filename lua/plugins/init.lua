return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
        end,
    },

    {
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose" },
        config = function()
            require("diffview").setup({})
        end,
    },

    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "🛑", texthl = "", linehl = "", numhl = "" }
            )
            vim.fn.sign_define(
                "DapStopped",
                { text = "▶️", texthl = "", linehl = "Visual", numhl = "" }
            )
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup({
                layouts = {
                    {
                        elements = {
                            "scopes",
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
            })

            -- Open and close dapui automatically
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    {
        "leoluz/nvim-dap-go",
        dependencies = { "mfussenegger/nvim-dap" },
        lazy = false,
        config = function()
            require("dap-go").setup({
                dap_configurations = {
                    {
                        type = "go",
                        name = "Debug",
                        request = "launch",
                        program = "${file}",
                    },
                    {
                        type = "go",
                        name = "Debug Package",
                        request = "launch",
                        program = "${fileDirname}",
                    },
                },
            })
        end,
    },

    {
        "nvim-neotest/nvim-nio",
        lazy = false,
    },
    {
        "vim-test/vim-test",
        event = "VeryLazy",
    },
    {
        "tpope/vim-dadbod",
        lazy = false,
    },

    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = { "tpope/vim-dadbod" },
        cmd = { "DBUI", "DBUIToggle" },
    },

    {
        "kristijanhusak/vim-dadbod-completion",
        lazy = false,
        config = function()
            require("cmp").setup({
                sources = {
                    { name = "vim-dadbod-completion" },
                },
            })
        end,
    },
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup(--[[optional config]])
        end,
    },
}
