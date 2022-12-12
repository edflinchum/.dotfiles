function lt --wraps=exa --description 'alias lt exa -aFT --color-scale --group-directories-first --icons'
  exa -aFT --color-scale --group-directories-first --icons $argv; 
end
