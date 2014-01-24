\name{checkModule}
\alias{checkModule}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
checkModule
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
checkModule(x, outputs = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{outputs}{
%%     ~~Describe \code{outputs} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, outputs = NULL) 
{
    platforms <- sapply(getNodeSet(x, "platform"), xmlValue)
    if (length(platforms)) {
        platformOK <- "R" \%in\% platforms
        cat("R in platforms\n")
    }
    else {
        platformOK <- TRUE
        cat("No platform specified\n")
    }
    if (platformOK) {
        inputs <- inputs(x)
        if (length(inputs)) {
            inputOK <- matchIO(outputs, inputs)
        }
        else {
            inputOK <- TRUE
            cat("No inputs specified\n")
        }
        if (inputOK) {
            modules <- getNodeSet(x, "module")
            if (length(modules)) {
                outputs <- outputs(x)
                all(sapply(modules, checkModule, outputs))
            }
            else {
                TRUE
            }
        }
        else {
            FALSE
        }
    }
    else {
        FALSE
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
