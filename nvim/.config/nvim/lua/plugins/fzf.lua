return {
  'ibhagwan/fzf-lua',
  keys = {
    { '<leader>fl', '<CMD>FzfLua files<CR>',            desc = '[FZF] List files' },
    { '<leader>fh', '<CMD>FzfLua oldfiles<CR>',         desc = '[FZF] File history' },
    { '<leader>fb', '<CMD>FzfLua buffers<CR>',          desc = '[FZF] Buffers' },
    { '<leader>fc', '<CMD>FzfLua git_commits<CR>',      desc = '[FZF] Commits' },
    { '<leader>fg', '<CMD>FzfLua live_grep_native<CR>', desc = '[FZF] Live grep' },
    { '<leader>fk', '<CMD>FzfLua helptags<CR>',         desc = '[FZF] Help tags' },
    { '<leader>fK', '<CMD>FzfLua keymaps<CR>',          desc = '[FZF] List mappings' },
    { '<C-h>',      '<CMD>FzfLua marks<CR>',            desc = '[FZF] Get global marks' },
    {
      '<C-r>',
      '<CMD>FzfLua command_history<CR>',
      mode = { 'n', 'x' },
      desc = '[FZF] Search command history'
    },
    {
      '<C-x><C-f>',
      function()
        require('fzf-lua').complete_path({
          cmd = 'fd --color=never --hidden --follow --exclude={.git,Trash}'
        })
      end,
      mode = 'i',
      desc = '[FZF] Complete Path'
    },
    { '<C-Space>g', '<CMD>lua _G.fzf_dirs()<CR>', desc = '[FZF] New project tab' },
  },
  init = function()
    _G.fzf_dirs = function(opts)
      opts = opts or {}
      opts.winopts = { title = ' Projects ' }
      opts.actions = {
        ['default'] = function(selected)
          vim.cmd('tabnew ' .. selected[1])
          vim.cmd('tcd ' .. selected[1])
          -- HACK: this should be implemented in the plugin itself
          vim.cmd('Lf')
          vim.cmd('only')
          -- working alternative to :startinsert with Lf
          vim.api.nvim_feedkeys('i', 'n', false)
        end
      }
      local dirs = {
        '~/projects/',
        '~/projects/nvim',
        '~/projects/rust-by-example',
        '~/.local/share/nvim/lazy',
        '~/'
      }
      require('fzf-lua').fzf_exec(
        'fd --hidden --follow --type d --exact-depth 1 . ' ..
        table.concat(dirs, ' '), opts
      )
    end
  end,
  opts = {
    fzf_bin = 'sk',
    keymap = {
      builtin = {
        ['<C-k>'] = 'preview-page-up',
        ['<C-j>'] = 'preview-page-down',
        ['<F1>'] = 'toggle-help',
        ['<F2>'] = 'toggle-fullscreen',
        ['<F4>'] = 'toggle-preview',
      },
      fzf = {
        ['ctrl-y'] = 'select-all+accept(enter)',
        ['alt-a'] = 'toggle-all',
        ['alt-g'] = 'last',
        ['alt-G'] = 'first',
      },
    },
    winopts = {
      height   = 0.80,
      width    = 0.90,
      row      = 0.50,
      col      = 0.55,
      border   = 'rounded',
      backdrop = 100,
    },
    files = {
      fd_opts = '--color=never --hidden --follow --type f --type l --exclude={.git,Trash}',
      winopts = { preview = { layout = 'vertical' } },
    },
    grep = {
      rg_opts =
        '--color=always --column --line-number --no-heading --smart-case ' ..
        '--max-columns=4096 --hidden -g "!.git" -e',
    },
    helptags = {
      winopts = { height = 0.5 },
    },
    marks = {
      marks = '[A-Z]',
      fzf_opts = { ['--cycle'] = true },
      winopts = {
        title = ' Global marks ',
        preview = { layout = 'vertical' },
      }
    }
  }
}
