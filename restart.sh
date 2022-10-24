#!/bin/bash
ulimit -c unlimited
while true; do ./tfs --log-file "output.txt" "error.txt"; done