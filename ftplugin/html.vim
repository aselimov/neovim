if &ft=="markdown"
  finish
endif
map <C-b> : w % <Bar> ! firefox % & <CR>
inoremap ;d <div class="" ><Return><++><Return></div><Esc>kkf"a
inoremap ;a <a href=""><++></a><Esc>2F"a
inoremap ;p <p><Return></p><Esc>O
inoremap ;b <strong></strong> <++><Esc>2F>a
inoremap ;li <li></li><Esc>F>a
inoremap ;ll <ul><Return></ul><Esc>O
inoremap ;i <img src="" alt="<++>" width="<++>" height=auto><Esc>5F"i
inoremap ;s <body><Enter><div class="container"><Enter></div><Enter></body><Esc>kO 
