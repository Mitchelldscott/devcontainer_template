# Dev Container Project Template

This project template uses a VS Code dev container setup to create a customizable development environment based on Debian GNU/Linux 12 (bookworm). It leverages Docker and dev container features to install and configure tools for various programming languages and frameworks. Below is an explanation based on the configuration files in .devcontainer.

## Core Setup via Dockerfile
The [`devbox/.devcontainer/Dockerfile`](devbox/.devcontainer/Dockerfile "devbox/.devcontainer/Dockerfile") defines the container's base image and initial configuration:
- Starts from a Debian slim image.
- Installs essential development tools like `sudo`, `git`, `vim`, `curl`, `wget`, `build-essential`, and `openssh-server`.
- Creates a non-root user with specified UID/GID and grants sudo access without a password.
- Copies the project workspace into the container and sets the working directory.

This ensures a consistent, isolated environment for development.

## Feature-Based Installations
The template uses dev container features (modular extensions) to add language-specific tools. Each feature has an [`devbox/.devcontainer/features/arduino/install.sh`](devbox/.devcontainer/features/arduino/install.sh ) script that runs as root during container build:
- ROS feature: Activates ROS (Robot Operating System) support.
- Arduino feature: Activates Arduino development tools.
- ARM feature: Activates ARM toolchain support.
- Julia feature: Activates Julia language environment.
- Rust feature: Activates Rust compiler and tools.
- C++ feature: Activates C++ development tools.
- Python feature: Activates Python environment.

These scripts echo activation messages but can be extended for actual installations (e.g., via `apt` or custom commands).

## User Profile Configuration
The [`devbox/scripts/set_profile.bash`](devbox/scripts/set_profile.bash "devbox/scripts/set_profile.bash") script updates the `.devcontainer/.env` file with the host user's UID, GID, and username. This ensures the container user matches the host for file permissions.

## How It Works
1. **Build Process**: When opening in VS Code, the dev container builds the Docker image using the Dockerfile, applies features via their install scripts, and sets up the user environment.
2. **Customization**: Features can be enabled/disabled in the dev container config (e.g., `devcontainer.json`, not shown here). The template supports multiple languages in one container.
3. **Usage**: Run the container to get a pre-configured workspace with tools for ROS, Arduino, ARM, Julia, Rust, C++, and Python. Use commands like `$BROWSER <url>` to open web pages in the host browser.

For more details, refer to the [dev container specification](https://containers.dev/implementors/features#install-sh). If you need to modify or add features, edit the respective [`devbox/.devcontainer/features/arduino/install.sh`](devbox/.devcontainer/features/arduino/install.sh ) files.