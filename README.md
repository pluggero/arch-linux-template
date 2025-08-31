# Arch Linux Template

## Getting started

### Installation

1. Clone the repository:

```
git clone https://github.com/pluggero/arch-linux-template.git
cd arch-linux-template
```

2. Install virtual environment:

```
python3 -m venv venv
source venv/bin/activate
```

3. Install dependencies:

```
pip install -r requirements.txt
```

### Configuration

1. Create `vault.yml` file in `ansible/inventory/group_vars/all` directory:

```
ansible-vault create ansible/inventory/group_vars/all/vault.yml
```

- Add the following content to `vault.yml` (replace `<VARIABLE>` with your desired values):

```
ansible_user: "<USER>"
user_setup_password: "<PASSWORD>"
user_setup_password_salt: "<SALT>"
borgbackup_backup_device_id_serial_short: "<DISK_SERIAL_SHORT>"
borgbackup_patterns:
  style: "sh"
  roots:
    - "<DIRECTORY_TO_BACKUP>"
  includes: []
  excludes: []
  excludes_no_recurse: []
```

- **NOTE**: You can use the following command to generate a random password salt (it must be 16 characters long and should not include special characters):

```
openssl rand -base64 32 | cut -c 16
```

2. Create `.vault_pass` file containing the vault password in `ansible/inventory/group_vars/all` directory:

```
echo "<YOUR_VAULT_PASSWORD>" > ansible/inventory/group_vars/all/.vault_pass
chmod 600 ansible/inventory/group_vars/all/.vault_pass
```

- **NOTE**: Your vault and its password are **never committed** to version control (see `.gitignore`).

---

## Usage

### Post-Deployment Configuration

```
./scripts/arch_post_deploy.sh
```

---

## Contributing

Contributions are welcome!

---

## License

MIT

---

## Author Information

This project is maintained by [pluggero](https://github.com/pluggero).
