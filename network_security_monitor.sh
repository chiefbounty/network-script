
### `network_security_monitor.sh`

```bash
#!/bin/bash

# Network Security Monitoring Script

LOG_FILE="/var/log/network_security_monitor.log"
SUSPICIOUS_LOGS="/var/log/auth.log"

# Function to print header
print_header() {
    echo "==============================="
    echo "  Network Security Monitor"
    echo "==============================="
}

# Function to check active network connections
check_active_connections() {
    echo "[INFO] Checking active network connections..."
    echo "$(date) - Active connections:" >> $LOG_FILE
    netstat -ntu | grep ESTABLISHED >> $LOG_FILE
    echo "Connections checked."
}

# Function to check for suspicious IP addresses
check_suspicious_ips() {
    echo "[INFO] Checking for suspicious IP addresses..."
    # Checking IP addresses using IPTables (can be replaced by fail2ban or other tools)
    iptables -L -n | grep "DROP" | awk '{print $4}' >> $LOG_FILE
    echo "Suspicious IPs logged."
}

# Function to check authentication logs for unauthorized attempts
check_auth_logs() {
    echo "[INFO] Checking authentication logs for suspicious activity..."
    grep "Failed password" $SUSPICIOUS_LOGS >> $LOG_FILE
    echo "Suspicious log entries checked."
}

# Function to check open ports
check_open_ports() {
    echo "[INFO] Checking open ports..."
    ss -tuln | grep LISTEN >> $LOG_FILE
    echo "Open ports logged."
}

# Main function
main() {
    print_header
    check_active_connections
    check_suspicious_ips
    check_auth_logs
    check_open_ports
    echo "[INFO] Network security check complete."
}

# Run the script
main
