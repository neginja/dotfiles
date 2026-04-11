#!/bin/bash

get_stats() {
    grep '^cpu' /proc/stat
}

stat1=$(get_stats)
sleep 0.5
stat2=$(get_stats)


calc_usage() {
    local line1=($1)
    local line2=($2)
    
    # summing user + nice + system + irq + softirq + steal
    local active1=$((${line1[1]} + ${line1[2]} + ${line1[3]} + ${line1[6]} + ${line1[7]} + ${line1[8]}))
    local total1=$(($active1 + ${line1[4]} + ${line1[5]})) # active + idle + iowait
    
    local active2=$((${line2[1]} + ${line2[2]} + ${line2[3]} + ${line2[6]} + ${line2[7]} + ${line2[8]}))
    local total2=$(($active2 + ${line2[4]} + ${line2[5]}))
    
    local diff_active=$((active2 - active1))
    local diff_total=$((total2 - total1))
    
    # prevent division by zero
    if [ "$diff_total" -eq 0 ]; then
        echo "0"
    else
        echo "scale=0; ($diff_active * 100) / $diff_total" | bc
    fi
}

cpu_utilization_avg=$(calc_usage "$(echo "$stat1" | head -n1)" "$(echo "$stat2" | head -n1)")
temperature_avg=$(($(cat /sys/class/hwmon/hwmon3/temp1_input) / 1000))

# build tooltip
tooltip=""
# skip the first line (total cpu)
while IFS= read -r s1 && IFS= read -r s2 <&3; do
    core_name=$(echo "$s1" | awk '{print $1}')
    usage=$(calc_usage "$s1" "$s2")
    tooltip+="$core_name: $usage%\\n"
done < <(echo "$stat1" | tail -n +2) 3< <(echo "$stat2" | tail -n +2)

class="cool"
if [ "$temperature_avg" -gt 80 ]; then
    class="critical"
elif [ "$temperature_avg" -gt 65 ]; then
    class="warm"
fi

echo "{\"text\": \"   $cpu_utilization_avg% $temperature_avg°C\", \"tooltip\": \"$tooltip\", \"class\": \"$class\"}"