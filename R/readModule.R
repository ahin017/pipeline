readModule <-
function(filename) {
    module <- xmlParse(filename, trim=TRUE)
    module
}
