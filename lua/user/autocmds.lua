local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

-- 1) Resaltar texto copiado (yank)
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 150 }
  end,
})

-- 2) Volver a la última posición del cursor al abrir archivo
autocmd("BufReadPost", {
  group = general,
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 3) Quitar espacios finales al guardar en archivos de código habituales
autocmd("BufWritePre", {
  group = general,
  pattern = {
    "*.lua",
    "*.js",
    "*.ts",
    "*.tsx",
    "*.json",
    "*.css",
    "*.scss",
    "*.html",
    "*.md",
    "*.py",
    "*.vim",
  },
  command = [[%s/\s\+$//e]],
})

-- 4) Recargar archivo si cambia en disco
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = general,
  command = "checktime",
})

