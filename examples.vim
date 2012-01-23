" Hello world
function HellowWorld()
  echo "Hello world"
endfunction

" Calling a function
call HellowWorld()

" Return values
function ThisReturnsSomething()
  return "I done returned this for you"
endfunction

" Print the return val
" Note that call just discards return values
echo ThisReturnsSomething()

" Default return value is 0. 
function ThisReturnsZeroByDefault()
endfunction

echo ThisReturnsZeroByDefault()

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>
 

" Run a cucumber scenario or rspec spec.
function! RunCurrentTest()
  exec "!" . CorrectTestRunner() . " --drb" . " " . expand('%:p')
endfunction

function! RunCurrentLineInTest()
  exec "!" . CorrectTestRunner() . " --drb" . " " . expand('%:p') . ":" . line(".")
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
     return "rspec"
   endif
endfunction
