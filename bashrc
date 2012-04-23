# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
	PS1='\[\033[01;32m\]PWD: \[\033[01;32m\]\w\[\033[00m\]\n:\$ '
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
	PS1='\[\033[01;32m\]PWD: \[\033[01;32m\]\w\[\033[00m\]\n:\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	PS1='\[\033[01;32m\]PWD: \[\033[01;32m\]\w\[\033[00m\]\n:\$ '
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias sl='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cdoneseg='cd /home/dongyl/semc-dev/source/edream4.0.1-docomo-release/vendor/semc/hardware/dtv/oneseg'
alias cdfelica='cd /home/dongyl/source/kddi/vendor/semc/hardware/felica'
alias cdmisc='cd /home/dongyl/source/kddi/kernel/drivers/misc'
alias viboard='vi /home/dongyl/source/kddi/kernel/arch/arm/mach-msm'
alias cdimage='cd /home/dongyl/semc-dev/ftp-server/SEMC/Image/ICS_Update'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#export JAVA_HOME=/usr/local/jdk1.5.0_22
#export JAVA_HOME=/usr/lib/jvm/java-6-sun
#export JAVA_FONTS=$JAVA_HOME/jre/lib/fonts
#export JAVA_FONTS=/usr/share/fonts/truetype
#export JRE_HOME=$JAVA_HOME/jre
#export ANT_HOME=/usr/share/ant
#export JAVA_PATH=$JAVA_HOME/bin:$JRE_HOME/bin
#export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#export ANDROID_JAVA_HOME=$JAVA_HOME
#export PATH=$JAVA_PATH:$ANT_HOME/bin:$PATH
#export PATH=/usr/local/android-sdk-linux_86/tools:$PATH

#export PATH=/home/dongyl/bin:$PATH
##export PATH=/opt/EmbedSky/4.3.3/bin:$PATH
#
##export GIT_PROXY_COMMAND=/usr/local/bin/git-proxy.sh
#export PATH=/home/dongyl/intel_work:$PATH
#
##http_proxy=http://proxy01.cd.intel.com:911
##export http_proxy
#
#export ADBHOST=192.168.6.9
#export no_proxy=localhost,.intel.com,10.0.0.0/8
#export PATH=$JAVA_PATH:$ANT_HOME/bin:$PATH:/home/dongyl/Coverity/prevent-4.5/binexport PATH=/usr/local/android-sdk-linux_86/tools:$PATH:/home/dongyl/Coverity/prevent-4.5/binexport PATH=/home/dongyl/bin:$PATH:/home/dongyl/Coverity/prevent-4.5/bin#export PATH=/opt/EmbedSky/4.3.3/bin:$PATH:/home/dongyl/Coverity/prevent-4.5/binexport PATH=/home/dongyl/intel_work:$PATH:/home/dongyl/Coverity/prevent-4.5/bin# Alias to start the Coverity Prevent Defect Manager
#				                 alias cov_start='cov-start-gui -d ~/Coverity/WWW'
#					# Alias to stop the Coverity Prevent Defect Manager
#					alias cov_stop='cov-stop-gui -d ~/Coverity/WWW'
export SEMC_BUILD_EXTRA_PARAMETERS="-offsite -offline" 
export SEMC_C2D_EXTRA_PARAMETERS="--offline"
export PATH=$PATH:/home/dongyl/bin
export JAVA_HOME=/home/dongyl/jdk1.6.0_23
export JRE_HOME=/$JAVA_HOME/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASHPATH
export PATH=$JAVA_HOME/bin:$PATH:$JRE_HOME/bin
export PATH=$PATH:/home/dongyl/source/EmbedSky/crosstools_3.4.5_softfloat/gcc-3.4.5-glibc-2.3.6/arm-linux/bin
