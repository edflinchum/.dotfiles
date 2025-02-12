function ll --wraps=eza --description 'alias ll eza -aghlF --group-directories-first --time-style=long-iso --icons'
  eza -aghlF --group-directories-first --time-style=long-iso --icons $argv;
end
