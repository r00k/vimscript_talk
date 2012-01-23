" Hello world
function! HellowWorld()
  echo "Hello world"
endfunction!

" Calling a function!
call HellowWorld()


" Return values
function! ThisReturnsSomething()
  return "I done returned this for you"
endfunction!

" Print the return val
" Note that call just discards return values
echo ThisReturnsSomething()


" Default return value is 0. 
function! ThisReturnsZeroByDefault()
endfunction!

echo ThisReturnsZeroByDefault()


" Lets within a function! are local
function! LetsAreLocal()
  let foo = "bar"
endfunction!

function! LetsAreLocalForReal()
  echo foo
endfunction!


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
endfunction!

nmap <C-W>u :call MergeTabs()<CR>
 

" Run a cucumber scenario or rspec spec.
function! RunCurrentTest()
  exec "!" . CorrectTestRunner() . " --drb" . " " . expand('%:p')
endfunction!

function! RunCurrentLineInTest()
  exec "!" . CorrectTestRunner() . " --drb" . " " . expand('%:p') . ":" . line(".")
endfunction!

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
     return "rspec"
   endif
endfunction!


" Use of substitute to swap ~/ for expanded path
function! ExpandedCurrentDirectory()
  return substitute(getcwd(), '/Users/amir/', "~/", "g")
endfunction!


function! ExtractUrlFromCurrentLine()
  let line = getline(".")
  return matchstr(getline("."), "http[^ ]*")
endfunction!

"blah blah http://thoughtbot.com/live-vim-cams blarg barg


function! OpenUrlOnCurrentLineInBrowser()
  let url = ExtractUrlFromCurrentLine()
  " Note the lack of commas between arguments
  exec "!open ~/bin/chrome" url
endfunction
