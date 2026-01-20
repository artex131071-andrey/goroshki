# WordPress магазин shop.goroshki.ru

Эта папка содержит WordPress + WooCommerce интернет-магазин.

## 🚀 Установка WordPress

1. Скачать и установить WordPress:
```bash
cd /var/www/goroshki/shop/
wp core download --locale=ru_RU
```

2. Создать конфигурацию:
```bash
cp wp-config-sample.php wp-config.php
# Затем отредактируйте wp-config.php и добавьте данные БД
```

3. Создать базу данных:
```bash
mysql -u root -p
CREATE DATABASE goroshki_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'goroshki_user'@'localhost' IDENTIFIED BY 'secure_password';
GRANT ALL PRIVILEGES ON goroshki_shop.* TO 'goroshki_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

4. Установить WordPress через браузер:
```
http://shop.goroshki.ru/wp-admin/install.php
```

5. Установить плагины:
```bash
# См. список в /config/wordpress-plugins.txt
wp plugin install woocommerce --activate
wp plugin install wordpress-seo --activate
# и т.д.
```

## 📁 Структура

```
shop/
├── wp-config-sample.php     ✅ В Git (шаблон)
├── wp-config.php            ❌ НЕ в Git (локальный с паролями)
├── wp-content/
│   ├── plugins/             ❌ НЕ в Git (устанавливаются отдельно)
│   ├── themes/              ❌ НЕ в Git (кроме кастомных)
│   └── uploads/             ❌ НЕ в Git (файлы пользователей)
└── [WordPress ядро]         ❌ НЕ в Git
```

## ⚠️ ВАЖНО

- **НЕ** коммитьте `wp-config.php` (содержит пароли БД)
- **НЕ** коммитьте папку `uploads/` (пользовательские файлы)
- **НЕ** коммитьте плагины и темы (устанавливаются через wp-cli)

## 🔗 Ссылки

- [WordPress документация](https://wordpress.org/support/)
- [WooCommerce документация](https://woocommerce.com/documentation/)
- [WP-CLI команды](https://wp-cli.org/)
