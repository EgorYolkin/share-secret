# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- `share-secret open <file> <password> [output-file]` command for decryption
- Configurable `encryption_mode` (`zip` or `openssl`) in YAML config

### Changed
- Default encryption mode switched to password-protected `.zip`
- `share-secret setup` now supports `--encryption-mode`
- README and README.ru updated for encrypt/decrypt workflow

## [v1.0.1] - 2026-03-25

### Added
- Russian documentation in `README.ru.md`
- Language switcher links between English and Russian README files
- `LICENSE` (MIT)
- `CODE_OF_CONDUCT.md`

### Changed
- Expanded `.gitignore` for common local files
