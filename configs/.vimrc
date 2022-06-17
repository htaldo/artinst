set number
set autoindent
set tabstop=4 shiftwidth=4

syntax on
highlight Comment ctermfg=Yellow
highlight String ctermfg=Green
highlight Statement ctermfg=Red
highlight Conditional ctermfg=Red
highlight Normal ctermfg=White
highlight Cursor ctermfg=White
highlight NonText ctermfg=Magenta
highlight Special ctermfg=Magenta
highlight Type ctermfg=Blue
highlight PreProc ctermfg=Green
highlight Function ctermfg=Yellow
highlight LineNr ctermfg=Yellow
syntax enable

set timeout ttimeout
set timeoutlen=250
set ttimeoutlen=20

inoremap ;; <Esc>/{++}<Enter>"_c4l
inoremap :: <Esc>/(++)<Enter>"_c4l
inoremap ;g \includegraphics[scale=0.4]{}<Esc>i
inoremap ;s \section{}<Esc>i
inoremap ;z \subsection{}<Esc>i
inoremap ;f \frac{}{{++}}{++}<Esc>10hi
inoremap ;q \quad 
inoremap ;i \item 
inoremap ;e $${++}<Esc>4hi
inoremap ;n <Esc>$a<Enter>$$$$<Esc>hi
inoremap ;bi \begin{itemize}<Enter><Enter>\end{itemize}<Esc>ki
inoremap ;bc \begin{center}<Enter><Enter>\end{center}<Esc>ki
inoremap :b \textbf{}{++}<Esc>4hi
inoremap :t \textrm{}{++}<Esc>4hi
inoremap :e \emph{}{++}<Esc>4hi

inoremap ;( \left(
inoremap ;) \right)
