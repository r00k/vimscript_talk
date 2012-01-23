" Hello world
function! HelloWorld()
  echo "Hello world"
endfunction!

" Calling a function!
call HelloWorld()








" Return values
function! ThisReturnsSomething()
  return "I done returned this for you"
endfunction!

" Print the return val
" Note that 'call' discards return values
echo ThisReturnsSomething()







" Default return value is 0. 
function! ThisReturnsZeroByDefault()
endfunction!

echo ThisReturnsZeroByDefault()

" Take advantage of the default return value
function! IsFooTooBig(foo)
  " Note var scoping
  if a:foo > 10
    return 1
  endif
endfunction










" Lets within a function! are local
function! LetsAreLocal()
  let foo = "bar"
  return foo
endfunction!

function! LetsAreLocalForReal()
  echo foo
endfunction!

echo LetsAreLocal()
echo LetsAreLocalForReal()






" Merge a tab into a split in the previous window
function! MergeTabs()
  " Tab pages are not zero indexed
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
  " Arguments to internal commands don't get commas.
  " execute adds spaces for you, unless you use '.'
  execute "buffer" bufferName
endfunction!

 

" Run a cucumber scenario or rspec spec.
function! RunCurrentTest()
  exec "!" . CorrectTestRunner() "--drb" expand('%:p')
endfunction!

function! RunCurrentLineInTest()
  exec "!" . CorrectTestRunner() "--drb" expand('%:p') . ":" . line(".")
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
  return matchstr(getline("."), "http[^ ]*")
endfunction!

"blah blah http://thoughtbot.com/live-vim-cams blarg barg









function! OpenUrlOnCurrentLineInBrowser()
  let url = ExtractUrlFromCurrentLine()
  " Note the lack of commas between arguments
  exec "!open ~/bin/chrome" url
endfunction




                         The End

      Notes: http://github.com/r00k/vimscript_talk

      Me:    http://twitter.com/r00k

    



