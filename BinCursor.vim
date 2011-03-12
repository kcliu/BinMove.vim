
nmap <S-Right> :call MoveRight()<CR>
nmap <S-Left> :call MoveLeft()<CR>
"map <S-z> :call Reset()<CR>

let g:resetFlag = 0
let g:curPos = [0, 0]
let g:length = 0
set ut=1000
function! Reset()
    let g:resetFlag = 0
    let g:curPos[0] = 0
    let g:curPos[1] = col("$")
    "echo "reset!"
endfunction

function! MoveRight()
    au Cursorhold * call Reset()
    if g:resetFlag == 0
        let g:length = (col("$") - col("."))/2
        let g:resetFlag = 1 
    endif
    "call Debug()
    call cursor("0", (col(".") + g:length))
    let g:length = g:length/2
endfunction

function! MoveLeft()
    au Cursorhold * call Reset()
    if g:resetFlag == 0
        let g:length = col(".")/2
        let g:resetFlag = 1 
    endif
    "call Debug()
    call cursor("0", (col(".") - g:length))
    let g:length = g:length/2
endfunction

function! Debug()
    echo g:resetFlag
    echo col(".")
    echo g:length
endfunction

