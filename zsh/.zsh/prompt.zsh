# Prompt
autoload -U colors && colors
autoload -Uz vcs_info

### git: Show marker (u) if there are untracked files in repository
+vi-git-untracked(){
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -q '^.' 2> /dev/null ; then
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

    # As always first run the system so everything is setup correctly.
    vcs_info
    if [ $EXIT_STATUS -eq 0 ]
    then
        PS1="%F{#ffec94}%m%f %F{#328dc2}%~%f ${vcs_info_msg_0_}%F{#40c265}[%f%*%F{#40c265}]%f
%F{#00ff00}>>%f "
    else
        PS1="%F{#ffec94}%m%f %F{#328dc2}%~%f ${vcs_info_msg_0_}%F{#40c265}[%f%*%F{#40c265}]%f
%F{#ff0000}>%f%F{#00ff00}>%f "
    fi
    # vcs_info found something, that needs space. So a shorter $PWD
    # makes sense.
}
