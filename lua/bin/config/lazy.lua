local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- { "LazyVim/LazyVim", import = "lazyvim.config" },
    { import = "bin.plugins" },
  },
  git = {
    url_format = "https://ay1.us/https://github.com/%s.git",
  },
  -- dev = {
  --   -- directory where you store your local plugin projects
  --   path = "~/projects",
  --   --[email protected] string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
  --   patterns = {},    -- For example {"folke"}
  --   fallback = false, -- Fallback to git when local plugin doesn't exist
  -- },
})