
# Execute a pipeline


runModule <- function(x) {
    src <- sapply(getNodeSet(x, "source"), xmlValue)
    cat(paste("R>", src, "\n"))
    if (length(src) > 0) {
        if (length(src) > 1) {
            warning("Only first source evaluated")
        }
        # Everything is shared via special environment
        eval(parse(text=src[[1]]), env=pmvmEnv)
        modules <- getNodeSet(x, "module")
        if (length(modules)) {
            lapply(modules, runModule)
        }
    }
}

runPipeline <- function(x) {
    if (!checkPipeline(x)) {
        stop("Invalid pipeline")
    }
    modules <- getNodeSet(xmlRoot(x), "module")
    invisible(lapply(modules, runModule))
}
