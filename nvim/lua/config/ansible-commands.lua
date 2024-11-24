vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local vault_env = vim.fn.getcwd() .. "/vault.env"
    if vim.fn.filereadable(vault_env) == 1 then
      local export_command = "bash -c 'set -a; source " .. vault_env .. "; env'"
      local output = vim.fn.system(export_command)
      for line in output:gmatch("[^\r\n]+") do
        local key, value = line:match("([^=]+)=(.*)")
        if key and value then
          vim.env[key] = value
        end
      end
    end
  end,
  desc = "Source vault.env and export environment variables into Neovim"
})

vim.api.nvim_create_user_command(
  "AnsibleVaultEncrypt",
  function()
    vim.cmd("write")
    local file = vim.fn.expand("%")
    vim.fn.system("ansible-vault encrypt " .. file)
    vim.cmd("edit!")
  end,
  { desc = "Encrypt the current file with ansible-vault" }
)

vim.api.nvim_create_user_command(
  "AnsibleVaultDecrypt",
  function()
    vim.cmd("write")
    local file = vim.fn.expand("%")
    vim.fn.system("ansible-vault decrypt " .. file)
    vim.cmd("edit!")
  end,
  { desc = "Decrypt the current file with ansible-vault" }
)

