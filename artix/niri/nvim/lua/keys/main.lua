--from ai
require("globals")

local map = function(mode, lhs, rhs, opts)
  opts = opts or { silent = true }
  opts.desc = opts.desc or rhs
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Общие ключи
map("n", "<leader>ff", function() vim.cmd.Telescope("find_files") end, { desc = "Search files" })
map("n", "<leader>fb", function() vim.cmd.Telescope("buffers") end, { desc = "Buffers" })
map("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols, { desc = "Symbols in file" })

-- Навигация по разделителям
map("n", "<leader>j", "j", { remap = true }) -- можно заменить на что‑то более умное
map("n", "<leader>k", "k", { remap = true })

-- Закрыть буфер
map("n", "<leader>q", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- LSP‑клавиши (перекрывают некоторые, если хочется)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", require("telescope.builtin").lsp_references, { desc = "References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
