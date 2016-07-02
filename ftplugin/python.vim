"NEOCOMPLCACHE SETTINGS for jedi-vim
let g:neocomplcache_enable_at_startup = 0
imap neosnippet#expandable() ? "(neosnippet_expand_or_jump)" : pumvisible() ? "" : "" - See more at: http://fromacoder.com/the-ultimate-python-autocompletion-for-vim/#sthash.UkvqQmZl.dpuf
smap neosnippet#expandable() ? "(neosnippet_expand_or_jump)" : - See more at: http://fromacoder.com/the-ultimate-python-autocompletion-for-vim/#sthash.UkvqQmZl.dpuf
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
  endif
  if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_overwrite_completefunc = 1
    let g:neocomplcache_force_omni_patterns['python'] = '[^. t].w*'
    set ofu=syntaxcomplete#Complete
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType python let b:did_ftplugin = 1
    " Vim-jedi settings
    "let g:jedi#popup_on_dot = 0


"SYNTASTIC settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['py'],
    \ 'pasive_filetyes': ['javac'] }

let g:syntastic_python_pep8_args='--ignore=E501,E127,E128'
"Hack because syntasttic_mode_map is not working to ignore java files
let g:loaded_syntastic_java_javac_checker = 1


" Run python tests
function! Run_python_test()
    " if the file we have open is the test file
    if shellescape(expand('%')) =~ "test_"
        execute  ":! nosetests -v '%'"

    else
        execute ":! nosetests -v 'test_%'"
    endif
endfunction

"run test
nnoremap <leader>rt :call Run_python_test()<esc>
