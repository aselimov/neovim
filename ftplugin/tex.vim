set spell 
set spelllang=en_us
map <C-b> : w % <Bar> make! <CR>
map <C-z> : !make read & <CR>
inoremap ;f \begin{figure}<Enter>\centering<Enter>\includegraphics[]{<++>}<Enter>\caption{<++>}<Enter>\end{figure}<Esc>2kf[a
inoremap ;2f \begin{figure}<CR>\centering<CR>\begin{subfigure}[t]{0.49\textwidth}<CR>\centering<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\end{subfigure}<CR>\begin{subfigure}[t]{0.49\textwidth}<CR>\centering<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\end{subfigure}<CR>\end{figure}<Esc>8k/<++><Enter>"_c4l
inoremap ;3f \begin{figure}<CR>\centering<CR>\begin{subfigure}[t]{0.32\textwidth}<CR>\centering<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\end{subfigure}<CR>\begin{subfigure}[t]{0.32\textwidth}<CR>\centering<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\end{subfigure}<CR>\begin{subfigure}[t]{0.32\textwidth}<CR>\centering<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\end{subfigure}<CR>\end{figure}<Esc>13k/<++><Enter>"_c4l
inoremap ;F \begin{frame}{<++>}<Enter>\end{frame}<Esc>O<++><Esc>-i
inoremap ;b \textbf{} <++><Esc>F{a
inoremap ;c \caption{}<Esc>i
inoremap ;C \begin{columns}<Enter>\column{0.49\textwidth}<Enter>\column{0.49\textwidth}<Enter><++><Enter>\end{columns}<Esc>2kO
inoremap ;ig \includegraphics[width=\textwidth]{<++>}<Esc>16hi
inoremap ;li \begin{itemize}<Enter>\item<Enter>\end{itemize}<Esc>kA 
inoremap ;le \begin{enumerate}<Enter>\item<Enter>\end{enumerate}<Esc>kA 
inoremap ;ll \item<Space>
inoremap ;2t  \begin{table}[h!]<Enter>\begin{center}<Enter>\begin{tabular}{c c}<Enter> \toprule<Enter>\textbf{} & \textbf{<++>} \\<Enter>\midrule<Enter><++> & <++> \\<Enter>\bottomrule<Enter>\end{tabular}<Enter>\end{center}<Enter>\end{table}<Esc>6kf{a
inoremap ;e \begin{equation}<Enter>\label{<++>}<Enter>\end{equation}<ESC>kO
inoremap ;fw width=\textwidth<Esc>F\i
inoremap ;fh height=\textheight<Esc>F\i

set tw=5000
