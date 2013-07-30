if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.t   		setfiletype tom
  au! BufNewFile,BufRead *.tom 		setfiletype tom
  au! BufNewFile,BufRead *.gom 		setfiletype gom
	au! BufNewFile,BufRead *.iml 		setfiletype ocaml
	au BufRead,BufNewFile *.v    		setfiletype coq
	au! BufRead,BufNewFile *.mlw		setfiletype why3
augroup END
