vim.api.nvim_create_user_command("BlameLine", 
  function()
    local line = vim.fn.line(".")
    local file = vim.fn.expand("%")
    local cmd = string.format("git blame -L %d,%d %s", line, line, vim.fn.shellescape(file))
    vim.cmd("!" .. cmd)
  end,
  { desc = "Show git blame for the current line" }
)
