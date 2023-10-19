" vim customizations for hackney (hostname)

" initialize Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim

" disabled Pathogen plugins
let g:pathogen_disabled = ['ale']
source ~/.vim/coc.config.vim

execute pathogen#infect()


"" use rust.vim syntax checking with ALE
"let g:ale_linters = {'rust': ['cargo', 'rustfmt']}
"let g:ale_fixers = {'rust': ['rustfmt']}
"let g:ale_rust_cargo_use_check = 1
"let g:ale_rust_cargo_check_tests = 1
"let g:ale_rust_cargo_check_examples = 1

" open Tagbar with F8 key
nmap <F8> :TagbarToggle<CR>


