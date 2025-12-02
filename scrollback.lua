-- Minimal config for Kitty scrollback viewer
-- Disable providers for speed
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Disable built-in plugins
local disabled = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"menu",
	"matchit",
	"2html_plugin",
	"tohtml",
	"getscript",
	"vimball",
	"vimballPlugin",
	"matchparen",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
}
for _, plugin in ipairs(disabled) do
	vim.g["loaded_" .. plugin] = 1
end

vim.opt.readonly = true
vim.opt.modifiable = false
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.cursorline = false
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.smartcase = true
vim.opt.undofile = false

vim.cmd("syntax off")

vim.opt.termguicolors = true
vim.cmd([[
  highlight clear
  highlight Normal guibg=none
]])

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_autocmd("highlight_yank", {}),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})
-- Make q quit (like less)
vim.keymap.set("n", "q", ":qa!<CR>", { silent = true })
vim.keymap.set("n", "<Esc>", ":qa!<CR>", { silent = true })
vim.keymap.set("n", "g", "gg", { silent = true })
vim.keymap.set("n", "G", "G", { silent = true })

vim.cmd("normal G")
