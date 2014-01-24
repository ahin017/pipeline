\name{matchIO}
\alias{matchIO}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
matchIO
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
matchIO(outputs, inputs)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{outputs}{
%%     ~~Describe \code{outputs} here~~
}
  \item{inputs}{
%%     ~~Describe \code{inputs} here~~
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
function (outputs, inputs) 
{
    cat(paste("Supplied:", paste(outputs, collapse = ", "), "\n"))
    cat(paste("Required:", paste(inputs, collapse = ", "), "\n"))
    result <- all(inputs \%in\% outputs)
    if (result) {
        cat("Inputs satisfied\n")
    }
    else {
        cat("Inputs NOT satisfied\n")
    }
    result
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
