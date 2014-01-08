

# Read modules
readModule <- function(filename) {
    module <- xmlParse(filename, trim=TRUE)
    module
}

loadModule <- function(x) {
    attrs <- xmlAttrs(x)
    if ("ref" %in% names(attrs)) {
        module <- readModule(attrs["ref"])
        contents <- xmlChildren(xmlRoot(module))
        addChildren(x, kids=contents)
    }
}

readPipeline <- function(filename) {
    pipeline <- xmlParse(filename, trim=TRUE)
    modules <- getNodeSet(pipeline, "//module")
    lapply(modules, loadModule)
    pipeline
}
