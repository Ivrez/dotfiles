"  ██    ██ ██ ███    ███ ██████   ██████ 
"  ██    ██ ██ ████  ████ ██   ██ ██      
"  ██    ██ ██ ██ ████ ██ ██████  ██ 
"   ██  ██  ██ ██  ██  ██ ██   ██ ██ 
"██  ████   ██ ██      ██ ██   ██  ██████ 
"
" author: ivrez
" github: https://github.com/Ivrez

filetype plugin indent on
syntax enable

" show line numbers
set number
" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all = 1


" the purpose of the 'list' (:help 'list') setting is to visualise tabs, spaces, and line endings.
set list
" eol: The character to show at the end of each line
" tab: The characters used to show a tab. Two characters are used: the second will be repeated for each space
" trail: Character to show for trailing spaces.
set listchars=tab:->,trail:~,precedes:<,extends:>,eol:␤

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
