local opt = vim.opt

-- Apariencia
opt.number = true              -- Número de línea
opt.relativenumber = true      -- Números relativos
opt.cursorline = true          -- Resalta la línea actual
opt.termguicolors = true       -- Colores 24 bits
opt.signcolumn = "yes"         -- Columna de signos siempre visible

-- Tabs e indentación
opt.expandtab = true           -- Tabs = espacios
opt.shiftwidth = 2             -- Indentación
opt.tabstop = 2                -- Tamaño del tab
opt.smartindent = true         -- Indentación inteligente

-- Búsqueda
opt.ignorecase = true          -- Ignora mayúsculas
opt.smartcase = true           -- Pero respeta si usas mayúsculas
opt.incsearch = true           -- Búsqueda incremental
opt.hlsearch = true            -- Resalta coincidencias

-- Comportamiento
opt.wrap = false               -- No partir líneas largas
opt.scrolloff = 8              -- Margen vertical al hacer scroll
opt.splitright = true          -- Splits verticales a la derecha
opt.splitbelow = true          -- Splits horizontales abajo

-- Integración con sistema
opt.clipboard = "unnamedplus"  -- Portapapeles del sistema
opt.mouse = "a"                -- Ratón habilitado

-- Archivos
opt.swapfile = false
opt.backup = false
opt.undofile = true            -- Historial de undo persistente

-- Rendimiento / UX
opt.updatetime = 300           -- Para diagnósticos, etc.
opt.timeoutlen = 250           -- Mapeos de teclas más rápidos (líder, jj, etc.)

