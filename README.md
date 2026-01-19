# Goroshki

## Проект

Интернет-магазин детских вещей для новорожденных.

### Домены

- **goroshki.ru** — основной домен (лендинг)
- **shop.goroshki.ru** — поддомен (магазин)

### Технология

- **goroshki.ru** — статический HTML, CSS, JavaScript (без фреймворков)
- **shop.goroshki.ru** — WordPress + WooCommerce

### Хостинг

- **Провайдер:** Beget.com
- **Регистратор доменов:** Beget.com
- **Лендинг:** облако Beget
- **Магазин:** VPS Beget

## Структура репозитория

```
goroshki/
├── README.md                    # Этот файл
├── .gitignore                   # Git ignore
├── landing/                     # Лендинг (goroshki.ru)
│   ├── index.html
│   ├── css/
│   ├── js/
│   └── images/
├── shop-wordpress/              # Конфигурация WordPress (shop.goroshki.ru)
│   ├── wp-config-example.php
│   └── plugins.txt
└── docs/                        # Документация
    ├── DNS_SETUP.md
    ├── DEPLOYMENT.md
    ├── INFRASTRUCTURE.md
    └── ...
```

## Как начать разработку

```bash
git clone https://github.com/artex131071-andrey/goroshki.git
cd goroshki
```

## Документация

- [DNS_SETUP.md](./docs/DNS_SETUP.md) — настройка DNS
- [DEPLOYMENT.md](./docs/DEPLOYMENT.md) — развёртывание
- [INFRASTRUCTURE.md](./docs/INFRASTRUCTURE.md) — инфраструктура

