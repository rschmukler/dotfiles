set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="caramel"

" ---------------------------------------------------------

hi Normal		guifg=#000000	guibg=#f5f2f0

" ---------------------------------------------------------

hi Comment		  guifg=#708090	guibg=bg
hi LineNr		    guifg=#708090	guibg=#faf8f7

hi Statement		guifg=#0077aa	guibg=bg cterm=bold
hi Keyword  		guifg=#0077aa	guibg=bg cterm=bold
hi Function  		guifg=#0077aa	guibg=bg cterm=bold

hi goBuiltins   guifg=#dd4a68 guibg=bg cterm=bold
hi Identifier		guifg=#dd4a68	guibg=bg

hi Type			    guifg=#669900	guibg=bg
hi Constant		  guifg=#669900	guibg=bg

hi Operator		  guifg=#a67f59	guibg=#faf8f7

hi Number		    guifg=#990055	guibg=bg
hi Float		    guifg=#990055	guibg=bg
