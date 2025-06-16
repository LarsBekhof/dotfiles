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
vim.opt.cursorline = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

vim.o.updatetime = 300

vim.keymap.set("n", "<leader>c", ":bd<CR>")
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>b", ":bp<CR>")
vim.keymap.set("n", "<leader>N", function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set("n", "<leader>B", function() vim.diagnostic.jump({ count = -1 }) end)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help)

local format_mappings = {
    { pattern = "*",    command = ":retab!<CR>" },
    { pattern = "json", command = ":%! jq .<CR>" },
    {
        pattern = {
            "javascript",
            "typescript",
            "vue",
            "lua",
        },
        command = vim.lsp.buf.format,
    },
}

for _, value in pairs(format_mappings) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = value.pattern,
        callback = function()
            vim.keymap.set("n", "<leader>f", value.command, { buffer = true })
        end,
    })
end

vim.diagnostic.config {
    virtual_text = false,
    float = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
}

vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
    end,
})

vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

if not table.unpack then
    ---@diagnostic disable-next-line: deprecated
    table.unpack = unpack
end

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local installed_lsps = {
    "lua_ls",
    "ts_ls",
    "intelephense",
    "vue_ls",
    "eslint",
    "typos_lsp",
    "tailwindcss",
    "jsonls",
}

require("lazy").setup {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = { transparent_mode = true },
        init = function()
            vim.o.background = "dark"
            vim.cmd("colorscheme gruvbox")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        init = function()
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldlevel = 99
        end,
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        },
        auto_install = true,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            cmp.setup {
                mapping = cmp.mapping.preset.insert {},
                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    {
                        name = "buffer",
                        option = {
                            get_bufnrs = function() return vim.api.nvim_list_bufs() end,
                        },
                    },
                    { name = "path" },
                },
            }
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = "BufReadPre",
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local lspconfig = require("lspconfig")

            for _, lsp in ipairs(installed_lsps) do
                local config = lspconfig[lsp]
                vim.lsp.config(lsp, config)
            end

            mason_lspconfig.setup({
                ensure_installed = installed_lsps,
            });
        end,
        dependencies = {
            { "mason-org/mason.nvim", opts = true },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = true,
    },
    {
        "numToStr/Comment.nvim",
        opts = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = { "diagnostics", "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" }
            },
        }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        tag = "0.1.8",
        config = function()
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            local fb_actions = require("telescope._extensions.file_browser.actions")
            local telescope_config = require("telescope.config")
            local vimgrep_arguments = { table.unpack(telescope_config.values.vimgrep_arguments) }

            local builtin = require("telescope.builtin")
            telescope.setup {
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
                    layout_config = {
                        horizontal = {
                            width = { padding = 0 },
                            height = { padding = 0 },
                            preview_width = 0.5,
                        },
                    },
                    path_display = {
                        filename_first = {
                            reverse_directories = false,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        -- `hidden = true` will still show the inside of `.git/` as it"s not `.gitignore`d.
                        find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", "!**/.git/*" },
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
            }

            -- I cannot find a way to get this into mappings
            vim.keymap.set("n", "<Tab>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

            -- Vim bindings to open Telescope
            vim.keymap.set("n", "<C-p>", builtin.find_files)
            vim.keymap.set("n", "<C-a>", builtin.live_grep)
            vim.keymap.set("n", "C-b>", builtin.buffers)
            vim.keymap.set("n", "<leader>d", builtin.diagnostics)
            vim.keymap.set("n", "<leader>t", ":Telescope<CR>")

            -- I want to search in hidden/dot files.
            table.insert(vimgrep_arguments, "--hidden")
            table.insert(vimgrep_arguments, "--no-ignore-vcs")
            -- I don"t want to search in the `.git` directory.
            table.insert(vimgrep_arguments, "--glob")
            table.insert(vimgrep_arguments, "!**/.git/*")
            telescope.load_extension("ui-select")
            telescope.load_extension("file_browser")
        end,
    },
    { "lewis6991/gitsigns.nvim", opts = true },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        },
    },
}
