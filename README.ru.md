# share-secret

[English](./README.md) | [Русский](./README.ru.md)

`share-secret` шифрует текст случайным паролем, сохраняет в защищённый файл, выводит пароль и показывает файлы в Finder.

## Возможности

- По умолчанию шифрование в пароль-защищённый `.zip`
- Внутри `.zip` лежит обычный `.txt` файл с вашим текстом
- Опционально шифрование через OpenSSL (`AES-256-CBC + PBKDF2`)
- `share-secret open` для расшифровки файлов
- `share-secret write` для удобного ввода нескольких строк
- Пароль автоматически копируется в буфер обмена (`pbcopy`, macOS)
- Интеграция с системным Share-меню macOS (по умолчанию выключена)
- `share-secret setup` для YAML-конфига (user/global)
- Настраиваемая директория сохранения
- Проверка обновлений по тегам GitHub с выбором `skip update` / `update`

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
- Пароль копируется в буфер обмена
- Зашифрованный файл показывается в Finder

## Multi-line ввод

```bash
share-secret write my-note
```

После запуска введите несколько строк и завершите ввод `Ctrl+D`.

Также можно запустить без текста:

```bash
share-secret
```

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
share-secret setup fast
share-secret setup secure
share-secret setup manual --output-dir ~/Secrets --encryption-mode openssl
```

Профили:

- `fast` шифрование в `zip` + текущая директория
- `secure` шифрование через `openssl` (`.txt`) + текущая директория
- `manual` полная настройка флагами

Опции:

- `--user` записать конфиг в пользовательскую config-папку (по умолчанию)
- `--global` записать конфиг в системную config-папку (нужен `sudo`)
- `--output-dir <path>` директория для зашифрованных файлов (`.` = текущая директория)
- `--encryption-mode <zip|openssl>` backend шифрования (по умолчанию: `zip`)
- `--macos-share-menu <true|false>` авто-открытие Share-меню на macOS (по умолчанию: `false`)

YAML-конфиг:

```yaml
output_dir: "."
encryption_mode: "zip"
skip_update_version: ""
macos_open_share_menu: "false"
```

Приоритет конфигов:

- Сначала user config, потом global config
- Если конфигов нет, используются текущая директория и режим `zip`

## Проверка обновлений

На старте команда проверяет последний тег в GitHub-репозитории.

Если доступна новая версия, предлагаются пункты:

- `skip update` (скрывает этот конкретный апдейт до следующей новой версии)
- `update` (скачивает и устанавливает свежую версию)

Отключить проверку для текущего запуска:

```bash
SHARE_SECRET_NO_UPDATE_CHECK=1 share-secret "text"
```

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
