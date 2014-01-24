checkPipeline <-
function(x) {
    modules <- getNodeSet(xmlRoot(x), "module")
    all(sapply(modules, checkModule))
}
