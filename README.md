# Cicada Releases

## Getting started guide

### 0. Dependencies

- Deno - [Installation Guide](https://deno.land/manual@v1.32.1/getting_started/installation)
- Docker - [Installation Guide](https://docs.docker.com/desktop/)
- `gh` cli - [Installation Guide](https://github.com/cli/cli#installation)

### 1. Download the CLI

Use this script to download the latest release of Cicada:

```bash
curl -fSsL https://gist.githubusercontent.com/grant0417/25bac5058396b43eabfdb6cb5d63fa44/raw/ | sh
```

### 2. Create the `.cicada` folder

Go to your project and create a `.cicada` folder

```bash
mkdir -p .cicada
```

### 3. Create a new pipeline file

Create a file in `.cicada` called the name of your pipeline `<pipeline>.ts`

Here is a starter pipeline to get started

```ts
import {
  Job,
  Pipeline,
} from "https://raw.githubusercontent.com/cicadahq/cicada/main/lib.ts";

const job = new Job({
  name: "Simple job",
  image: "ubuntu:22.04",
  steps: [
    {
      name: "Print a message",
      run: "echo Hello, world!",
    },
    {
      name: "Run a js function",
      run: () => {
        console.log("Hello from js");
      },
    },
  ],
});

export default new Pipeline([job]);
```

### 4. Run the pipeline

Run `cicada run .cicada/pipeline.ts` to run the pipeline!
