vim.cmd.colorscheme('lunaperche')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'Black', fg = '#cdd6f4' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#0c0c0c', fg = '#cdd6f4' })
vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'Folded', { bg = '#181825', fg = '#fec43f', bold = true })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#181825' })
vim.api.nvim_set_hl(0, 'Statusline', { bg = '#181825', fg = '#edf6f4' })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = '#e0d561', bold = true })
vim.api.nvim_set_hl(0, 'SpellBad', { fg = '#e0d561', undercurl = true })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = '#5fafff', fg = 'Black', bold = true })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#14161b', fg = '#cdd6f4' })
vim.api.nvim_set_hl(0, 'PmenuSbar', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#cdd6f4' })
vim.api.nvim_set_hl(0, 'Removed', { fg = '#e64343' })
vim.api.nvim_set_hl(0, 'Error', { link = 'Removed' })
vim.api.nvim_set_hl(0, 'ErrorMsg', { bg = '#ff5f5f', fg = 'Black' })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = 'NvimLightGreen' })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = 'NvimLightGrey2' })
vim.api.nvim_set_hl(0, 'markdownBlockQuote', { bold = true })
vim.api.nvim_set_hl(0, '@markup.link.vimdoc', { fg = '#e0d561', bold = true })
vim.api.nvim_set_hl(0, '@label.vimdoc', { fg = 'NvimLightGreen', bold = true })
