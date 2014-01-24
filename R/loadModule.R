loadModule <-
function(x) {
    attrs <- xmlAttrs(x)
    if ("ref" %in% names(attrs)) {
        module <- readModule(attrs["ref"])
        contents <- xmlChildren(xmlRoot(module))
        addChildren(x, kids=contents)
    }
}
