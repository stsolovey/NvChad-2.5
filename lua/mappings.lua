require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Открыть терминал в новой вкладке
map(
    "n",
    "<leader>tt",
    ":tabnew | terminal<CR>",
    { desc = "Открыть терминал в новой вкладке" }
)

-- Открыть терминал в горизонтальном сплите
map("n", "<leader>ts", ":split | terminal<CR>", {
    desc = "Открыть терминал в горизонтальном сплите",
})

-- Открыть терминал в вертикальном сплите
map("n", "<leader>tv", ":vsplit | terminal<CR>", {
    desc = "Открыть терминал в вертикальном сплите",
})

-- vim-fugitive: команды для работы с Git
map("n", "<leader>gs", ":G<CR>", { desc = "Git Status" })
map("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git Diff" })
map("n", "<leader>gc", ":G commit<CR>", { desc = "Git Commit" })
map("n", "<leader>gp", ":G push<CR>", { desc = "Git Push" })
map("n", "<leader>gl", ":G pull<CR>", { desc = "Git Pull" })

-- gitsigns.nvim: работа с hunks (изменениями)
map(
    "n",
    "]c",
    "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
    { expr = true, desc = "Next hunk" }
)
map(
    "n",
    "[c",
    "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
    { expr = true, desc = "Prev hunk" }
)
map(
    "n",
    "<leader>hp",
    "<cmd>Gitsigns preview_hunk<CR>",
    { desc = "Preview hunk" }
)
map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map(
    "n",
    "<leader>hu",
    "<cmd>Gitsigns undo_stage_hunk<CR>",
    { desc = "Undo stage hunk" }
)

-- diffview.nvim: просмотр диффов
map("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "Open DiffView" })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close DiffView" })

-- Starting and stopping the debugger
map("n", "<F5>", ":DapContinue<CR>", { desc = "Start/Continue Debugging" })

-- Stepping through code
map("n", "<F10>", ":DapStepOver<CR>", { desc = "Step Over" })
map("n", "<F11>", ":DapStepInto<CR>", { desc = "Step Into" })
map("n", "<F12>", ":DapStepOut<CR>", { desc = "Step Out" })

-- Breakpoints
map(
    "n",
    "<leader>db",
    ":DapToggleBreakpoint<CR>",
    { desc = "Toggle Breakpoint" }
)
map(
    "n",
    "<leader>dB",
    ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = "Set Conditional Breakpoint" }
)

-- Restarting and terminating the debugger
map("n", "<leader>dr", ":DapRestart<CR>", { desc = "Restart Debugging" })
map("n", "<leader>dq", ":DapTerminate<CR>", { desc = "Terminate Debugging" })

-- DAP UI
map(
    "n",
    "<leader>dui",
    ":lua require('dapui').toggle()<CR>",
    { desc = "Toggle DAP UI" }
)

-- Evaluate the expression under the cursor
map(
    "n",
    "<leader>de",
    ":lua require('dapui').eval()<CR>",
    { desc = "Evaluate Expression" }
)

-- Open REPL
map(
    "n",
    "<leader>dr",
    ":lua require('dap').repl.open()<CR>",
    { desc = "Open DAP REPL" }
)

-- Toggle Breakpoint with Log Message
map(
    "n",
    "<leader>dl",
    ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    { desc = "Set Log Point" }
)

-- floating window
map(
    "n",
    "<leader>dh",
    ":lua require('dap.ui.widgets').hover(nil, { border = 'single' })<CR>",
    { desc = "DAP Hover (Floating Window)" }
)

-- Scopes Widget
map(
    "n",
    "<leader>ds",
    ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
    { desc = "DAP Scopes" }
)

-- Debug Nearest Test
map(
    "n",
    "<leader>dgt",
    ":lua require('dap-go').debug_test()<CR>",
    { desc = "Debug Nearest Test" }
)

-- Debug Last Test
map(
    "n",
    "<leader>dgl",
    ":lua require('dap-go').debug_last_test()<CR>",
    { desc = "Debug Last Test" }
)

-- Открыть интерфейс DBUI
map("n", "<leader>db", ":DBUI<CR>", {
    desc = "Открыть интерфейс DBUI",
    noremap = true,
    silent = true,
})

-- Открыть интерфейс DBee
map(
    "n",
    "<leader>do",
    ":lua require('dbee').open()<CR>",
    { desc = "Открыть DBee UI" }
)

-- Закрыть интерфейс DBee
map(
    "n",
    "<leader>dc",
    ":lua require('dbee').close()<CR>",
    { desc = "Закрыть DBee UI" }
)

-- Запустить выделенный запрос
map(
    "v",
    "<leader>dq",
    ":lua require('dbee').api.core.run_selection()<CR>",
    { desc = "DBee: Запустить выделенный запрос" }
)

-- Запустить весь запрос в scratchpad
map(
    "n",
    "<leader>da",
    ":lua require('dbee').api.core.run_all()<CR>",
    { desc = "DBee: Запустить весь запрос" }
)

-- Следующая страница результатов
map(
    "n",
    "<leader>dn",
    ":lua require('dbee').api.ui.result_page_next()<CR>",
    {
        desc = "DBee: Следующая страница результатов",
    }
)

-- Предыдущая страница результатов
map(
    "n",
    "<leader>dp",
    ":lua require('dbee').api.ui.result_page_prev()<CR>",
    {
        desc = "DBee: Предыдущая страница результатов",
    }
)
