#!/bin/bash

# === Directories ===
ANSIBLE_DIR="ansible"
ROLES_DIR="$ANSIBLE_DIR/roles"

# === Vault ===
VAULT_FILE="$ANSIBLE_DIR/inventory/group_vars/all/vault.yml"
VAULT_PASS_FILE="$ANSIBLE_DIR/inventory/group_vars/all/.vault_pass"

# === Ansible ===
ANSIBLE_CONFIG_FILE="$ANSIBLE_DIR/ansible.cfg"
POST_DEPLOY_PLAYBOOK="$ANSIBLE_DIR/playbooks/post-deploy.yml"

# === Requirements Files (multiple supported) ===
# Define requirements files as an array
REQUIREMENTS_FILES=("$ANSIBLE_DIR/requirements.yml")

# === Python Dependencies ===
PYTHON_REQUIREMENTS="requirements.txt"
