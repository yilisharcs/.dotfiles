return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = {
    {
      'echasnovski/mini.icons', -- see `:h MiniIcons.config`.
      version = false,
      specs = { { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true } },
      init = function()
        package.preload['nvim-web-devicons'] = function()
          require('mini.icons').mock_nvim_web_devicons()
          return package.loaded['nvim-web-devicons']
        end

        vim.api.nvim_create_autocmd('ColorScheme', {
          group    = vim.api.nvim_create_augroup('Mini_Icons_Hl', { clear = true }),
          callback = function()
            vim.api.nvim_set_hl(0, 'MiniIconsAzure', { fg = '#74c7ec' })
            vim.api.nvim_set_hl(0, 'MiniIconsBlue', { fg = '#89b4fa' })
            vim.api.nvim_set_hl(0, 'MiniIconsCyan', { fg = '#94e2d5' })
            vim.api.nvim_set_hl(0, 'MiniIconsGreen', { fg = '#a6e3a1' })
            vim.api.nvim_set_hl(0, 'MiniIconsGrey', { fg = '#cdd6f4' })
            vim.api.nvim_set_hl(0, 'MiniIconsOrange', { fg = '#fab387' })
            vim.api.nvim_set_hl(0, 'MiniIconsPurple', { fg = '#cba6f7' })
            vim.api.nvim_set_hl(0, 'MiniIconsRed', { fg = '#f38ba8' })
            vim.api.nvim_set_hl(0, 'MiniIconsYellow', { fg = '#f9e2af' })
          end
        })
      end,
    }
  },
  keys = {
    { '-', '<CMD>Oil<CR>' }
  },
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
      'permissions',
      'size',
      'mtime',
    },
    win_options = {
      signcolumn = "yes:1",
      number = false,
      relativenumber = false,
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = true,
    lsp_file_methods = { enabled = false },
    constrain_cursor = 'editable',
    watch_for_changes = true,
    keymaps = {
      ['g?'] = { 'actions.show_help', mode = 'n' },
      ['<CR>'] = 'actions.select',
      ['<C-g>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-t>'] = { 'actions.select', opts = { tab = true } },
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = { 'actions.close', mode = 'n' },
      ['<C-l>'] = 'actions.refresh',
      ['<C-h>'] = { 'actions.parent', mode = 'n' },
      ['_'] = { 'actions.open_cwd', mode = 'n' },
      ['~'] = { 'actions.cd', mode = 'n' },
      ['`'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      ['gs'] = { 'actions.change_sort', mode = 'n' },
      ['gx'] = 'actions.open_external',
      ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
      ['<leader>fd'] = {
        function()
          require('fzf-lua').files({
            cwd = require('oil').get_current_dir()
          })
        end,
        mode = 'n',
        nowait = true,
        desc = 'Find files from current directory'
      },
      ['<leader>;'] = {
        'actions.open_cmdline',
        opts = {
          shorten_path = true,
          modify = ':h',
        },
        desc = 'Enter cmdline with the current directory as an argument',
      },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == ".."
      end,
    }
  }
}
