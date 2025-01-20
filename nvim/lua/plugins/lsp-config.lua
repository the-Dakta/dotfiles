return {
    -- Mason for managing language servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason-LSPConfig for auto-installing language servers
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls" }, -- Corrected TypeScript/JavaScript LSP
            })
        end,
    },

    -- nvim-lspconfig for connecting NeoVim to language servers
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            
            -- Lua language server
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- TypeScript/JavaScript language server
            lspconfig.ts_ls.setup({
                on_attach = function(client, bufnr)
                    -- Disable formatting if using an external tool
                    client.server_capabilities.documentFormattingProvider = false

                    -- Key mappings
                    local opts = { buffer = bufnr }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
