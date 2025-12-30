# =============================================================================
# Configure Build: Set parameters and tools for the build
# =============================================================================
ARG BASE_IMAGE=debian:bookworm-slim
FROM ${BASE_IMAGE}

ARG USERNAME
ARG USER_UID
ARG USER_GID
ARG PROJECT_NAME

ENV PROJECT_NAME=${PROJECT_NAME}

# =============================================================================
# Development Tools: Essential utilities for development
# =============================================================================
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    git \
    vim \
    curl \
    wget \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# =============================================================================
# User Configuration: Set up workspace
# =============================================================================
RUN if id -u $USER_UID ; then userdel `id -un $USER_UID` ; fi
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y

USER ${USERNAME}
ENV SHELL=/bin/bash
COPY ./ /home/${USERNAME}/${PROJECT_NAME}
WORKDIR /home/${USERNAME}/${PROJECT_NAME}
