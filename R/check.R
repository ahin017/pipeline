

# Check that the modules in a pipeline are compatible
# with this glue system and with each other

matchIO <- function(outputs, inputs) {
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

checkModule <- function(x, outputs=NULL) {
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

checkPipeline <- function(x) {
    modules <- getNodeSet(xmlRoot(x), "module")
    all(sapply(modules, checkModule))
}
