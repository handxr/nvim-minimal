-- lua/user/plugins/init.lua

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = false, -- TRUE si luego quieres integrarlo con Treesitter
      })
    end,
  },
}

