# HADock - Home Assistant Docker Setup with Qwen Integration

A complete Home Assistant setup running in Docker with Qwen AI conversation integration via AppDaemon and custom components.

## Features

- 🏠 **Home Assistant Core** - Running in Docker container
- 🤖 **Qwen AI Integration** - Both AppDaemon and custom conversation agent
- 📱 **Smart Home Devices** - Temperature, humidity, motion sensors, LED, buzzer, fan, lights
- 🔒 **Secure Configuration** - Environment variables for sensitive data
- 📊 **AppDaemon** - Advanced automation and AI assistant

## Quick Setup

### 1. Clone and Configure

```bash
git clone <your-repo>
cd HADock

# Copy environment template and fill in your values
cp .env.example .env
nano .env  # Edit with your actual values
```

### 2. Environment Variables

Edit `.env` file with your configuration:

```bash
# Home Assistant Configuration
HA_URL=http://your-ha-ip:8123
HA_TOKEN=your-home-assistant-long-lived-access-token

# Qwen/Ollama Configuration  
QWEN_URL=http://localhost:11434
QWEN_MODEL=qwen2.5:1.5b-instruct-q4_0
```

### 3. Start Services

```bash
# Start Home Assistant
docker-compose up -d

# Verify container is running
docker logs homeassistant
```

### 4. Setup Ollama (if using local Qwen)

```bash
# Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# Pull Qwen model
ollama pull qwen2.5:1.5b-instruct-q4_0
```

## Project Structure

```
HADock/
├── .env                    # Environment variables (not in git)
├── .env.example           # Template for environment variables
├── .gitignore            # Git ignore rules
├── docker-compose.yaml   # Docker configuration
├── load_env.py          # Environment loader utility
├── chat_client.py       # PyQt5 chat client
├── README.md            # This file
└── hass_config/         # Home Assistant configuration
    ├── configuration.yaml
    ├── appdaemon/
    │   ├── appdaemon.yaml
    │   └── apps/
    │       └── apps.yaml
    └── custom_components/
        └── qwen_conversation/
            ├── __init__.py
            ├── manifest.json
            └── conversation.py
```

## Components

### Home Assistant Core
- Main automation platform
- Web interface at `http://your-ip:8123`
- Manages all smart home devices

### Qwen Integration (Dual Setup)
1. **Custom Conversation Agent** - Direct integration with HA chat interface
2. **AppDaemon Assistant** - Advanced automation and context-aware responses

### Smart Home Devices
- Temperature & Humidity sensors
- Motion sensor
- LED activation counter
- Buzzer alert counter  
- DC motor fan (switch)
- Smart home light (switch)

## Usage

### Web Interface
Access Home Assistant at `http://your-ip:8123` and use the built-in conversation interface.

### Chat Client
Run the PyQt5 desktop client:
```bash
python3 chat_client.py
```

### AppDaemon Dashboard
Access AppDaemon at `http://your-ip:5050`

## Security Notes

- ✅ All sensitive data moved to `.env` file
- ✅ `.env` file excluded from git
- ✅ Use `.env.example` as template
- ✅ Long-lived access tokens for API access
- ✅ Local network configuration

## Troubleshooting

### Home Assistant Recovery Mode
If HA enters recovery mode:
1. Check Docker logs: `docker logs homeassistant`
2. Verify `.env` file exists and has correct values
3. Ensure custom component files are present

### Qwen Connection Issues
1. Verify Ollama is running: `ollama list`
2. Check model is available: `ollama pull qwen2.5:1.5b-instruct-q4_0`
3. Test API: `curl http://localhost:11434/api/version`

### Environment Variables Not Loading
1. Ensure `.env` file is in project root
2. Check file permissions: `chmod 644 .env`
3. Verify Docker Compose includes `env_file` section

## Development

To modify the Qwen integration:
1. Edit files in `hass_config/custom_components/qwen_conversation/`
2. Restart Home Assistant: `docker-compose restart`
3. Check logs for errors: `docker logs homeassistant`

## Contributing

1. Fork the repository
2. Create feature branch
3. Make changes (ensure no secrets in commits)
4. Test with `.env.example`
5. Submit pull request

## License

MIT License - see LICENSE file for details.
