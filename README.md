# share-secret

[English](./README.md) | [Русский](./README.ru.md)

`share-secret` encrypts text with a random password, saves it as a secure file, prints the password, and reveals files in Finder.

## Features

- Default encryption to password-protected `.zip`
- Optional encryption mode via OpenSSL internals (`AES-256-CBC + PBKDF2`)
- `share-secret open` to decrypt encrypted files
- `share-secret setup` for YAML config (user/global)
- Configurable output directory

## Requirements

- macOS
- `openssl`
- `zip` and `unzip` (for default mode)

## Encrypt usage

```bash
share-secret "my secret text" "my-secret"
```

Behavior:

- By default creates `my-secret.zip`
- Prints generated password
- Reveals encrypted file in Finder

## Decrypt usage

```bash
share-secret open /path/to/my-secret.zip password123
```

Optional output file:

```bash
share-secret open /path/to/my-secret.zip password123 /path/to/decrypted.txt
```

## Setup command

```bash
share-secret setup --user --output-dir ~/Secrets --encryption-mode zip
```

Options:

- `--user` write config to user config directory (default)
- `--global` write config to system config directory (requires `sudo`)
- `--output-dir <path>` directory for encrypted files (`.` means current directory)
- `--encryption-mode <zip|openssl>` encryption backend (default: `zip`)

Config file is YAML:

```yaml
output_dir: "."
encryption_mode: "zip"
```

Config resolution:

- User config has priority over global config
- If no config exists, defaults are current directory + `zip` mode

## Local install

From repo root:

```bash
./scripts/install.sh
```

## Quick install from GitHub

```bash
curl -fsSL https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/share-secret/main/scripts/install-from-github.sh | bash
```

## Contributing

Please read [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) before contributing.
