#Combines mkdir and cd commands..
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# cd with history, http://linuxgazette.net/109/marinov.html
source ~/bash/acd_func.sh
