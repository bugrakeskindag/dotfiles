" General
set clipboard=unnamed
set termguicolors
set ttimeoutlen=0
colorscheme onedark

" Display
set cursorline
set list
set listchars=tab:>>,trail:~,nbsp:%
set number
set scrolloff=5
set shortmess=atI
set splitbelow
set splitright

" History
set shadafile=NONE
let g:netrw_dirhistmax=0

" Indentation
set expandtab
set smartindent
set shiftwidth=2
set tabstop=2

" Search
set ignorecase
set smartcase

" Status line
set statusline=%f
set statusline+=%=
set statusline+=%{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|\ %{&fileformat}
set statusline+=\ \|\ %l/%L

" Remove trailing blank lines before writing to the file
function RemoveTrailingBlankLines()
  let l:cursor_position = getpos(".")
  %s/\n\+\%$//e
  call setpos(".", l:cursor_position)
endfunction
autocmd BufWritePre * call RemoveTrailingBlankLines()

" Remove trailing whitespace before writing to the file
function RemoveTrailingWhitespace()
  let l:cursor_position = getpos(".")
  %s/\s\+$//e
  call setpos(".", l:cursor_position)
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

" Toggle vertical ruler depending on the length of the longest line
function ToggleVerticalRuler()
  let l:line_length_limit = 80
  let l:longest_line_length = max(map(getline(1, "$"), "len(v:val)"))
  if l:longest_line_length > l:line_length_limit
    execute "set colorcolumn=" . (l:line_length_limit + 1)
  else
    set colorcolumn=""
  endif
endfunction
autocmd BufRead,TextChanged,TextChangedI * call ToggleVerticalRuler()
