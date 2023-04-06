# Cicada Releases

## Getting started guide

### 0. Dependencies

- Deno -
  [Installation Guide](https://deno.land/manual@v1.32.1/getting_started/installation)
- Docker (at least version 23.0) -
  [Installation Guide](https://docs.docker.com/desktop/)

#### MacOS Quickstart

```bash
brew install deno gh
brew install --cask docker
```

### 1. Download the Cicada CLI

Use this script to download the latest release of Cicada:

```bash
curl -fSsL https://raw.githubusercontent.com/cicadahq/release/main/download.sh | sh
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

### 4. (Optional) Set up autocomplete for .cicada files

Install the Deno extension for VSCode:

```bash
code --install-extension denoland.vscode-deno
```

Add the following to your `.vscode/settings.json`

```json
{
  "deno.enable": true,
  "deno.enablePaths": [".cicada"]
}
```
