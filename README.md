# 🍀 Goroshki - Интернет-магазин детских товаров

**Статус проекта:** 🚀 На этапе разработки инфраструктуры

Полнофункциональный интернет-магазин детских товаров нового рождения и малышей с двухуровневой архитектурой:
- **Landing Page** (goroshki.ru) — SEO-оптимизированный лендинг на чистом HTML/CSS/JavaScript
- **E-commerce Shop** (shop.goroshki.ru) — WordPress + WooCommerce каталог товаров

---

## 📑 Содержание

- [Обзор проекта](#обзор-проекта)
- [Структура репозитория](#структура-репозитория)
- [Архитектура](#архитектура)
- [Инфраструктура](#инфраструктура)
- [Настройка DNS](#настройка-dns)
- [Деплой](#деплой)
- [Разработка](#разработка)
- [Команда и контакты](#команда-и-контакты)

---

## 🎯 Обзор проекта

### Цель
Создать высокопроизводительный интернет-магазин детских товаров, оптимизированный под SEO с минимальной нагрузкой на сервер.

### Основные характеристики

| Параметр | Значение |
|----------|----------|
| **Основной домен** | goroshki.ru |
| **Домен магазина** | shop.goroshki.ru |
| **Регистратор домена** | Beget.com |
| **Хостинг-провайдер** | Beget.com (облако) |
| **Технолог лендинга** | HTML5 / CSS3 / JavaScript (vanilla) |
| **Технолог магазина** | WordPress + WooCommerce |
| **Версия контроля** | Git (GitHub) |
| **SSL-сертификат** | Let's Encrypt (бесплатный) |

---

## 📁 Структура репозитория

```
goroshki/
│
├── README.md                          # Этот файл
├── INFRASTRUCTURE.md                  # Документация инфраструктуры
├── DNS_SETUP.md                       # Инструкция DNS настройки
├── DEPLOYMENT.md                      # Инструкция деплоя
├── DEVELOPMENT.md                     # Гайд для разработчиков
├── .gitignore                         # Git ignore файл
│
├── landing/                           # SEO-лендинг (goroshki.ru)
│   ├── index.html                     # Главная страница
│   ├── css/
│   │   ├── style.css                  # Основные стили
│   │   └── normalize.css              # Нормализация браузерных стилей
│   ├── js/
│   │   ├── main.js                    # Основная логика
│   │   └── analytics.js               # Yandex.Metrica / Google Analytics
│   ├── images/                        # Изображения товаров (WebP, оптимизированные)
│   ├── icons/                         # SVG иконки
│   ├── fonts/                         # Пользовательские шрифты (опционально)
│   ├── manifest.json                  # PWA манифест (опционально)
│   └── sitemap.xml                    # XML карта сайта для SEO
│
├── shop-wordpress/                    # WordPress конфигурация (shop.goroshki.ru)
│   ├── docker-compose.yml             # Конфигурация для локальной разработки
│   ├── wp-config-example.php          # Пример конфига WordPress
│   └── plugins.txt                    # Список необходимых плагинов
│
├── docs/                              # Дополнительная документация
│   ├── BEGET_SETUP.md                 # Настройка Beget.com
│   ├── SEO_GUIDE.md                   # SEO рекомендации
│   ├── SECURITY.md                    # Безопасность и защита
│   ├── PERFORMANCE.md                 # Оптимизация производительности
│   └── ANALYTICS.md                   # Аналитика и отслеживание
│
└── scripts/                           # Служебные скрипты
    ├── deploy.sh                      # Скрипт деплоя на Beget
    ├── backup.sh                      # Резервная копия
    └── optimize-images.sh             # Оптимизация изображений
```

---

## 🏗️ Архитектура

### Двухуровневая структура

```
┌─────────────────────────────────────────────────────────────┐
│                        Интернет (пользователи)              │
└────────────────────────────┬────────────────────────────────┘
                             │
         ┌───────────────────┴────────────────────┐
         │                                        │
    ┌────▼────────────────┐            ┌────▼────────────────┐
    │   goroshki.ru       │            │ shop.goroshki.ru    │
    │   (ЛЕНДИНГ)         │            │ (МАГАЗИН)           │
    ├─────────────────────┤            ├─────────────────────┤
    │ • HTML              │            │ • WordPress         │
    │ • CSS               │            │ • WooCommerce       │
    │ • Vanilla JS        │            │ • PHP               │
    │ • Быстрая загрузка  │            │ • MySQL             │
    │ • SEO-оптимизирован │            │ • Управление товаром│
    │ • ~50KB (сжато)     │            │ • Корзина/Заказы    │
    └─────────────────────┘            └─────────────────────┘
         (Статический)                   (Динамический)
         Beget Облако                    VPS Beget (Ubuntu)
```

### User Flow (Пользовательский сценарий)

```
1. Пользователь заходит на goroshki.ru
   ↓
2. Видит красивый лендинг с категориями товаров
   ↓
3. Нажимает кнопку "Каталог товаров" или "Купить"
   ↓
4. Переходит на shop.goroshki.ru (WordPress)
   ↓
5. Просматривает полный каталог в WooCommerce
   ↓
6. Добавляет товары в корзину
   ↓
7. Оформляет заказ
```

---

## 🔧 Инфраструктура

### Используемые сервисы

| Сервис | Назначение | Стоимость |
|--------|-----------|----------|
| **Beget.com - Домен** | Регистрация goroshki.ru | ~100 ₽/год |
| **Beget.com - Облако** | Хостинг лендинга (статический) | Включено в тариф |
| **Beget.com - VPS** | Сервер для WordPress | ~7-15 ₽/день (~200-450 ₽/месяц) |
| **Let's Encrypt** | SSL/TLS сертификаты | Бесплатно |
| **GitHub** | Контроль версий и CI/CD | Бесплатно |
| **Yandex.Metrica** | Аналитика | Бесплатно |
| **Google Analytics** | Аналитика | Бесплатно |

### DNS серверы Beget

```
ns1.beget.com
ns2.beget.com
ns1.beget.pro
ns2.beget.pro
```

### Планируемые DNS записи

| Запись | Тип | Значение | Назначение |
|--------|-----|----------|-----------|
| goroshki.ru | A | IP сервера Beget Облако | Главный домен (лендинг) |
| www | A | IP сервера Beget Облако | WWW поддомен |
| shop | A | IP VPS сервера | Магазин WordPress |
| mail | MX | mx.beget.com | Почтовые записи (если нужно) |

---

## 🌐 Настройка DNS

### Шаг 1: В регистраторе домена
1. Перейди в управление доменом goroshki.ru
2. Найди настройки DNS (часто называется "Nameservers" или "NS записи")
3. Установи 4 NS-сервера Beget (см. выше)
4. Сохрани изменения (может занять 24-48 часов)

### Шаг 2: В панели Beget
1. Перейди в **DNS → Управление записями DNS**
2. Выбери домен goroshki.ru
3. Добавь записи (см. таблицу выше)

📖 Подробно: смотри [DNS_SETUP.md](./DNS_SETUP.md)

---

## 🚀 Деплой

### Деплой лендинга (goroshki.ru)

```bash
# 1. Клонируй репозиторий
git clone https://github.com/artex131071-andrey/goroshki.git
cd goroshki/landing

# 2. Загрузи файлы на Beget (через FTP/SFTP)
# Или используй скрипт:
./scripts/deploy.sh landing

# 3. Проверь на goroshki.ru
```

### Деплой магазина (shop.goroshki.ru)

```bash
# 1. Подключись по SSH к VPS
ssh user@your-vps-ip

# 2. Установи WordPress
curl -O https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# 3. Установи WooCommerce плагин
# (через админ-панель WordPress или wp-cli)

# 📖 Подробно: смотри DEPLOYMENT.md
```

📖 Полная инструкция: [DEPLOYMENT.md](./DEPLOYMENT.md)

---

## 💻 Разработка

### Локальная разработка лендинга

```bash
# 1. Установи зависимости (опционально, для сборки)
npm install

# 2. Запусти локальный сервер
npx http-server landing/

# 3. Открой http://localhost:8080
```

### Локальная разработка WordPress

```bash
# Используй Docker Compose
docker-compose -f shop-wordpress/docker-compose.yml up -d

# WordPress будет на http://localhost:8000
# Admin: http://localhost:8000/wp-admin
```

### Git workflow

```bash
# Создай ветку для своей фишки
git checkout -b feature/my-feature

# Делай коммиты
git add .
git commit -m "feat: добавил новый компонент"

# Отправь на GitHub
git push origin feature/my-feature

# Создай Pull Request
```

📖 Подробный гайд: [DEVELOPMENT.md](./DEVELOPMENT.md)

---

## 📊 Мониторинг и аналитика

- **Yandex.Metrica** — основная аналитика для RU аудитории
- **Google Analytics 4** — дополнительная аналитика
- **Beget.com панель** — мониторинг ресурсов VPS и трафика
- **Let's Encrypt** — мониторинг сертификатов (автоматический)

---

## 🔐 Безопасность

- ✅ HTTPS на обоих доменах (Let's Encrypt)
- ✅ Регулярные резервные копии (скрипт backup.sh)
- ✅ Защита от CSRF на формах
- ✅ SQL-инъекции защита (WooCommerce встроенная)
- ✅ XSS защита (WordPress встроенная)

📖 Подробно: [docs/SECURITY.md](./docs/SECURITY.md)

---

## 📞 Команда и контакты

| Роль | Контакт |
|------|---------|
| **Проект-менеджер / Маркетинг** | Андрей (sonyakuz) |
| **Разработка лендинга** | TBD |
| **Разработка WordPress** | TBD |
| **DevOps / Инфраструктура** | TBD |

---

## 📝 Лицензия

Этот проект приватный. Все права защищены.

---

## 🤝 Как внести вклад

1. Сделай fork репозитория
2. Создай ветку (`git checkout -b feature/AmazingFeature`)
3. Коммитай изменения (`git commit -m 'Add some AmazingFeature'`)
4. Отправь в ветку (`git push origin feature/AmazingFeature`)
5. Открой Pull Request

---

## 📚 Дополнительная документация

- 📖 [INFRASTRUCTURE.md](./INFRASTRUCTURE.md) — Полная документация инфраструктуры
- 📖 [DNS_SETUP.md](./DNS_SETUP.md) — Настройка DNS пошагово
- 📖 [DEPLOYMENT.md](./DEPLOYMENT.md) — Инструкции по деплою
- 📖 [DEVELOPMENT.md](./DEVELOPMENT.md) — Гайд для разработчиков
- 📖 [docs/BEGET_SETUP.md](./docs/BEGET_SETUP.md) — Настройка Beget.com
- 📖 [docs/SEO_GUIDE.md](./docs/SEO_GUIDE.md) — SEO оптимизация
- 📖 [docs/PERFORMANCE.md](./docs/PERFORMANCE.md) — Производительность
- 📖 [docs/SECURITY.md](./docs/SECURITY.md) — Безопасность

---

**Последнее обновление:** 19 января 2026 г.  
**Версия:** 1.0.0 (Alpha)

