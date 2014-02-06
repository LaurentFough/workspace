set sw=2
set iskeyword+=:

" problème du é
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'evince'
map <leader>b :w<cr>:silent! call Tex_RunLaTeX()<cr>
