app "hello"
    packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.7.1/Icc3xJoIixF3hCcfXrDwLCu4wQHtNdPyoJkEbkgIElA.tar.br" }
    imports [pf.Stdout]
    provides [main] to pf

# passing a record with shorthand - very nice
total = addAndStringify { birds: 3, iguanas: 2 }

main =
    Stdout.line "There are \(total) animals."

addAndStringify = \{ birds, iguanas } ->
    Num.toStr (birds + iguanas)

expect
    funcOut = addAndStringify { birds: 1, iguanas: 2 }
    funcOut == "3"
