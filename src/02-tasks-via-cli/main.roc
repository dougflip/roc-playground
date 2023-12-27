app "cli-tutorial"
    packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.7.1/Icc3xJoIixF3hCcfXrDwLCu4wQHtNdPyoJkEbkgIElA.tar.br" }
    imports [pf.Stdout, pf.Stdin, pf.Task.{ await }]
    provides [main] to pf

main =
    _ <- await (Stdout.line "Type something press Enter:")
    input <- await Stdin.line

    Stdout.line "Your input was: \(Inspect.toStr input)"
