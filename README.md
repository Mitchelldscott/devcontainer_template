# Dev Container Project Template

A customizable VS Code dev container environment based on Debian 12 (Bookworm). Designed for robotics and embedded development with modular feature support.

## Quick Start

1.  **Initialize Environment**:
    Set your project name (required by `devcontainer.json`):
    ```bash
    export PROJECT_NAME="my-project"
    ```

2.  **Configure User**:
    Sync host user permissions to the container:
    ```bash
    ./scripts/set_profile.bash
    ```

3.  **Launch**:
    Open this folder in VS Code and run **Dev Containers: Reopen in Container**.

## Architecture

*   **Core**: Debian Bookworm Slim with `build-essential`, `git`, `vim`, and `openssh-server`.
*   **Orchestration**: Uses `docker-compose` to mount the workspace and handle networking.
*   **Features**: Modular install scripts located in `.devcontainer/features/`. Uncomment required languages (Rust, Python, C++, ROS, etc.) in `.devcontainer/devcontainer.json` to enable them.

## Configuration

*   **`Dockerfile`**: Base image setup.
*   **`docker-compose.yaml`**: Defines services and volume mounts.
*   **`devcontainer.json`**: VS Code settings, extensions, and feature toggles.
