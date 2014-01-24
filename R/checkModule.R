checkModule <-
function(x, outputs=NULL) {
    platforms <- sapply(getNodeSet(x, "platform"), xmlValue)
    if (length(platforms)) {
        platformOK <- "R" %in% platforms
        cat("R in platforms\n")
    } else {
        # No platform specified
        platformOK <- TRUE 
        cat("No platform specified\n")
    }
    if (platformOK) {
        inputs <- inputs(x)
        if (length(inputs)) {
            inputOK <- matchIO(outputs, inputs)
        } else {
            # No inputs specified
            inputOK <- TRUE
            cat("No inputs specified\n")
        }
        if (inputOK) {
            modules <- getNodeSet(x, "module")
            if (length(modules)) {
                outputs <- outputs(x)
                all(sapply(modules, checkModule, outputs))
            } else {
                TRUE
            }
        } else {
            FALSE
        }
    } else {
        FALSE
    }
}
