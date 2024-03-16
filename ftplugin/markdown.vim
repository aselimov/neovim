set spell spellfile="~/.config/nvim/spell/wordlist"
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'fortran']
"set conceallevel=2
"let g:vim_markdown_math = 1
"let g:tex_conceal = "abdmg"
hi clear Conceal
map <C-b> : w % <Bar> AsyncRun md2pdf "%" <CR> 
map <A-p> : w % <Bar> AsyncRun md2beamer "%" <CR> 
map <A-b> : w % <Bar> AsyncRun md2docx %  <CR>
map <C-z> : !zathura %:r.pdf & <CR>
set tw=1000
set colorcolumn=

