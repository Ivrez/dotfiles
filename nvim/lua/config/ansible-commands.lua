vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local vault_env_path = vim.fn.getcwd() .. "/vault.env"
    if vim.fn.filereadable(vault_env_path) == 0 then
      return
    end

    local cmd = {
      "bash",
      "-c",
      "set -a && source " .. vim.fn.shellescape(vault_env_path) .. " && echo \"$ANSIBLE_VAULT_PASSWORD_FILE\""
    }

    local output = vim.fn.systemlist(cmd)

    if vim.v.shell_error ~= 0 or #output == 0 then
      vim.notify("Could not load ANSIBLE_VAULT_PASSWORD_FILE", vim.log.levels.WARN)
      return
    end

    vim.env.ANSIBLE_VAULT_PASSWORD_FILE = output[1]
  end,
  desc = "Load ANSIBLE_VAULT_PASSWORD_FILE from vault.env"
})

local function vault_action(action)
  vim.cmd("write")
  local file = vim.fn.expand("%")
  local cmd = "ansible-vault " .. action .. " " .. vim.fn.shellescape(file)
  vim.fn.system(cmd)

  if vim.v.shell_error == 0 then
    vim.cmd("edit!")
  else
    vim.notify("Vault " .. action .. " failed", vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command("AnsibleVaultEncrypt",
  function()
    vault_action("encrypt")
  end,
{})

vim.api.nvim_create_user_command("AnsibleVaultDecrypt",
  function()
    vault_action("decrypt")
  end,
{})
