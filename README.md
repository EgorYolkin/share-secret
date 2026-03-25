# share-secret

[English](./README.md) | [Русский](./README.ru.md)

`share-secret` encrypts text with a random password, saves it as a secure file, prints the password, and reveals files in Finder.

## Features

- Default encryption to password-protected `.zip`
- Inside `.zip` the payload is a regular `.txt` file with your text
- Optional encryption mode via OpenSSL internals (`AES-256-CBC + PBKDF2`)
- `share-secret open` to decrypt encrypted files
- `share-secret write` for convenient multi-line input
- On macOS, Share menu integration is available but disabled by default
- `share-secret setup` for YAML config (user/global)
- Configurable output directory
- Startup update check against GitHub tags with options `skip update` or `update`

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
- Copies password to clipboard (macOS `pbcopy`)
- Reveals encrypted file in Finder

## Multi-line input

```bash
share-secret write my-note
```

Then type multiple lines and press `Ctrl+D`.

You can also run without text argument:

```bash
share-secret
```

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
share-secret setup fast
share-secret setup secure
share-secret setup manual --output-dir ~/Secrets --encryption-mode openssl
```

Profiles:

- `fast` zip encryption + current directory + opens Finder for sharing
- `secure` OpenSSL encryption (`.txt`) + current directory + opens Finder for sharing
- `manual` full custom setup via flags

Options:

- `--user` write config to user config directory (default)
- `--global` write config to system config directory (requires `sudo`)
- `--output-dir <path>` directory for encrypted files (`.` means current directory)
- `--encryption-mode <zip|openssl>` encryption backend (default: `zip`)
- `--macos-share-menu <true|false>` auto-open Share menu on macOS (default: `false`)

Config file is YAML:

```yaml
output_dir: "."
encryption_mode: "zip"
skip_update_version: ""
macos_open_share_menu: "false"
```

Config resolution:

- User config has priority over global config
- If no config exists, defaults are current directory + `zip` mode

## Update check

On command start, `share-secret` checks latest GitHub release tag.

If a newer tag exists, CLI offers:

- `skip update` (suppresses prompt for this exact version until next new release)
- `update` (downloads and installs latest tagged `share-secret` binary)

When Share menu is enabled on macOS, share payload includes encrypted file + generated password text file.

- `skip update` (suppresses prompt for this exact version until next new release)
- `update` (downloads and installs latest tagged `share-secret` binary)

Disable check for current run:

```bash
SHARE_SECRET_NO_UPDATE_CHECK=1 share-secret "text"
```

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
