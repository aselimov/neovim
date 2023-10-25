map <C-b> : w % <Bar> ! make <CR>

"Some code snippets for filling in 
inoremap ;d do<Space><CR>end<Space>do<Esc>O<Tab><++><Esc>kA
inoremap ;i if<Space>()<Space>then<CR>end<Space>if<Esc>O<Tab><++><Esc>kF(a
inoremap ;s select<Space>case(<++>)<CR>case(<++>)<CR><Tab><++><CR><Esc>4hicase(<++>)<CR><Tab><++><CR><Esc>4hiend<Space>select<CR><Esc>5kFsi
inoremap ;ph print *, '------------------------------------------------------------'<CR>print *, ''<CR>print *, '------------------------------------------------------------'<Esc>kci'
inoremap ;pr read(, *, iostat=iospara) <++><CR>if(iospara>0) then<CR>print *, "Error: Invalid read of <++> with error code", iospara<CR>call mpi_abort(mpi_comm_world, 1, ierr)<CR>end if<ESC>4k0f(a
inoremap ;ptp print *, '[OK] - '<ESC>i
inoremap ;ptf print *, '[FAILED] - '<ESC>i


set colorcolumn=132
