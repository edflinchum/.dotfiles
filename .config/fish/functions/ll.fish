function ll --wraps=exa --description 'alias ll exa -aFghl --color-scale --group-directories-first --time-style=long-iso --icons'
  exa -aFghl --color-scale --group-directories-first --time-style=long-iso --icons $argv; 
end
