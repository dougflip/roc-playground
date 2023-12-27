# ROC Playground

Local dev env to play with ROC tutorials and do some learning.

## Local development

You can develop locally via Docker.

```sh
./scripts/dev
```

This will start a Bash session inside a development container and the local source code mounted as a volume.

As an example run the following from within the container

```sh
roc dev ./src/01-hello-world/main.roc
```

You can edit code on your local machine and re-run the command above (or any other command).
The intent is to edit code from your local machine and operate on the code from within the container.

When you are done you can exit the container with ctrl + d.
