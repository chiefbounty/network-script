# Network Security Monitor

## Overview

This repository contains a simple yet effective Bash script for monitoring network security on Linux systems. The script tracks active network connections, logs open ports, detects suspicious IP addresses, and checks authentication logs for unauthorized access attempts.

The script can be used for basic network monitoring, helping system administrators and security professionals stay informed about network activity and potential threats.

## Features

- Monitors active network connections using `netstat`.
- Logs suspicious IP addresses that are blocked by `iptables`.
- Scans authentication logs (`/var/log/auth.log`) for failed login attempts.
- Lists open ports and listening services using `ss`.
- Saves all relevant logs to a specified log file for future reference.

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/yourusername/network-security-monitor.git
    ```

2. Give execution permission to the script:

    ```bash
    chmod +x network_security_monitor.sh
    ```

3. Run the script:

    ```bash
    ./network_security_monitor.sh
    ```

   The script will log its output to `/var/log/network_security_monitor.log`.

## Example Output

Here’s what you can expect in the log file:

