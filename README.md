# Goroshki

Интернет-магазин детских вещей для новорожденных.

## Проект

- **goroshki.ru** — основной домен (лендинг)
- **shop.goroshki.ru** — поддомен (магазин)

## Внешнее хранилище файлов

https://disk.360.yandex.ru/client/disk/%D0%9A%D0%BB%D0%B8%D0%B5%D0%BD%D1%82%D1%8B/Goroshki

## Технология

- **goroshki.ru** — HTML, CSS, JavaScript
- **shop.goroshki.ru** — WordPress + WooCommerce

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
