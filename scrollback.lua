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

vim.o.readonly = true
vim.o.modifiable = false
vim.o.number = false
vim.o.relativenumber = false
vim.o.cursorline = false
vim.o.laststatus = 0
vim.o.showmode = false
vim.o.ruler = false
vim.o.showcmd = false
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.grepprg = "rg --vimgrep"
vim.o.ignorecase = true
vim.o.laststatus = 0
vim.o.smartcase = true
vim.o.undofile = false
vim.o.eventignore = "FileType"

vim.cmd("syntax off")

vim.o.termguicolors = true
vim.cmd([[
  highlight clear
  highlight Normal guibg=none
]])

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
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
