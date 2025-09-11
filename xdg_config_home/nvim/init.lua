# WARNING! If you want to edit your nvimrc to effect all machines, edit .chezmoitemplates/nvim/init.lua-- [[init.lua]]

-- LEADER
-- Remap of leader keys
--

vim.g.mapleader = "'"
vim.g.localleader = "\\"

require("vars") -- VARIABLES: Defined in lua/vars.lua
require("opts") -- OPTIONS: Defined in lua/opt.lua
require("keys") -- KEYBINDINGS: Defined in lua/keys.lua
require("plug-lazy") -- PLUGINS: Defined in lua/plug.lua

vim.lsp.config['camel-lsp'] = {
    cmd = {"/usr/bin/java -jar /Users/chris/Software/lsp/camel-lsp-server/camel-lsp-server-1.8.0.jar"},
    filetypes = {"java"}
}

vim.lsp.enable('camel-lsp')

-- Powershell command configuring
-- TODO: remove lsp_zero implementation
local lsp_zero = require('lsp-zero')

require("mason").setup()
-- jdtls (java lang server) isnt really supported by mason, dunno why. Manually configured in file specific file
require("mason-lspconfig").setup({
    ensure_installed = { 'typescript-language-server','eslint', 'lua_ls', 'pylsp' },
    handlers = {
        lsp_zero.default_setup,
        -- handle language servers here
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        tsserver = function()
            -- setup tsserver 
            require('lspconfig').tsserver.setup({})
        end,
        csharp_ls = function()
            -- setup csharp 
            require('lspconfig').csharp_ls.setup({})
        end,
        pylsp = function()
            -- setup tsserver 
            require('lspconfig').pylsp.setup({})
        end,
        --jdtls = function()
        --    require('lspconfig').jdtls.setup({})
        --end
    }
})


-- local cmp = require('cmp') -- for completion

require("lualine").setup({
    options = {
        -- theme = "rose-pine",
        theme = "gruvbox",
    }
})
vim.cmd([[colorscheme gruvbox]])

-- vim.cmd([[colorscheme rose-pine]])

require('telescope').load_extension('harpoon') -- not entirely sure why these need to integrate TODO

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
    callback = function(ev)
        print("WATCHING THIS BUFFER")
        local bufnr = ev.buf
        local edit_watch = function()
            require("chezmoi.commands.__edit").watch(bufnr)
        end
        vim.schedule(edit_watch)
    end,
})

vim.cmd("highlight Beacon guibg=black ctermbg=15")

require("nvim-autopairs").setup({})
require("nvim-surround").setup({})
require("colorizer").setup({})
