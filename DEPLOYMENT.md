# 🚀 Гайд Деплоя Goroshki

## Овервью

Этот гайд описывает процесс распределения (деплоя) доменов на Beget.com.

---

## Шаг 1: Настройка Git

### Клонируювание репозитория

```bash
# Клонируй центральный репозиторий
git clone https://github.com/artex131071-andrey/goroshki.git
cd goroshki

# Открой точку текущего каталога
git config --global user.name "Андрей K"
git config --global user.email "artex131071@gmail.com"
```

### Основные ветки

```
main     – Производственные привэвиси
 develop – Разработка
feature/* – Новые фичеры
fix/*    – Исправления ошибок
```

---

## Шаг 2: Деплой Лендинга (goroshki.ru)

### Способ A: Через FTP/SFTP (Простое)

```bash
# 1. Получи все файлы из папки landing/
cd landing/
ls -la

# 2. Подключись по SFTP к Beget
# Установи FileZilla, WinSCP или любой FTP клиент

# 3. Настройки подключения:
Host: ftp.beget.com или sftp.beget.com
Port: 21 (FTP) или 22 (SFTP)
Username: [FTP ключ]
Password: [FTP пароль]

# 4. Пойти в директорию
/var/www/vhosts/goroshki.ru/

# 5. Выгружение всех файлов из landing/
```

### Метод Б: От сервера директории (Высокое мастерства)

```bash
# 1. Открой SSH в Beget (если доступно)
cd /var/www/vhosts/goroshki.ru/

# 2. Клонируй репозиторий или пуль изменения
git clone https://github.com/artex131071-andrey/goroshki.git .
git pull origin main

# 3. Перейти в landing/ и копируй файлы
cp -r landing/* .

# 4. Настройка прав
# установи 755 для директориев
find . -type d -exec chmod 755 {} \;
# установи 644 для файлов
find . -type f -exec chmod 644 {} \;
```

### Правильная структура в Beget

```
/var/www/vhosts/goroshki.ru/
├── index.html              ✓ Проверь
├── robots.txt              ✓ SEO
├── sitemap.xml             ✓ SEO
├── css/
│   └── style.css            ✓ Минимизированные
├── js/
│   ├── main.js              ✓ Оптимизированные
│   └── analytics.js
├── images/                ✓ WebP формат
│   ├── products/
│   └── icons/
└── .well-known/           ✓ SSL/HTTPS
    └── acme-challenge/
```

### Проверка Livelinessa

```bash
# Открой в браузере
http://goroshki.ru

# Проверь РОНЖОН: используемые стили и скрипты
F12 → Console → Проверь ошибки

# Проверь HTTPS
http://goroshki.ru → На HTTPS перенаправит (301)

# Проверь 404
http://goroshki.ru/nonexistent → Объявна 404 страница
```

---

## Шаг 3: Воссоздание VPS и установка WordPress

### Основная Настрояка VPS

```bash
# 1. Открой контрольную панель
# Бегет → Облако → Виртуальные серверы

# 2. Составь новый VPS
# - OS: Ubuntu 22.04 LTS
# - RAM: 2-4 GB
# - CPU: 2-4 vCPU
# - SSD: 50-100 GB

# 3. Записать скаид SSH
```

### После составления VPS

```bash
# 1. Понключись по SSH
ssh root@<VPS_IP>

# 2. Обнови систему
apt update
apt upgrade -y

# 3. Установи желательные пакеты
apt install -y curl wget git nano

# 4. Открой файрвол
ufw allow 22
ufw allow 80
ufw allow 443
ufw enable
```

### Основные пакеты для WordPress

```bash
# 1. Apache 2 + PHP 8.x + MySQL
apt install -y apache2 php-fpm php-mysql mysql-server

# 2. Алюга должны WordPress
apt install -y php-curl php-json php-mbstring php-xml

# 3. Отключи Apache модули
a2enmod rewrite
a2enmod ssl
a2enmod proxy_fcgi
setfacl
```

### Мыскль Настройка

```bash
# 1. Тахтоц мысквл
mariadb-secure-installation

# 2. Откоенные ротери
mysql -u root -p

# 3. Через MySQL console
CREATE DATABASE shop_goroshki_db;
CREATE USER 'shop_user'@'localhost' IDENTIFIED BY 'SecurePassword123';
GRANT ALL PRIVILEGES ON shop_goroshki_db.* TO 'shop_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### Ображдение WordPress

```bash
# 1. Открой хттп директорию
cd /var/www/

# 2. Груже WordPress
curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm latest.tar.gz

# 3. Хориентир домен
ln -s wordpress shop.goroshki.ru
chown -R www-data:www-data wordpress/
chmod -R 755 wordpress/

# 4. Редактируй wp-config.php
cd wordpress
cp wp-config-sample.php wp-config.php
nano wp-config.php

# Отредактируй:
DB_NAME = 'shop_goroshki_db'
DB_USER = 'shop_user'
DB_PASSWORD = 'SecurePassword123'
DB_HOST = 'localhost'
```

### Осквение SSL Сертификаты

```bash
# 1. Основные трезы
rm /etc/apache2/sites-enabled/000-default.conf

# 2. Используй Let's Encrypt (Certbot)
apt install -y certbot python3-certbot-apache

# 3. Генерируй сертификаты
certbot certonly --apache -d shop.goroshki.ru

# 4. Настрой автоматическое обновление
certbot renew --pre-hook "systemctl stop apache2" --post-hook "systemctl start apache2"
```

---

## Шаг 4: Инсталляция WooCommerce и Плагинов

### Проход Настройки WordPress

1. Открой https://shop.goroshki.ru
2. Проход живоавтралляижация
3. Создай админаккаунт

### Основные Плагины

```
☑ WooCommerce (e-commerce platform)
☑ WooCommerce Payments (payment processing)
☑ Yoast SEO (SEO optimization)
☑ Wordfence Security (security)
☑ BackWPup (backups)
☑ WP Rocket (caching)
☑ Cloudflare (CDN)
```

### Командная строка инсталляция

```bash
# Онлайн-по принципа WP-CLI
wp plugin install woocommerce --activate
wp plugin install yoast-seo --activate
wp plugin install wordfence --activate
wp plugin install backwpup --activate
wp plugin install wp-rocket --activate
```

---

## Шаг 5: Настройка Apache/Nginx

### Virtual Host Apache для shop.goroshki.ru

```bash
# Открой
sudo nano /etc/apache2/sites-available/shop.goroshki.ru.conf

# Основные метхжжы:
<VirtualHost *:80>
    ServerName shop.goroshki.ru
    ServerAlias www.shop.goroshki.ru
    
    DocumentRoot /var/www/wordpress
    
    <Directory /var/www/wordpress>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
    ErrorLog ${APACHE_LOG_DIR}/shop.goroshki.ru_error.log
    CustomLog ${APACHE_LOG_DIR}/shop.goroshki.ru_access.log combined
</VirtualHost>

# Активируй
sudo a2ensite shop.goroshki.ru.conf
sudo systemctl reload apache2
```

---

## Шаг 6: Резервные Копии

### Овтоматическая резервная копия

```bash
# Открой crontab
crontab -e

# Дабавь встроенные резервные копии
# 0 3 * * 0 /home/scripts/backup.sh  — во вскресенье в 03:00
```

---

## Шаг 7: Проверка На Продуктивность

### Провери Перед выпускали

```bash
# ✅ Открой goroshki.ru и shop.goroshki.ru
# ✅ Наунбс без Ошибок
# ✅ HTTPS работает со статусом 200
# ✅ Расмет евод по ВАШИМ
# ✅ Основные Пнагины на помещаемости
# ✅ Отправка Тестова Покупки
```

### Проверка Мониторинга

```bash
# Проверь серверности
# CPU/RAM/Disk используемости
top
df -h

# Проверь мясквл
sudo mysql -e "SHOW PROCESSLIST;"

# Основные логи
tail -f /var/log/apache2/error.log
tail -f /var/log/mysql/error.log
```

---

## Шаг 8: CI/CD Автоматизация (Опционально)

### GitHub Actions для автонуска

```yaml
# .github/workflows/deploy.yml
name: Deploy Landing

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to Beget
        run: |
          # Прищти все файлы трюстдон FTP
```

---

## ТроблеШутинг

### Beget Cloud Проблемы

| Ошибка | Режим |
|--------|--------|
| 403 Forbidden | Права файлов (755/644) |
| 500 Server Error | Ошибки PHP |
| Белая страница | Debugging в wp-config.php |

---

**Версия:** 1.0  
**Последнее обновление:** 19 января 2026
