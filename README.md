## MonoRepo Demo

A MonoRepo approach for a Laravel & Vue App with shared translations among
the Laravel and Vue app.

### Installation

Install the Laravel dependencies:

```bash
cd api && composer install
```

Install the Vue dependencies:

```bash
cd app && npm install
```

### Splitting into subtree

To split into each of the subtree repos:

```bash
./bin/split.sh
```

This is done to update subtree repos to the current Commit history.
This can be done on a CI server such as Jenkins.

### Working with Translations

We use VueI18n for generating translation files from the
Laravel App and consume it on the Vue app.

Symlink the Laravel ```resources/lang``` folder to the Vue app
```src/locales``` folder:

```bash
ln -s $(pwd)/api/resources/lang/ $(pwd)/app/src/locales
```

After adding new translations just use the following command to regenerate
translations for the Vue App.

```bash
cd api && php artisan vue-i18n:generate --format=umd
```
