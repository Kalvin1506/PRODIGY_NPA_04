#!/bin/bash

# === CONFIGURATION ===
INTERFACE="eth0"                 # Change to your network interface (e.g., wlan0)
LOGFILE="filtered_packets.txt"  # Output log file
DURATION=30                      # Duration to capture packets
FILTER_IP=""                     # Set to an IP to filter (leave blank for all)
FILTER_PORT=""                   # Set to a port to filter (leave blank for all)

# Check tcpdump
if ! command -v tcpdump &> /dev/null; then
    echo "Error: tcpdump not found. Please install it."
    exit 1
fi

# Ask user for IP and port filter
read -p "Enter IP to filter (press Enter to skip): " FILTER_IP
read -p "Enter port to filter (press Enter to skip): " FILTER_PORT#!/bin/bash

# === CONFIGURATION ===
INTERFACE="eth0"                 # Change to your network interface (e.g., wlan0)
LOGFILE="filtered_packets.txt"  # Output log file
DURATION=30                      # Duration to capture packets
FILTER_IP=""                     # Set to an IP to filter (leave blank for all)
FILTER_PORT=""                   # Set to a port to filter (leave blank for all)

# Check tcpdump
if ! command -v tcpdump &> /dev/null; then
    echo "Error: tcpdump not found. Please install it."
    exit 1
fi

# Ask user for IP and port filter
read -p "Enter IP to filter (press Enter to skip): " FILTER_IP
read -p "Enter port to filter (press Enter to skip): " FILTER_PORT

# Build tcpdump filter
TCPDUMP_FILTER=""

if [ -n "$FILTER_IP" ]; then
    TCPDUMP_FILTER+="host $FILTER_IP"
fi

if [ -n "$FILTER_PORT" ]; then
    if [ -n "$TCPDUMP_FILTER" ]; then
        TCPDUMP_FILTER+=" and "
    fi
    TCPDUMP_FILTER+="port $FILTER_PORT"
fi

# If no filter specified, default to "ip"
if [ -z "$TCPDUMP_FILTER" ]; then
    TCPDUMP_FILTER="ip"
fi

echo "Starting packet capture on $INTERFACE for $DURATION seconds..."
echo "Filter: $TCPDUMP_FILTER"
echo "Saving to $LOGFILE"
echo "--------------------------------------------------"

# Start capturing packets with tcpdump
sudo timeout "$DURATION" tcpdump -nn -i "$INTERFACE" -vv -l $TCPDUMP_FILTER | \
awk '/IP/ {
    split($3, src, ".");
    split($5, dst, ".");
    gsub(":", "", dst[1]);
    printf "[%s] %s -> %s\n", $2, src[1], dst[1];
    for (i=6; i<=NF; i++) {
        printf "%s ", $i
    }
    printf "\n--------------------------------------------------\n"
}' | tee "$LOGFILE"

echo "Capture complete. Results saved in $LOGFILE"
