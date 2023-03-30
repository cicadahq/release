# Cicada Releases

## Getting started guide

### 0. Dependencies

- Deno -
  [Installation Guide](https://deno.land/manual@v1.32.1/getting_started/installation)
- Docker (at least version 23.0) -
  [Installation Guide](https://docs.docker.com/desktop/)
- `gh` cli - [Installation Guide](https://github.com/cli/cli#installation)

#### MacOS Quickstart

```bash
brew install deno gh
brew install --cask docker

gh auth login -w
```

### 1. Download the Cicada CLI

Use this script to download the latest release of Cicada:

```bash
curl -fSsL https://gist.githubusercontent.com/grant0417/25bac5058396b43eabfdb6cb5d63fa44/raw/ | sh
```

### 2. Create a pipeline

Go to the project you want to make a pipeline for and run:

```bash
cicada init <pipeline-name>
```

### 3. Run the pipeline

```bash
cicada run .cicada/<pipeline-name>.ts
```
