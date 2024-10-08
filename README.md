# Deptflu

List of bricks to build Boilerplate code for Deptech's Flutter projects

## Bricks

| Brick name           | Version               | Description                                         |
|----------------------|-----------------------|-----------------------------------------------------|
| [deptflu_feat](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_feat)         | 0.2.1                 | Generate feature's boilerplate code                 |
| [deptflu_model](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_model)        | 0.2.1                 | Generate model and entity boilerplate code                 |
| [deptflu_bloc](https://github.com/rahardien/deptflu/tree/master/bricks/deptflu_bloc)         | 0.2.1                 | Generate BLoC/Cubit boilerplate code (event & state included)                  |

## Getting Started 🚀

To get started, you have to install `mason_cli` first

```shell
dart pub global activate mason_cli
```

or using `homebrew`

```shell
brew tap felangel/mason
brew install mason
```

### Initialization

Run `mason init` to initialize mason in the current project directory. This will generate a `mason.yaml` and allow mason to work with bricks scoped locally within the workspace.

### Install

Head to `mason.yaml`, then add lines to the `bricks` section:

```yaml
# Register bricks which can be consumed via the Mason CLI.
# Run "mason get" to install all registered bricks.
# To learn more, visit https://docs.brickhub.dev.
bricks:
  # Bricks can be imported via version constraint from a registry.
  # Uncomment the following line to import the "hello" brick from BrickHub.
  # hello: 0.1.0+1
  # Bricks can also be imported via remote git url.
  deptflu_feat:
    git:
      url: https://github.com/rahardien/deptflu.git
      path: bricks/deptflu_feat
  deptflu_model:
    git:
      url: https://github.com/rahardien/deptflu.git
      path: bricks/deptflu_model
  deptflu_bloc:
    git:
      url: https://github.com/rahardien/deptflu.git
      path: bricks/deptflu_bloc
```

after that run `mason get` to download bricks from the repository.

Make sure you're under project's root directory. Then run and fill the rest

```shell
mason make BRICKS_NAME 
```

Happy coding! 🥳🎉

## References 📕

- [Official Mason Documentation][2]
- [Code generation with Mason Blog][3]
- [Observable Flutter: Building a Mason brick][6]

[2]: https://docs.brickhub.dev
[3]: https://verygood.ventures/blog/code-generation-with-mason
[6]: https://youtu.be/o8B1EfcUisw
