ECHO +++++++++++++++++++++++++++++++++++++++++++++++
ECHO + Immune Response Template navigator by ISBM. +
ECHO +++++++++++++++++++++++++++++++++++++++++++++++
ECHO 
ECHO Starting a copy of IRT 1.1 as Google application...

# local directory of IRT 
DIR="$(dirname "${BASH_SOURCE[0]}")"

# open window in file access mode
#open -a /Applications/Google\ Chrome.app/ file://$DIR/index.xhtml --args --allow-file-access-from-files --disable-popup-blocking

open -a /Applications/Google\ Chrome.app/  --args --allow-file-access-from-files --disable-popup-blocking --app="file://$DIR/index.xhtml" # --user-data-dir=/tmp