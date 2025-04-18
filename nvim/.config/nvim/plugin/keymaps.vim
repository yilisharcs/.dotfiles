lua vim.keymap.set({ 'n', 'x' }, '<SPACE>', '<NOP>', { silent = true })

lua vim.keymap.set({ 'n', 'x' }, '<leader>K', 'K')
inoremap <silent> <expr> <C-c> 'col(.) > 1' ? '<ESC><RIGHT>' : '<ESC>'
nnoremap <C-q> @@
onoremap <C-a> <CMD>normal! ggVG<CR>

noremap! <C-b> <LEFT>
inoremap <C-f> <RIGHT>
cnoremap <expr> <C-f> (getcmdtype() ==# ':' && getcmdline() =~? '^%\?s/') ? '<RIGHT>' : '<C-f>'
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-a> <HOME>
noremap! <C-d> <DEL>
cnoremap <C-x><C-d> <C-d>

xnoremap < <gv
xnoremap > >gv
xnoremap <silent> J :m '>+1<CR>gv=gv
xnoremap <silent> K :m '<-2<CR>gv=gv

nnoremap X "zx"zp
lua vim.keymap.set({ 'n', 'x' }, 'x', '"_x')
nnoremap C "_C
nmap U <C-r>

nnoremap <C-w>t <CMD>tab split<CR>

nnoremap ' ` | xnoremap ' `
nnoremap cgn *``"_cgn
nnoremap cgN *``"_cgN
nnoremap dgn *``"_dgn
nnoremap dgN *``"_dgN

nnoremap gw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap gW :%s/\<<C-r><C-a>\>/<C-r><C-a>/gI<Left><Left><Left>

nnoremap dy <CMD>diffthis<CR>
xnoremap <C-o> :'<,'>diffget<CR>
xnoremap <C-p> :'<,'>diffput<CR>

function! List_Gmarks()
  try
    marks ABCDEFGIMNOPQRSTUVWXYZ
  catch /E283:/
  endtry
  marks HJKL
  echo('`')
  try
    let s:mark = toupper(nr2char(getchar()))
  catch /^Vim:Interrupt$/
  endtry
  redraw
  silent! execute 'normal! `'..s:mark
endfunction
nnoremap <C-h> <CMD>call List_Gmarks()<CR>

nnoremap <leader>h `H
nnoremap <leader>j `J
nnoremap <leader>k `K
nnoremap <leader>l `L

lua vim.keymap.set({ 'n', 'x', '!', 't' }, '<M-h>', '<CMD>wincmd h<CR>')
lua vim.keymap.set({ 'n', 'x', '!', 't' }, '<M-j>', '<CMD>wincmd j<CR>')
lua vim.keymap.set({ 'n', 'x', '!', 't' }, '<M-k>', '<CMD>wincmd k<CR>')
lua vim.keymap.set({ 'n', 'x', '!', 't' }, '<M-l>', '<CMD>wincmd l<CR>')

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        botright copen
        wincmd p
    else
        cclose
    endif
endfunction
nnoremap cu <CMD>call ToggleQuickFix()<CR>

nnoremap <C-j> <CMD>cpfile<CR>zz
nnoremap <C-k> <CMD>cnfile<CR>zz
nnoremap <C-p> <CMD>cprev<CR>zz
nnoremap <C-n> <CMD>cnext<CR>zz
nnoremap <leader><C-p> <CMD>cabove<CR>zz
nnoremap <leader><C-n> <CMD>cbelow<CR>zz

nnoremap <F8> <CMD>setlocal wrap! wrap? linebreak!<CR>
nnoremap <expr> <C-d> &wrap ? '<C-d>' : '<C-d>zz'
nnoremap <expr> <C-u> &wrap ? '<C-u>' : '<C-u>zz'
noremap <expr> j &wrap ? 'gj' : 'j'
noremap <expr> k &wrap ? 'gk' : 'k'

nnoremap <F9> <CMD>Inspect<CR>
nnoremap <F10> <CMD>!chmod +x %<CR>
nnoremap <leader><F10> <CMD>!chmod -x %<CR>

nnoremap gz <CMD>lua vim.ui.open('', { cmd = { 'xdg-open', 'https://github.com/' .. vim.fn.expand('<cfile>') } })<CR>
xnoremap gz "zy:lua vim.ui.open('', { cmd = { 'xdg-open', 'https://github.com/' .. vim.fn.getreg('z') } })<CR>

nnoremap Z jmzk<CMD>m .+1<CR>==`z
nnoremap gj i<CR><ESC>k$

nmap gcap gcip
nmap gcA oz<ESC>gcckJfz"_cl
nmap gc$ i<CR><ESC>gcck$J
nmap gcO Oz<ESC>gccA<BS>
nmap gco oz<ESC>gccA<BS>

lua << EOF
  function P(...)
    local args = {}
    for _, arg in ipairs({ ... }) do
      table.insert(args, vim.inspect(arg))
    end
    print(unpack(args))
    return ...
  end
EOF

nnoremap <leader>p :lua P()<left>
