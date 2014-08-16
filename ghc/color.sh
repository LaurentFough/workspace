#!/bin/sh

# Color reset
rst=`echo "[0;48;05;233m"`

# Colors
light_blue="[38;05;123m"
error_red="[38;05;202m"
success_green="[38;05;82m"

# Patterns
double_colon="s/::/$light_blue&$rst/;"
three_asterisks="/^\\*\\*\\*/{s/^.*$/$error_red&$rst/;}"
failed_loading="/^Failed, modules loaded: none.$/{s/^.*$/$error_red&$rst/;}"
success_loading="/^Ok, modules loaded:/{s/^.*$/$success_green&$rst/;}"

exec "`which ghc`" --interactive ${1+"$@"} |\
sed "$double_colon
$success_loading
$failed_loading
$three_asterisks"
