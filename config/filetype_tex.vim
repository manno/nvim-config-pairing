"-----------------------------------------------------------
" MACROS - tex helper

" TEX MAPS
" un/comment tex block
vmap    _c      :s/\(\S\)/%\1/<CR>:noh<CR>
"vmap    _cb     :s/^/% /<CR>:noh<CR>
"vmap    _ub     :s/^% //<CR>:noh<CR>
"vmap    _u      :s/^%//<CR>:noh<CR>

" TEX ESCAPE MAPS
map     _et     :s/"/``/g<CR>:s/\*/$\\ast$/g<CR>

" quick insert - beamer foil
map   _if        i\begin{frame}<CR>\frametitle{title}<CR><CR>\end{frame}<CR><ESC>
vmap  _if        "zdi\begin{frame}{<C-R>z}<CR>\end{frame}<CR><ESC>
" beamer
vmap  _ia        "zdi\alert{<C-R>z}<ESC>
vmap  _is        "zdi \structure{<C-R>z}<ESC>
vmap  _iE        "zdi\begin{exampleblock}{Beispiel}<C-R>z\end{exampleblock}<ESC>
vmap  _iB        "zdi\begin{block}{Beispiel}<C-R>z\end{block}<ESC>
vmap  _id        "zdi\begin{description}<CR>\item[] <C-R>z\end{description}<CR><ESC>

" quick insert - environments
map   _ii        i\begin{itemize}<CR>\item<CR>\end{itemize}<CR><ESC>
"vmap  _ii        "zdi\begin{itemize}<CR>\item <C-R>z\end{itemize}<CR><ESC>
"damn hax
vmap  _ii        "zd:let @z = substitute (@z, "\n", "\n\\\\item ", "g")<CR>i\begin{itemize}<CR>\item <C-R>z\end{itemize}<CR><ESC>
vmap  _ie        "zdi\begin{enumerate}<CR>\item[1] <C-R>z\end{enumerate}<CR><ESC>
vmap  _iv        "zdi\begin{verbatim}<C-R>z\end{verbatim}<ESC>
vmap  _iq        "zdi\begin{quote}<CR>"`<C-R>z"'<CR>\end{quote}\vfill<ESC>

" don't do this
vmap  _ic        "zdi\emph{<C-R>z}<ESC>
vmap  _ib        "zdi\textbf{<C-R>z}<ESC>

" listings
vmap  _iL        "zdi\lstinline$<C-R>z$<ESC>
vmap  _il        "zdi\begin{lstlisting}[caption=]<CR><C-R>z<CR>\end{lstlisting}<ESC>

" build
au BufWritePost * if getline(2) =~ "% output" | let @p = substitute(getline(2),"% output","","") | endif
