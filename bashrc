PATH="/data/bin:/sbin:/system/sbin:/system/bin:/system/xbin"
# Enable color
CLICOLOR=1

# Enable history
HISTFILE="/system/etc/bash/bash_history"
HISTFILESIZE=1000000000
HISTSIZE=1000000

# Prompt color codes
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
# Red prompt when in a root shell
if [ ${EUID} -eq 0 ]; then
	#PS1="\[$txtred\][\t \u@\h\[\e[m\] \[$txtblu\]\W\[\e[m\]\[$txtred\]]# \[\e[m\]"
	PS1="\[$txtred\][\t\[\e[m\] \[$txtblu\]\W\[\e[m\]\[$txtred\]]# \[\e[m\]"
else
	#PS1="\[$txtgrn\][\t \u@\h\[\e[m\] \[$txtblu\]\W\[\e[m\]\[$txtgrn\]]$ \[\e[m\]"
	PS1="\[$txtgrn\][\t\[\e[m\] \[$txtblu\]\W\[\e[m\]\[$txtgrn\]]$ \[\e[m\]"
fi
PS2='> '
PS4='+ '

alias dellogs='rm -rf /sdcard/log /data/log/modem_trace'
alias kmsg='cat /proc/kmsg'
alias logcat='logcat -v threadtime'
alias klogcat='logcat -f /dev/kmsg -b main'
alias sdmsg='dmesg > /data/log/modem_trace/dmesg.log'
alias lr='while true; do ls -l; sleep 1; done;'
alias cpcrash='sleep 10; rm -rf /sdcard/log/*; echo 1 > /sys/devices/platform/mif_sipc5/ap_dump_int/value'