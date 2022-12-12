function la --wraps=ls --description 'alias la ls -AFhl --color=auto --group-directories-first'
  ls -AFhl --color=auto --group-directories-first $argv; 
end
