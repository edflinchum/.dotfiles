set -l cur_dir (dirname (status -f))    
    
for f in $fish_complete_path    
  # skip this file      
  string match -q "$cur_dir" "$f"              
  and continue                       
                                     
  # source our first found git completion file      
  test -e "$f/git.fish"       
  and source "$f/git.fish"    
  and break    
end                                  
                                     
# overwrite function to use git wrapper    
function __fish_git
    set -l saved_args $argv
    set -l global_args
    set -l cmd (commandline -opc)
    # We assume that git is the first command until we have a better awareness of subcommands, see #2705.
    set -e cmd[1]
    if argparse -s (__fish_git_global_optspecs) -- $cmd 2>/dev/null
        # All arguments that were parsed by argparse are global git options.
        set -l num_global_args (math (count $cmd) - (count $argv))
        if test $num_global_args -ne 0
            set global_args $cmd[1..$num_global_args]
        end
    end
    # Using 'command git' to avoid interactions for aliases from git to (e.g.) hub
    # Using eval to expand ~ and variables specified on the commandline.
    # eval command git $global_args \$saved_args 2>/dev/null
    eval git $global_args \$saved_args 2>/dev/null
end
