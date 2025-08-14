#!/bin/bash
# Script to start AppDaemon with environment variables loaded

# Change to the project directory
cd /home/cciaz/Desktop/HADock

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
    echo "Environment variables loaded from .env"
else
    echo "Warning: .env file not found"
fi

# Start AppDaemon
exec /home/cciaz/Desktop/HADock/hass_config/appdaemon-venv/bin/appdaemon -c /home/cciaz/Desktop/HADock/hass_config/appdaemon
