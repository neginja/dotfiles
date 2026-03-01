#!/bin/bash

INFO=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total --format=csv,noheader,nounits)
UTIL=$(echo "$INFO" | cut -d, -f1)
TEMP=$(echo "$INFO" | cut -d, -f2)
MEM_USED=$(echo "$INFO" | cut -d, -f3)
MEM_TOTAL=$(echo "$INFO" | cut -d, -f4)

echo "{\"text\": \"$UTIL% $TEMP°C\", \"tooltip\": \"Memory: $MEM_USED / $MEM_TOTAL MiB\"}"