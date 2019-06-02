# Decoupled webapp prototype

🐉 WIP experiment using [CWT](https://github.com/Paulmicha/common-web-tools).

## Usage

```sh
scripts/init.sh && \
  make start
```

Result :

- App : http://localhost
- [Hasura](https://hasura.io/) (GraphQL on Postgres) : http://localhost:8080

<!--
## Stack

- Php 7.3 : [wodby/php](https://github.com/wodby/php)
- PostgreSQL 11 : [wodby/postgres](https://github.com/wodby/postgres)
- [Svelte](https://svelte.dev/) 3
-->

## File structure

```txt
/path/to/my-project/    ← Dev stack dir ($PROJECT_DOCROOT)
  ├── app/              ← The webapp ($APP_DOCROOT = $APP_GIT_WORK_TREE)
  │   ├── src/          ← Application code
  │   └── static/       ← Web server static files dir
  ├── cwt/              ← CWT "core" source files. Update = delete + replace entire folder
  │   ├── ...
  │   ├── extensions/   ← Generic CWT extensions (opt-out : see .cwt_extensions_ignore)
  │   └── ...
  ├── data/             ← [git-ignored] Local instance files (DB, sync, user uploads, etc.)
  │   ├── db
  │   │   └── default/  ← Main database local bind mount
  │   ├── db-dumps
  │   │   ├── ...       ← [optional] Downloaded remote DB dumps
  │   │   └── local/    ← Local DB dumps
  │   └── files         ← Local user file uploads
  ├── scripts/          ← Current project specific scripts
  │   └── cwt/          ← CWT-related project-specific extension, local files and overrides
  │       ├── extend/   ← [optional] Custom project-specific CWT extension
  │       ├── local/    ← [git-ignored] Generated files specific to this local instance
  │       └── override/ ← [optional] Allows to replace virtually any file sourced in CWT scripts
  └── .gitignore
```
