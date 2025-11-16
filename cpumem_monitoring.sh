#!/bin/bash

LOG_FILE="$HOME/system_usage.log"
INTERVAL=5   # time in seconds between checks (you can change this)

echo "Starting system monitoring..."
echo "Logging every $INTERVAL seconds to: $LOG_FILE"
echo "Press CTRL + C to stop."

# Write a header to the log file
echo "=== CPU & Memory Usage Log ===" >> "$LOG_FILE"
echo "Started on: $(date)" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Loop forever until the user stops script
while true
do
    echo "Timestamp: $(date)" >> "$LOG_FILE"
    
    # CPU usage
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Usage: $CPU%" >> "$LOG_FILE"
    
    # Memory usage
    MEM=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
    echo "Memory Usage: $MEM%" >> "$LOG_FILE"
    
    echo "------------------------" >> "$LOG_FILE"

    sleep "$INTERVAL"
done