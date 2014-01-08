
# Pull various bits out of modules and pipelines

io <- function(parent, type) {
    nodes <- getNodeSet(parent, type)
    formats <- sapply(nodes, xmlValue)
    # Strip leading/trailing white space
    gsub("^[[:space:]]+|[[:space:]]+$", "", formats)
}

inputs <- function(x) {
    io(x, "input")
}

outputs <- function(x) {
    io(x, "output")
}
