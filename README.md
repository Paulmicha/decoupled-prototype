# Decoupled webapp prototype

🐉 WIP experiment using [CWT](https://github.com/Paulmicha/common-web-tools).

Currently used as demo dev stack for [Contenta Sapper (Svelte JS frontend + Drupal backend)](https://github.com/Paulmicha/contenta_sapper).

## Usage

```sh
scripts/init.sh && \
  make start

# First time setup ? -> Run once upon creation of new local instance :
make app-install
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

General presentation & summary of where the relevant settings are coming from :

```txt
/path/to/my-project/          ← Dev stack dir ($PROJECT_DOCROOT)
  ├── app/                    ← The webapp separate Git repo ($APP_GIT_WORK_TREE)
  ├── cwt/                    ← CWT "core" source files
  │   ├── ...
  │   ├── extensions/         ← Generic CWT extensions (opt-out : see .cwt_extensions_ignore)
  │   │   ├── ...
  │   │   ├── docker-compose/ ← Implements principal actions: (re)start, stop, (re)build, etc.
  │   │   ├── drupalwt/
  │   │   │   ├── app/
  │   │   │   │   ├── drupal_settings.8.tpl.php         ← Default Drupal 8 settings template
  │   │   │   │   ├── global.docker-compose.vars.sh     ← Drupal-specific env vars when using docker-compose
  │   │   │   │   ├── global.vars.sh                    ← Default Drupal-specific env vars
  │   │   │   │   └── ...
  │   │   │   └── cwt/
  │   │   │       ├── bootstrap.docker-compose.hook.sh  ← Drupal-specific bash aliases when using docker-compose
  │   │   │       └── ...
  │   │   └── ...
  │   └── ...
  ├── data/                   ← [git-ignored] Local instance files (DB, sync, user uploads, etc.)
  │   ├── db/
  │   │   └── default/        ← Main database local bind mount
  │   ├── db-dumps/
  │   │   ├── ...             ← [optional] Downloaded remote DB dumps
  │   │   └── local/          ← Local DB dumps
  │   ├── files/              ← Public user uploaded files
  │   ├── private/            ← Private file uploads
  │   └── tmp/                ← Temporary files for Drupal
  ├── scripts/
  │   └── cwt/                ← Project-specific local files, extension and overrides
  │       ├── extend/
  │       │   ├── app/
  │       │   │   └── global.vars.sh              ← Project-specific app-related env vars
  │       │   ├── cwt/
  │       │   │   └── bootstrap.hook.sh           ← Project-specific bash aliases
  │       │   ├── remote/
  │       │   │   └── remote_instances.local.yml  ← Remote instances setup (shared for team)
  │       │   └── stack/
  │       │       ├── docker-compose.override.dev.yml       ← Stack services overrides (* dev)
  │       │       ├── docker-compose.override.local.dev.yml ← Stack services overrides (local dev)
  │       │       ├── docker-compose.override.local.yml     ← Stack services overrides (local *)
  │       │       ├── docker-compose.yml                    ← Default project stack services
  │       │       └── global.vars.sh                        ← Project stack env vars
  │       ├── local/          ← [git-ignored] Generated files specific to this local instance
  │       └── override/
  │           └── .cwt_extensions_ignore          ← Opt-out generic CWT extensions
  ├── .env                            ← [git-ignored] Generated local env vars
  ├── docker-compose.override.yml     ← [git-ignored] Generated local stack services overrides
  ├── docker-compose.yml              ← [git-ignored] Generated local stack services setup
  └── .gitignore
```
