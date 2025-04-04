return {
  {
    'echasnovski/mini.diff', -- see `:h MiniDiff.config`.
    version = false,
    event = { 'BufReadPost [^:]*' },
    keys = {
      { '<leader>gh', '<CMD>lua MiniDiff.toggle_overlay()<CR>' }
    },
    opts = {
      view = {
        style = 'sign',
        signs = { add = '┃', change = '┃', delete = '┃' },
      }
    }
  }
}
