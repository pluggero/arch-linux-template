#!/bin/bash

# === Vault ===
VAULT_FILE="ansible/inventory/group_vars/all/vault.yml"
VAULT_PASS_FILE="ansible/inventory/group_vars/all/.vault_pass"

# === Directories ===
ROLES_DIR="ansible/roles"
ANSIBLE_DIR="ansible"

# === Ansible ===
ANSIBLE_CONFIG_FILE="$ANSIBLE_DIR/ansible.cfg"
POST_DEPLOY_PLAYBOOK="$ANSIBLE_DIR/playbooks/post-deploy.yml"
