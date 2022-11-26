#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h:\w\n$(__git_ps1 "(%s) ")\$ '

