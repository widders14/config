"=====[ Tab handling ]========================================================
set tabstop=4
set expandtab
set shiftwidth=4
set shiftround

"=====[ Indentation ]=========================================================
set smartindent
set cinwords=if,elsif,else,unless,while,for,foreach,package,sub,method

"=====[ Deletion ]============================================================
set backspace=indent,eol,start         " can delete backwards

"=====[ Tracking ]============================================================
set ruler                              " shows <line>,<column>   <percentage>
set showcmd                            " see commands as you enter them

"=====[ Perldoc ]=============================================================
set keywordprg=perldoc                 " <K> shows the Perl man page

"=====[ Search ]==============================================================
set incsearch                          " highlights first match
set hlsearch                           " highlights every match
set syntax=enable                      " enable syntax colouring

"=====[ Map keys ]============================================================
" <Backspace> switch highlighting off
:nmap <silent> <BS> :nohlsearch<CR>

" <;y> switch syntax colouring on and off
:nmap <silent> ;y : if exists("syntax_on") <BAR>
                  \     syntax off <BAR>
                  \ else <BAR>
                  \     syntax enable <BAR>
                  \ endif<CR>

" <;t> insert a real tab
:nmap <silent> ;t i<C-V><Tab><Esc>

" <F2> show vimrc
:nmap <F2> :sp<CR>:e $HOME/.vimrc<CR>

" <F3> man page for perldoc for modules
:nmap <F3> :set keywordprg=perldoc<CR>K<CR>

" <F4> man page for perldoc -f
:nmap <F4> :set keywordprg=perldoc\ -f <CR>K<CR>

" <F5> execute a Perl programm
:nmap <F5> :!clear;echo;echo exec %...;echo;./%;echo;echo;echo<CR>

" <F6> set permissions
:nmap <F6> :!clear;echo;echo;chmod 755 %;echo;echo;echo<CR>

" <F9> append Perl header
:nmap <F9> A#!/home/widders/perl5/perlbrew/perls/perl-5.16.0/bin/perl<Enter><Enter>use strict;<Enter>use warnings;<Enter><Enter>use 5.016;<Enter><Enter>use Data::Dumper;<Enter>use Carp;<Enter><Enter><Esc>

" <F11> append Moose modules
:nmap <F11> A    use Moose;<Enter>use MooseX::Method::Signatures;<Enter><Esc>

" <F12> append Moose roles
:nmap <F12> A    use Moose::Role;<Enter>use MooseX::Method::Signatures;<Enter><Esc>

"=====[ Window ]==============================================================
" shows help information in its own full window
augroup HelpInTabs
    au!
    au BufEnter * call HelpInNewTab()
    function! HelpInNewTab()
        if &buftype == 'help'
            execute "normal \<C-W>T"
        endif
    endfunction
augroup END

"=====[ Skeletons ]===========================================================
" Perl templates
:autocmd BufNewFile *.pl 0read ~/Skeletons/skel_pl.c
:autocmd BufNewFile *.pm 0read ~/Skeletons/skel_pm.c

