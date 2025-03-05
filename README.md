# Dante SOCKS Proxy Setup

This repository provides an automated setup for configuring a [Dante SOCKS proxy](https://www.inet.no/dante/) on a Linux server. The installation process is handled by the `install_dante_proxy.sh` script, and a systemd service is included to ensure the proxy runs as a background service.

## Features

- Automatically installs Dante SOCKS proxy
- Configures systemd to manage the proxy service
- Provides secure and customizable SOCKS proxy access

## Installation

### Prerequisites

Ensure you have the following:
- A Linux-based system (Kali, Ubuntu, Debian, CentOS, etc.)
- Root or sudo access
- Git and Make
- Port 8888 free

### Steps to Install

1. Clone this repository:
   ```
   git clone https://github.com/H4CK-7H3-P14N37/dante-proxy-setup.git
   cd dante-proxy-setup
   ```

2. Make the install script executable:
   ```sh
   chmod +x install_dante_proxy.sh
   ```

3. Run the installation script:
   ```
   sudo ./install_dante_proxy.sh
   ```

4. Enable and start the systemd service:
   ```
   sudo systemctl enable dante
   sudo systemctl start dante
   ```

5. Verify the service is running:
   ```
   sudo systemctl status dante
   ```

## Uninstallation

To remove the Dante proxy service, run:
```
sudo systemctl stop dante
sudo systemctl disable dante
rm -f /etc/systemd/system/dante.service
```
