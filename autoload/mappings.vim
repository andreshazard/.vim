" Cycle through relativenumber + number, number (only), and no numbering.
function! mappings#cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction


" Run python tests
function! mappings#run_python_test()
    " if the file we have open is the test file
    if shellescape(expand('%')) =~ "test_"
        execute  ":! nosetests -v '%'"

    else
        execute ":! nosetests -v 'test_%'"
    endif
endfunction
