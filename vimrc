" Theme
" dark
colo torte
" light
"colo default

" do not imitate vi
set nocompatible

" YouCompleteMe
set completeopt-=preview

" error format for JavaScript
set errorformat=\ \ \ \ \ \ at\ %m\ (%f:%l:%c)

" hot keys for vim configuration
noremap ,,v :e ~/.vimrc<cr>
noremap ,,s :source ~/.vimrc<cr>
noremap ,,o :syntax off

"" Tools
" Refactoring
noremap ,r viw"9y:%s/\<<c-r>9\>/<c-r>9/gc<left><left><left>
" Search in project
noremap ,f :grep --exclude-dir=dist --exclude-dir=node_modules --exclude-dir=generated --exclude-dir=.git -Ir "" .<left><left><left>
noremap ,F viw"9y:grep --exclude-dir=dist --exclude-dir=node_modules --exclude-dir=generated --exclude-dir=.git -Ir "<c-r>9" .<cr>
" Buffer
noremap ,b :buffers<cr>
noremap <c-j> :cn<cr>z.
noremap <c-k> :cp<cr>z.
" Open by fuzzyfinder
set path+=**
noremap ,o :find 
" NETRW
let g:netrw_banner=0
let g:netrw_list_hide= '.git,^\.\.\=/\=$'

syntax on
" show whitespaces
set list
set listchars=trail:_,tab:>-
" autocompletion in console
set wildmenu
" status line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
" f5 refresh
map <f5> <esc>:e!<cr>
" leader key
let mapleader=","
" save
noremap ,w :w<cr>
" open last :-command
noremap ,. :<up>
" git
nnoremap ,gs :!git status<cr>
nnoremap ,gd :!git diff<cr>
nnoremap ,gc :!git commit -am ""<left>
nnoremap ,gl :!echo -e "\n\n---\n\n"<cr>:!git log -3<cr>
nnoremap ,ga :!git add 
nnoremap ,gps :!git push origin master
nnoremap ,gpl :!git pull origin master
" show good line end
set colorcolumn=40
" scroll
nnoremap J 20j10k
nnoremap K 20k10j
set scrolloff=5
" leave insert mode
imap jj <esc>
imap ,. <esc>
" clipboard
vmap ,y "+y
imap ,p <esc>"+pi
nnoremap ,p "+p
nnoremap ,y "+y
" buffers
nnoremap ,e :Ex<cr>
nnoremap ,x :bd<cr>
nnoremap <c-h> :bp<cr>
nnoremap ,h :bp<cr>
nnoremap <c-l> :bn<cr>
nnoremap ,l :bn<cr>
" terminal
tnoremap <esc> <c-\><c-n>
" save by buffer switch
set autowrite
" editor
set tabstop=2
set shiftwidth=2
set sts=2
set expandtab
set autoindent
set smartindent
set number
" search
set incsearch
set hlsearch
nmap <space> :nohl<cr>
" no swap files
set nobackup
set nowritebackup
set noswapfile
" jump to pair end
vnoremap ,m $%
nnoremap ,m $%
" paired letters
imap {<cr> {<cr>}<esc><up>
imap (<cr> (<cr>)<esc><up>
"" auto close
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap < <><left>
inoremap ` ``<left>
inoremap ' ''<left>
inoremap " ""<left>
"" opened and closed
inoremap {} {}
inoremap () ()
inoremap [] []
inoremap <> <>
"" only opened
inoremap {{ {
inoremap (( (
inoremap [[ [
inoremap << <
inoremap `` `
inoremap '' '
inoremap "" "
"" (() => {})
inoremap (() (() => )<left>
"" delete
inoremap {<bs> {<bs>
inoremap (<bs> (<bs>
inoremap [<bs> [<bs>
inoremap `<bs> `<bs>
inoremap '<bs> '<bs>
inoremap "<bs> "<bs>
inoremap <<bs> <<bs>
" <left> and <right> in insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>
" spelling
noremap ,spen :setlocal spell spelllang=en_us
noremap ,spde :setlocal spell spelllang=de
" language specific
"" JavaScript
inoremap ,+ ' +  + '<left><left><left><left>
inoremap ,me module.exports = 
imap ,i if () {<cr>4li
inoremap ,r require('')<left><left>
inoremap ,c // TODO remove logconsole.log()<left>
inoremap ,C // TODO remove logconsole.log('')<left><left>
inoremap ,f function ()<left><left>
inoremap r<tab> return 
inoremap cl<tab> class 
inoremap c<tab> const 
inoremap co<tab> constructor() {<cr>}<up><esc>$<left><left>
inoremap it<tab> it('', function () {<cr>})<up><right><right>
inoremap de<tab> describe('', function () {<cr>})<up><esc>f'a
"" TypeScript
autocmd BufRead,BufNewFile *.ts set filetype=typescript
"" Python
autocmd FileType python     inoremap <buffer> """ """
"" PHP
autocmd FileType php        inoremap <buffer> print_r echo"<pre>";print_r();echo"</pre>";<esc>14hi
"" Markdown
nmap ,1 V:s/^#* \?/# /<cr>:nohl<cr>
nmap ,2 V:s/^#* \?/## /<cr>:nohl<cr>
nmap ,3 V:s/^#* \?/### /<cr>:nohl<cr>
nmap ,4 V:s/^#* \?/#### /<cr>:nohl<cr>
nmap ,5 V:s/^#* \?/##### /<cr>:nohl<cr>
nmap ,6 V:s/^#* \?/###### /<cr>:nohl<cr>
nmap ,7 V:s/^#* \?/####### /<cr>:nohl<cr>
nmap ,8 V:s/^#* \?/######## /<cr>:nohl<cr>
vmap ,i c **<esc>P
vmap ,b c ****<esc><left>P
""" footnote
inoremap foot<tab> [^] <left><left><left>
""" image
inoremap img<tab> ![name]()<left>
""" link
inoremap link<tab> [name]()<left>
""" code
inoremap code<tab> ```<cr>```<up>
""" task
inoremap t<tab> - [ ] 
function ToggleTaskX()
  if getline('.') =~ '^ *- \[ '
    execute 's/- \[ \]/- [x]'
    call cursor(line('.') + 1, 0)
  elseif getline('.') =~ '^ *- \[x'
    execute 's/- \[x\]/- [ ]'
    call cursor(line('.') + 1, 0)
  elseif getline('.') =~ '^- \[ \]'
    echomsg 'the current line is no task'
  endif
endfunction
nmap <tab> :call ToggleTaskX()<cr>
