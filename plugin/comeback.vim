f !exists("g:comeback_localleader")
    let maplocalleader = ","
    let g:comeback_localleader = "<localleader>"
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


function! s:InsertAction(action)
    if a:action == 1
	let pattern = "TODO: "
    elseif a:action == 2
	let pattern = "WARN: "
    elseif a:action == 3
	let pattern = "NOTE: "
    endif

    execute "normal! a" . pattern
    startinsert!
endfunction

nnoremap <script> <buffer> <silent> <localleader>bt
	    \ :call <SID>InsertAction(1)<cr>

nnoremap <script> <buffer> <silent> <localleader>bw
	    \ :call <SID>InsertAction(2)<cr>

nnoremap <script> <buffer> <silent> <localleader>bn
	    \ :call <SID>InsertAction(3)<cr>
