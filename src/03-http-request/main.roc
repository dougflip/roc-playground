app "http-requst"
    packages {
        pf: "https://github.com/roc-lang/basic-cli/releases/download/0.7.1/Icc3xJoIixF3hCcfXrDwLCu4wQHtNdPyoJkEbkgIElA.tar.br",
    }
    imports [pf.Stdout, pf.Stderr, pf.Http, pf.Task.{ Task }]
    provides [main] to pf

run : Task {} Error
run =

    # Get time since [Unix Epoch](https://en.wikipedia.org/wiki/Unix_time)
    html <- fetchHtml "https://www.example.com" |> Task.await
    Stdout.line "Your HTML was: \(Inspect.toStr html)"

fetchHtml : Str -> Task Str [FailedToFetchHtml Str]_
fetchHtml = \url ->
    { Http.defaultRequest & url }
    |> Http.send
    |> Task.onErr \err ->
        Task.err (FailedToFetchHtml (Http.errorToString err))

Error : [
    FailedToFetchHtml Str,
]

main : Task {} *
main =
    run
    |> Task.onErr handleErr

handleErr : Error -> Task {} *
handleErr = \err ->
    usage = "roc main.roc -- \"https://www.roc-lang.org\" roc.html"

    errorMsg =
        when err is
            FailedToFetchHtml httpErr -> "Failed to fetch URL \(httpErr), usage: \(usage)"

    Stderr.line "Error: \(errorMsg)"
