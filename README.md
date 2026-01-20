# Goroshki

Интернет-магазин детских вещей для новорожденных.

## Проект

- **goroshki.ru** — основной домен (лендинг)
- **shop.goroshki.ru** — поддомен (магазин)

## Внешнее хранилище файлов

https://disk.360.yandex.ru/client/disk/%D0%9A%D0%BB%D0%B8%D0%B5%D0%BD%D1%82%D1%8B/Goroshki

## Технология

- **goroshki.ru** — HTML, CSS, JavaScript (статический лендинг)
- **shop.goroshki.ru** — WordPress + WooCommerce (интернет-магазин)

## Структура проекта

```
goroshki/
├── config/                      # Конфигурационные файлы
│   ├── nginx/                   # Конфиги Nginx для обоих доменов
│   │   ├── goroshki.ru.conf
│   │   ├── shop.goroshki.ru.conf
│   │   └── common.conf
│   ├── php/                     # Конфиги PHP-FPM
│   │   └── php-fpm.conf
│   ├── mysql/                   # Конфиги MySQL
│   │   └── my.cnf
│   ├── wordpress-plugins.txt    # Список плагинов WordPress
│   └── deploy.sh                # Скрипт деплоя конфигов
│
├── public_html/                 # Статический лендинг (goroshki.ru)
│   ├── index.html
│   ├── css/
│   │   └── style.css
│   └── js/
│       └── main.js
│
├── shop/                        # WordPress магазин (shop.goroshki.ru)
│   ├── wp-config-sample.php     # Шаблон конфига (в Git)
│   ├── wp-config.php            # Локальный конфиг (НЕ в Git)
│   ├── wp-content/
│   │   ├── plugins/             # Плагины (НЕ в Git)
│   │   └── themes/              # Темы (НЕ в Git, кроме кастомных)
│   └── README.md                # Инструкции по установке WordPress
│
├── docs/                        # Документация проекта
│   ├── CHANGELOG.md             # История изменений
│   ├── CONTRIBUTING.md          # Правила разработки
│   ├── vps-analysis.md          # Анализ и план подготовки VPS
│   └── tasks/
│       └── TASK.md              # Текущие задачи
│
├── comands/                     # Полезные команды и инструкции
├── .gitignore                   # Настроен для WordPress
└── README.md                    # Этот файл
```

## Хостинг

- **Провайдер:** Beget.com
- **Лендинг:** облако Beget
- **Магазин:** VPS Beget

## Делегирование DNS 

NS записи делегированы на Beget
ns1.beget.com
ns2.beget.com
ns1.beget.pro
ns2.beget.pro

## Клонируювание

```bash
git clone https://github.com/artex131071-andrey/goroshki.git
cd goroshki
```
## Шаблон

Оразец шаблона сайта https://websitedemos.net/clothing-store-02/?customize=template

## VPS 
доступ на VPS продакшен-сервер Beget:
Подключение: ssh root@194.156.116.135
Внешний IP: 194.156.116.135

## Настройка безопасности

UFW firewall активирован
Открыты порты: 22 (SSH), 80 (HTTP), 443 (HTTPS)

## GitHub интеграция

Создан репозиторий
SSH ключи сгенерированы и добавлены на GitHub
Синхронизация локальная машина ↔ VPS ↔ GitHub работает
