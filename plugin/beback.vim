if !exists("g:beback_localleader")
    let maplocalleader = ","
    let g:beback_localleader = "<localleader>"
endif

function! s:FindAllActions()
    let pattern = "TODO:\\|WARN:\\|NOTE:"

    execute 'lvimgrep ' . pattern . ' %'
    execute 'vert lopen 35'

    execute 'setlocal modifiable'
    execute '%normal! d2f|x'

    nnoremap <script> <buffer> <silent> q :lclose<cr>
endfunction

nnoremap <script> <buffer> <silent> <localleader>bb
    \ :call <SID>FindAllActions()<cr>


function! s:FindAction(action)
    if a:action == 1
	let pattern = 'TODO\:'
    elseif a:action == 2
	let pattern = 'WARN:'
    elseif a:action == 3
	let pattern = 'NOTE:'
    endif

    execute 'lvimgrep ' . pattern . ' %'
    execute 'vert lopen 35'

    execute 'setlocal modifiable'
    execute '%normal! d2f|x'

    nnoremap <script> <buffer> <silent> q :lclose<cr>
endfunction

nnoremap <script> <buffer> <silent> <localleader>bz
    \ :call <SID>FindAction(1)<cr>

nnoremap <script> <buffer> <silent> <localleader>bx
    \ :call <SID>FindAction(2)<cr>

nnoremap <script> <buffer> <silent> <localleader>bc
    \ :call <SID>FindAction(3)<cr>

let s:comment_syntax = {
    \   "c": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "vim": '"',
    \	"css": '\/* \*/',
    \	"html": '<!-- -->'
    \ }

function! s:InsertAction(action)
    if a:action == 1
	let pattern = "TODO: "
    elseif a:action == 2
	let pattern = "WARN: "
    elseif a:action == 3
	let pattern = "NOTE: "
    endif

    if has_key(s:comment_syntax, &filetype)
	let comment_structure = s:comment_syntax[&filetype]
	let which_filetype = &filetype

	if which_filetype == 'html'
	    execute "normal! a" . comment_structure 
	    execute "normal! F a " . pattern 
	elseif which_filetype == 'css'
	    execute "normal! a" . comment_structure 
	    execute "normal! F a " . pattern
	    execute "normal! F:la "
	else
	    execute "normal! a" . comment_structure . " " . pattern
	endif
    endif

    startinsert
endfunction

nnoremap <script> <buffer> <silent> <localleader>bt
	    \ :call <SID>InsertAction(1)<cr>

nnoremap <script> <buffer> <silent> <localleader>bw
	    \ :call <SID>InsertAction(2)<cr>

nnoremap <script> <buffer> <silent> <localleader>bn
	    \ :call <SID>InsertAction(3)<cr>
