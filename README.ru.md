# share-secret

[English](./README.md) | [Русский](./README.ru.md)

`share-secret` шифрует текст случайным паролем, сохраняет в защищённый файл, выводит пароль и показывает файлы в Finder.

## Возможности

- По умолчанию шифрование в пароль-защищённый `.zip`
- Опционально шифрование через OpenSSL (`AES-256-CBC + PBKDF2`)
- `share-secret open` для расшифровки файлов
- `share-secret setup` для YAML-конфига (user/global)
- Настраиваемая директория сохранения

## Требования

- macOS
- `openssl`
- `zip` и `unzip` (для режима по умолчанию)

## Шифрование

```bash
share-secret "мой секретный текст" "my-secret"
```

Поведение:

- По умолчанию создаётся `my-secret.zip`
- Генерируется и выводится пароль
- Зашифрованный файл показывается в Finder

## Расшифровка

```bash
share-secret open /path/to/my-secret.zip password123
```

Опциональный выходной файл:

```bash
share-secret open /path/to/my-secret.zip password123 /path/to/decrypted.txt
```

## Команда настройки

```bash
share-secret setup --user --output-dir ~/Secrets --encryption-mode zip
```

Опции:

- `--user` записать конфиг в пользовательскую config-папку (по умолчанию)
- `--global` записать конфиг в системную config-папку (нужен `sudo`)
- `--output-dir <path>` директория для зашифрованных файлов (`.` = текущая директория)
- `--encryption-mode <zip|openssl>` backend шифрования (по умолчанию: `zip`)

YAML-конфиг:

```yaml
output_dir: "."
encryption_mode: "zip"
```

Приоритет конфигов:

- Сначала user config, потом global config
- Если конфигов нет, используются текущая директория и режим `zip`

## Локальная установка

Из корня репозитория:

```bash
./scripts/install.sh
```

## Быстрая установка из GitHub

```bash
curl -fsSL https://raw.githubusercontent.com/<YOUR_GITHUB_USER>/share-secret/main/scripts/install-from-github.sh | bash
```

## Контрибьютинг

Перед вкладом в проект прочитайте [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).
