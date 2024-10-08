local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    -- haskell = { "hlint" },
    python = { "flake8" },
    go = { "golangci-lint" },
}

lint.linters.luacheck.args = {
    "--globals",
    "love",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

lint.linters["golangci-lint"] = {
    cmd = "golangci-lint",
    args = { "run" },
    stdin = false,
    stream = "stdout",
    ignore_exitcode = true,
    parser = function(output, _bufnr)
        local diagnostics = {}
        for _, line in ipairs(vim.split(output, "\n")) do
            local filename, row, col, message =
                line:match("([^:]+):(%d+):(%d+):%s(.+)")
            row = tonumber(row)
            col = tonumber(col)
            if filename and row and col and message then
                table.insert(diagnostics, {
                    source = "golangci-lint",
                    lnum = row - 1,
                    col = col - 1,
                    message = message,
                    severity = vim.diagnostic.severity.ERROR,
                })
            end
        end
        return diagnostics
    end,
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})

vim.api.nvim_create_user_command("Lint", function()
    require("lint").try_lint()
end, {})
