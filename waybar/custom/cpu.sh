#!/bin/bash

cpu_utilization_avg=$(grep '^cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5); printf "%.2f", usage}')
temperature_avg=$(($(cat /sys/class/hwmon/hwmon3/temp1_input) / 1000))
tooltip=$(grep '^cpu[0-9]' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5); printf "Core %d: %.0f%%\\n", NR-1, usage}')

class="cool"
if [ "$temperature_avg" -gt 80 ]; then
    class="critical"
elif [ "$temperature_avg" -gt 65 ]; then
    class="warm"
fi

echo "{\"text\": \"   $cpu_utilization_avg% $temperature_avg°C\", \"tooltip\": \"$tooltip\", \"class\": \"$class\"}"