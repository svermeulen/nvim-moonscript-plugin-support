
function! moonmaker#compile(...)
    let verbose = len(a:000) == 0 ? 0 : a:1
    if verbose
        lua require("moonmaker").compileAll(true)
    else
        lua require("moonmaker").compileAll(false)
    endif
endfunction

function! moonmaker#execute(moonText)
    call luaeval("require('moonmaker').executeMoon(_A)", a:moonText)
endfunction

function! moonmaker#compileMoonIfOutOfDate(moonPath, luaPath)
    call luaeval("require('moonmaker').compileMoonIfOutOfDate(_A[1], _A[2])", [a:moonPath, a:luaPath])
endfunction

nnoremap <plug>(MoonCompile) :<c-u>call moonmaker#compile(1)<cr>

command! -bang -nargs=0 MoonCompile call moonmaker#compile(1)
command! -bang -nargs=1 Moon call moonmaker#execute(<q-args>)

