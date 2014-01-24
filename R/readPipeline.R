readPipeline <-
function(filename) {
    pipeline <- xmlParse(filename, trim=TRUE)
    modules <- getNodeSet(pipeline, "//module")
    lapply(modules, loadModule)
    pipeline
}
