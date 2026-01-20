#!/bin/bash

# Скрипт деплоя конфигурационных файлов на VPS сервер
# Последнее обновление: 2026-01-20
#
# Использование: bash config/deploy.sh

set -e  # Остановка при ошибке

echo "==================================="
echo "Деплой конфигураций на сервер"
echo "==================================="

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Проверка, что скрипт запущен из корня проекта
if [ ! -d "config" ]; then
    echo -e "${RED}Ошибка: запустите скрипт из корня проекта${NC}"
    exit 1
fi

# ============================================================
# 1. Nginx конфигурации
# ============================================================
echo -e "\n${YELLOW}[1/4] Копирование Nginx конфигов...${NC}"

sudo cp config/nginx/goroshki.ru.conf /etc/nginx/sites-available/
sudo cp config/nginx/shop.goroshki.ru.conf /etc/nginx/sites-available/

# Создание симлинков в sites-enabled
sudo ln -sf /etc/nginx/sites-available/goroshki.ru.conf /etc/nginx/sites-enabled/
sudo ln -sf /etc/nginx/sites-available/shop.goroshki.ru.conf /etc/nginx/sites-enabled/

# Отключение default конфига (если нужно)
# sudo rm -f /etc/nginx/sites-enabled/default

echo -e "${GREEN}✓ Nginx конфиги скопированы${NC}"

# Проверка синтаксиса Nginx
echo -e "${YELLOW}Проверка синтаксиса Nginx...${NC}"
sudo nginx -t

# ============================================================
# 2. PHP-FPM конфигурация
# ============================================================
echo -e "\n${YELLOW}[2/4] Копирование PHP-FPM конфига...${NC}"

sudo cp config/php/php-fpm.conf /etc/php/8.3/fpm/pool.d/www-custom.conf

echo -e "${GREEN}✓ PHP-FPM конфиг скопирован${NC}"

# ============================================================
# 3. MySQL конфигурация
# ============================================================
echo -e "\n${YELLOW}[3/4] Копирование MySQL конфига...${NC}"

sudo cp config/mysql/my.cnf /etc/mysql/conf.d/wordpress.cnf

echo -e "${GREEN}✓ MySQL конфиг скопирован${NC}"

# ============================================================
# 4. Перезапуск сервисов
# ============================================================
echo -e "\n${YELLOW}[4/4] Перезапуск сервисов...${NC}"

# Перезапуск Nginx
echo "Перезапуск Nginx..."
sudo systemctl reload nginx
echo -e "${GREEN}✓ Nginx перезапущен${NC}"

# Перезапуск PHP-FPM
echo "Перезапуск PHP-FPM..."
sudo systemctl restart php8.3-fpm
echo -e "${GREEN}✓ PHP-FPM перезапущен${NC}"

# Перезапуск MySQL
echo "Перезапуск MySQL..."
sudo systemctl restart mysql
echo -e "${GREEN}✓ MySQL перезапущен${NC}"

# ============================================================
# Финальная проверка
# ============================================================
echo -e "\n${GREEN}==================================="
echo "Деплой завершён успешно!"
echo "===================================${NC}"

echo -e "\nПроверка статусов:"
systemctl status nginx --no-pager | grep Active
systemctl status php8.3-fpm --no-pager | grep Active
systemctl status mysql --no-pager | grep Active

echo -e "\n${YELLOW}Рекомендуется проверить сайты:${NC}"
echo "- http://goroshki.ru"
echo "- http://shop.goroshki.ru"
