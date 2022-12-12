function git_branch_cleanup --description 'Cleanup local git branches no longer on remote side'
    git fetch -p
    for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')
        git branch -D $branch
    end
end
