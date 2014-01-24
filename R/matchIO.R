matchIO <-
function(outputs, inputs) {
    cat(paste("Supplied:", paste(outputs, collapse=", "), "\n"))
    cat(paste("Required:", paste(inputs, collapse=", "), "\n"))
    result <- all(inputs %in% outputs)
    if (result) {
        cat("Inputs satisfied\n")
    } else {
        cat("Inputs NOT satisfied\n")
    }
    result
}
