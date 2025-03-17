local global = vim.g
local o = vim.opt

global.editorconfig = true
global.mapleader = " "
global.indent_style = "space"
global.indent_size = 2
global.trim_trailing_whitespace = true

o.encoding = "UTF-8"
o.fileencoding = "UTF-8"

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.smartindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.wrap = false
o.backspace = { "start", "eol", "indent" }
o.path:append("**")
o.wildignore:append({ "*/node_modules/*", "*/.git/*", "*/.DS_Store" })
o.ruler = true
o.mouse = ""
o.title = true
o.hidden = true
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.splitkeep = "cursor"
o.termguicolors = true
o.formatoptions:append({ "r" })
