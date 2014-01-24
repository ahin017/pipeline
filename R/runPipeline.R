runPipeline <-
function(x) {
    if (!checkPipeline(x)) {
        stop("Invalid pipeline")
    }
    modules <- getNodeSet(xmlRoot(x), "module")
    invisible(lapply(modules, runModule))
}
