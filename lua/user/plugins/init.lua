-- lua/user/plugins/init.lua

return {
  ---------------------------------------------------------------------------
  -- TEMA (COLORSCHEME)
  ---------------------------------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },

  ---------------------------------------------------------------------------
  -- TREESITTER (RESALTADO MODERNO)
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "markdown",
          "markdown_inline",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- LUALINE (STATUSLINE)
  ---------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          globalstatus = true,
        },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- TELESCOPE (BUSCADOR)
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Buscar archivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Buscar texto" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Buffers abiertos" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Ayuda" },
    },
    config = function()
      require("telescope").setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- COMMENT.NVIM (COMENTAR CÓDIGO)
  ---------------------------------------------------------------------------
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- AUTOPAIRS (PARES AUTOMÁTICOS)  ✅
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- GITSIGNS (INTEGRACIÓN CON GIT)
  ---------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- MASON + LSPCONFIG (LSP)
  ---------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls" }, -- JS/TS + Lua para Neovim
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Función común para poner keymaps LSP por buffer
      local on_attach = function(_, bufnr)
        local bufmap = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Navegación principal
        bufmap("n", "gd", vim.lsp.buf.definition, "Ir a definición")
        bufmap("n", "gD", vim.lsp.buf.declaration, "Ir a declaración")
        bufmap("n", "gi", vim.lsp.buf.implementation, "Ir a implementación")
        bufmap("n", "gr", vim.lsp.buf.references, "Referencias")

        -- Info
        bufmap("n", "K", vim.lsp.buf.hover, "Hover")
        bufmap("n", "<leader>fd", vim.diagnostic.open_float, "Detalles diagnóstico")
        bufmap("n", "[d", vim.diagnostic.goto_prev, "Diag anterior")
        bufmap("n", "]d", vim.diagnostic.goto_next, "Diag siguiente")

        -- Refactor
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Renombrar símbolo")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Acción de código")

        -- Formateo
        bufmap("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, "Formatear buffer")
      end

      -- JS / TS
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
      })

      -- Lua (para tu config de Neovim)
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })
    end,
  },
}

