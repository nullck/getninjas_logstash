#!/bin/bash
CURATOR="/usr/local/bin/curator"
ELASTIC_SEARCH1="search-scup-logs-pf72fnvq5kq7an5gkuc6izqfui.us-east-1.es.amazonaws.com"
KEEP_DAYS="7"
TIMESTRING="%Y.%m.%d"

$CURATOR --host $ELASTIC_SEARCH1 --port 80 delete indices --older-than $KEEP_DAYS --time-unit days --timestring $TIMESTRING

exit 0