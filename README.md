# Decoupled webapp prototype

🐉 WIP experiment using [CWT](https://github.com/Paulmicha/common-web-tools).

Currently used as demo dev stack for [Contenta Sapper (Svelte JS frontend + Drupal backend)](https://github.com/Paulmicha/contenta_sapper).

## Usage

```sh
scripts/init.sh && \
  make start
```

Result (local dev defaults) :

- App (NodeJS / [Sapper](https://sapper.svelte.dev/)) : http://localhost:3000
- Backend (Php / Drupal "[Contenta CMS](http://www.contentacms.org)" distro) : http://localhost
- Adminer (utility: DB UI) : http://localhost:9000
- Mailhog (utility: email catcher) : http://localhost:8025
- [Hasura](https://hasura.io/) (utility: GraphQL UI) : http://localhost:8080

## Prerequisites

Bash version 4+, Docker, docker-compose.

Currently only tested on recent (mid-2019) Debian-based linux distros.

## Common tasks

This section will be progressively completed until the prototype gets "stable" (ish).

### Apply changes made to any dev-stack settings / config

Includes changes to global values, Drupal settings template, stack services...

```sh
scripts/reinit.sh
```

### Update CWT from upstream repo

[CWT](https://github.com/Paulmicha/common-web-tools) is getting closer to stabilization, but it's not there yet. So when fixes are made upstream, upgrading locally can be done using :

```sh
make upgrade-cwt
```

## File structure

```txt
/path/to/my-project/    ← Dev stack dir ($PROJECT_DOCROOT)
  ├── app/              ← The webapp separate Git repo ($APP_GIT_WORK_TREE)
  │   ├── backend/      ← Contenta CMS Drupal distro
  │   │   └── web/      ← Drupal webserver entry point ($APP_DOCROOT)
  │   └── frontend/     ← Sapper (Svelte JS) NodeJS app
  ├── cwt/              ← CWT "core" source files. Update = delete + replace entire folder
  │   ├── ...
  │   ├── extensions/   ← Generic CWT extensions (opt-out : see .cwt_extensions_ignore)
  │   └── ...
  ├── data/             ← [git-ignored] Local instance files (DB, sync, user uploads, etc.)
  │   ├── db/
  │   │   └── default/  ← Main database local bind mount
  │   ├── db-dumps/
  │   │   ├── ...       ← [optional] Downloaded remote DB dumps
  │   │   └── local/    ← Local DB dumps
  │   ├── files/        ← Public file uploads
  │   ├── private/      ← Private file uploads
  │   └── tmp/          ← Temporary files for Drupal
  ├── scripts/          ← Current project specific scripts
  │   └── cwt/          ← CWT-related project-specific extension, local files and overrides
  │       ├── extend/   ← [optional] Custom project-specific CWT extension
  │       ├── local/    ← [git-ignored] Generated files specific to this local instance
  │       └── override/ ← [optional] Allows to replace virtually any file sourced in CWT scripts
  └── .gitignore
```
