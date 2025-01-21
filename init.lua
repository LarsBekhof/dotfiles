vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.scrolloff = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.mouse = ""
vim.opt.list = true
vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '

vim.keymap.set("n", "<Tab>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set('n', '<C-p>', ":Telescope find_files<CR>")
vim.keymap.set('n', '<C-a>', ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>q", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>c", ":bd<CR>")
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>b", ":bp<CR>")
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

if not table.unpack then
    ---@diagnostic disable-next-line: deprecated
    table.unpack = unpack
end

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup{
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = true,
    },
    "nvim-treesitter/nvim-treesitter",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "JoosepAlviste/nvim-ts-context-commentstring",
    {
        "numToStr/Comment.nvim",
        lazy = false,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    "nvim-telescope/telescope-ui-select.nvim",
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    "lewis6991/gitsigns.nvim",
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        },
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    }
}

-- colorscheme
require("gruvbox").setup{
    transparent_mode = true,
}
vim.cmd("colorscheme gruvbox")

-- treesitter
require("nvim-treesitter.configs").setup{
    highlight = { enable = true },
    indent = { enable = true },
}

-- LSP
local cmp = require("cmp")
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup{
    mapping = cmp.mapping.preset.insert({
    }),
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
        },
        {
            { name = "buffer" },
        }
    ),
}

require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "ts_ls", "intelephense", "volar", "eslint" },
}
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        lspconfig[server_name].setup{
            capabilities = lsp_capabilities,
        }
    end,
}

lspconfig.volar.setup({
    filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    init_options = {
        vue = {
            hybridMode = false,
        },
        typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
        },
    },
})

-- Comment.nvim
require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

-- lualine.nvim
require('lualine').setup{
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'buffers',
                buffers_color = {
                    -- Same values as the general color option can be used here.
                    active = 'lualine_a_normal',     -- Color for active buffer.
                    inactive = 'lualine_c_inactive', -- Color for inactive buffer.
                },
            },
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
}

-- telescope.nvim
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { table.unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                layout_config = {
                    width = 120,
                    height = 40,
                },
            },
        },
        file_browser = {
            no_ignore = true,
            hidden = { file_browser = true, folder_browser = true },
            respect_gitignore = false,
            initial_mode = "normal",
            mappings = {
                ["n"] = {
                    ["h"] = fb_actions.goto_parent_dir,
                    ["l"] = fb_actions.change_cwd,
                },
            },
        },
    },
    defaults = {
        -- `hidden = true` is not supported in text grep commands.
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        buffers = {
            initial_mode = "normal",
            mappings = {
                ["n"] = {
                    ["<leader>c"] = actions.delete_buffer
                },
            },
        },
    },
})

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")

require('gitsigns').setup()

require "lsp_signature".setup()
