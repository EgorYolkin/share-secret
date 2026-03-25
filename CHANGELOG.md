# Changelog

All notable changes to this project will be documented in this file.

## [v1.1.0] - 2026-03-25

### Added
- `share-secret open <file> <password> [output-file]` command for decryption
- `share-secret write [output-file]` for convenient multi-line input
- Setup profiles: `fast`, `secure`, `manual`
- Startup update check against GitHub tags with options `skip update` / `update`
- Config keys: `skip_update_version`, `macos_open_share_menu`

### Changed
- Default encryption mode switched to password-protected `.zip`
- `.zip` now stores a regular named `.txt` payload file (e.g. `note.txt`)
- Password is copied to clipboard on macOS via `pbcopy`
- macOS Share menu integration is now available but disabled by default
- `share-secret setup` now supports `--encryption-mode` and `--macos-share-menu`
- README and README.ru updated with full workflow and configuration

## [v1.0.1] - 2026-03-25

### Added
- Russian documentation in `README.ru.md`
- Language switcher links between English and Russian README files
- `LICENSE` (MIT)
- `CODE_OF_CONDUCT.md`

### Changed
- Expanded `.gitignore` for common local files
