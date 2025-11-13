local map = vim.keymap.set
local opts = { silent = true }

-- Leader
vim.g.mapleader = " "

-- jj para salir del modo insert (muy cómodo y seguro)
map("i", "jj", "<Esc>", opts)

-- Guardar / salir
map("n", "<leader>w", ":w<CR>", opts)    -- Guardar
map("n", "<leader>x", ":x<CR>", opts)    -- Guardar y salir
map("n", "<leader>q", ":q<CR>", opts)    -- Cerrar ventana
-- NOTA: no mapeamos q! para no perder cambios sin querer

-- Explorador de archivos nativo (netrw)
map("n", "<leader>e", ":Ex<CR>", opts)

-- Navegación de ventanas
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

-- Crear splits
map("n", "<leader>sv", ":vsplit<CR>", opts)
map("n", "<leader>sh", ":split<CR>", opts)

-- Cerrar split actual
map("n", "<leader>c", ":close<CR>", opts)

-- Navegación de buffers (productivo y seguro)
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Mover líneas (muy útil)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-1<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-1<CR>gv=gv", opts)

-- Búsqueda centrada
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Mantener selección al indentar
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Quitar resaltado de búsqueda
map("n", "<leader>nh", ":nohl<CR>", opts)

-- NETRW: File explorer actions
map("n", "<leader>nf", function()
  vim.cmd('norm %')
end, { desc = "Nuevo archivo (netrw)" })

map("n", "<leader>nd", function()
  vim.cmd('norm d')
end, { desc = "Nuevo directorio (netrw)" })

map("n", "<leader>nr", function()
  vim.cmd('norm R')
end, { desc = "Renombrar (netrw)" })

map("n", "<leader>ndd", function()
  vim.cmd('norm D')
end, { desc = "Eliminar (netrw)" })

map("n", "<leader>n-", function()
  vim.cmd('norm -')
end, { desc = "Subir directorio (netrw)" })


