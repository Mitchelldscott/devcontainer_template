# Dyseware DevBox: A Robotics Development Environment

## Overview

Dyseware DevBox is a versatile and reusable development container designed for robotics projects. It provides a consistent and fully-equipped environment with a wide range of tools for robotics, low-level development, and emulation. This dev container is built to be a starting point for various robotics projects, ensuring that you have the right tools from the get-go.

## Features

This dev container comes pre-configured with a variety of tools and features, including:

- **Robot Operating System (ROS):** For building and simulating robotics applications.
- **Gazebo:** A powerful 3D robotics simulator.
- **Multi-language Support:**
  - **C/C++:** For performance-critical code and low-level hardware interaction.
  - **Python:** For rapid prototyping, scripting, and data analysis.
  - **Rust:** For memory-safe systems programming.
  - **Julia:** For high-performance numerical and scientific computing.
- **Embedded Development:**
  - **Arduino:** For programming microcontrollers.
  - **ARM:** For cross-compilation and development for ARM-based systems.
- **Low-level Debugging and Emulation:** Tools for debugging and emulating hardware.
- **Persistent Caches:** For faster builds and package management.
- **Customizable:** Easily extend and customize the environment to fit your project's specific needs.

## Getting Started

To get started with the Dyseware DevBox, you'll need to have [Visual Studio Code](https://code.visualstudio.com/) and the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed.

1. **Clone this repository:**

    ```bash
    git clone https://github.com/your-username/devcontainer_template.git
    ```

2. **Open in VS Code:** Open the cloned repository in Visual Studio Code.
3. **Reopen in Container:** VS Code will detect the `.devcontainer` configuration and prompt you to "Reopen in Container". Click on it.

This will build the Docker container and set up your development environment.

## Configuration

The dev container is configured using the following files:

- **`.devcontainer/devcontainer.json`:** The main configuration file for the dev container. You can enable or disable features by commenting or uncommenting them in the `features` section.
- **`.vscode/extensions/*.json`:** Individual feature configurations. You can customize the installation of each feature by modifying these files.
- **`docker/docker-compose.yaml`:** The Docker Compose file that defines the services, networks, and volumes for the dev container.
- **`docker/Dockerfile`:** The Dockerfile that builds the base image for the dev container. You can add or remove system dependencies here.
- **`.devcontainer/.env`:** This file is used to store environment variables for the build process. You will need to create this file and populate it with the required variables.

### `.env` file example

Create a `.devcontainer/.env` file with the following content:

```dockerfile
USERNAME=dev
USER_UID=1000
USER_GID=1000
BASE_IMAGE=ubuntu:22.04
PROJECT_NAME=my-robotics-project
WORKSPACE_DIR=/home/dev/workspaces
LOCAL_SETUP_DIR=./
```

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.
