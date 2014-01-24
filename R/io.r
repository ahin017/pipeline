io <- function(parent, type) {
    nodes <- getNodeSet(parent, type)
    formats <- sapply(nodes, xmlValue)
    # Strip leading/trailing white space
    gsub("^[[:space:]]+|[[:space:]]+$", "", formats)
}