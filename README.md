# share-secret

[English](./README.md) | [Русский](./README.ru.md)

`share-secret` encrypts a text into a `.txt` file with a random password, prints the password, and reveals the file in Finder.

## Features

- One command to create an encrypted `.txt` file
- Random password generation with `openssl`
- Prints password to terminal
- Reveals file in Finder (`open -R`)

## Requirements

- macOS
- `openssl`

## Usage

```bash
share-secret "my secret text" "my-secret.txt"
```

Arguments:

- First arg: text to encrypt (required)
- Second arg: output filename (optional, default: `secret.txt`)

Output:

- Encrypted file at current directory
- Password in terminal output

## Local install

From repo root:

```bash
./scripts/install.sh
```

## Quick install from GitHub

```bash
curl -fsSL https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/share-secret/main/scripts/install-from-github.sh | bash
```

## Security notes

- Encryption uses `AES-256-CBC` with `PBKDF2` and random salt.
- Store printed password securely; file cannot be decrypted without it.

## Contributing

Please read [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) before contributing.
