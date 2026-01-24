#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"/..

source ./scripts/lib/shared.sh

source ./scripts/config.sh
# Optional override
if [[ -n "${CONFIG_OVERRIDE:-}" && -f "$CONFIG_OVERRIDE" ]]; then
  source "$CONFIG_OVERRIDE"
fi

# Verify python dependencies
assert_virtual_env
assert_python_dependencies "$PYTHON_REQUIREMENTS"

# Verify system dependencies
assert_dependencies

clean_roles "$ROLES_DIR"
install_roles "$ROLES_DIR"

HOST_PASSWORD=$(extract_host_password "$VAULT_FILE" "$VAULT_PASS_FILE")

ANSIBLE_CONFIG="$ANSIBLE_CONFIG_FILE" \
  ansible-playbook \
  "$POST_DEPLOY_PLAYBOOK" \
  --extra-vars ansible_become_password="$HOST_PASSWORD"
