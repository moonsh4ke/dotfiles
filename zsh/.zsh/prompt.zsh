# Prompt
autoload -U colors && colors
autoload -Uz vcs_info

### git: Show marker (u) if there are untracked files in repository
+vi-git-untracked(){
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -qE "^." 2> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+=' U'
    fi
}

### Compare local changes to remote changes

### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
# zstyle ':vcs_info:git*+set-message:*' hooks git-st
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    # Exit early in case the worktree is on a detached HEAD
    git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

    local -a ahead_and_behind=(
        $(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream} 2>/dev/null)
    )

    ahead=${ahead_and_behind[1]}
    behind=${ahead_and_behind[2]}

    (( $ahead )) && gitstatus+=( "+%F{#36c73f}${ahead}%f" )
    (( $behind )) && gitstatus+=( "-%F{#cf9f38}${behind}%f" )

    if [ -z ${(j:/:)gitstatus} ] 
    then 
        hook_com[misc]+=''
    else
        hook_com[misc]+=" ${(j:/:)gitstatus}"
    fi
}


zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st
zstyle ':vcs_info:git:*' formats "on %F{#f34f29}%b%f%F{#ffdd30}%c%f%m "

precmd() {

    EXIT_STATUS=$?
    # Don't print a new line at first command.
    if [ -z $NEW_LINE_BEFORE_PROMPT ]
    then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ $NEW_LINE_BEFORE_PROMPT -eq 1 ]
    then
        print ""
    fi

    ## Getting stack directories
    # Todo: find a POSIX equivalent
    # if [ $(command -v pushd) ]
    # then
    #     local arr=($(pushd +0))
    #     if [ ${#arr[@]} -gt 1 ]
    #     then
    #         stack_dirs="
# %F{#fa8a28}S [%f ${arr[*]:1} %F{#fa8a28}]%f"
    #     else
    #         stack_dirs=""
    #     fi
    # fi

    suspended_jobs=""
    [ -n "$(jobs | grep -v "nohup")" ] && suspended_jobs="%F{#ab62f5}*%f "

    # Exit status (last command) colored prompt
    if [ $EXIT_STATUS -eq 0 ]
    then
        status_color="%F{#00ff00}>>%f"
    else
        status_color="%F{#ff0000}>%f%F{#00ff00}>%f"
    fi

    # As always first run the system so everything is setup correctly.
    vcs_info

    PS1="%F{#ffec94}%n@%m%f %F{#328dc2}%~%f ${vcs_info_msg_0_}%F{#40c265}[%f%*%F{#40c265}]%f $stack_dirs
$suspended_jobs$status_color "

    # if [ $EXIT_STATUS -eq 0 ]
    # then
    #     PS1="%F{#ffec94}%m%f %F{#328dc2}%~%f ${vcs_info_msg_0_}%F{#40c265}[%f%*%F{#40c265}]%f
# %F{#00ff00}>>%f "
    # else
    #     PS1="%F{#ffec94}%m%f %F{#328dc2}%~%f ${vcs_info_msg_0_}%F{#40c265}[%f%*%F{#40c265}]%f
# %F{#ff0000}>%f%F{#00ff00}>%f "
    # fi
    
}
