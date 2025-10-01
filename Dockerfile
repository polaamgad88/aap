# Base image from your EE definition
FROM registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel9:latest

# Switch to root to install content
USER root

# --- Dependency manifests derived from your EE file ---
# Galaxy collections
#   - community.okd
#   - kubernetes.core
RUN mkdir -p /tmp/ee-build
COPY <<'EOF' /tmp/ee-build/requirements.yml
---
collections:
  - name: community.okd
  - name: kubernetes.core
EOF

# Python deps
#   - ansible-core
COPY <<'EOF' /tmp/ee-build/requirements.txt
ansible-core
EOF

# --- Install dependencies ---
# Install Ansible Galaxy collections into the system collections path
RUN ansible-galaxy collection install -r /tmp/ee-build/requirements.yml -p /usr/share/ansible/collections

# Install Python packages (ansible-core is already present in base, but this ensures version alignment)
RUN pip3 install --no-cache-dir -r /tmp/ee-build/requirements.txt

# Clean up build artifacts
RUN rm -rf /root/.cache /tmp/ee-build

# Return to the non-root user expected by AAP EEs
USER 1001

# Default working directory (matches AAP EE conventions)
WORKDIR /runner
