library(XML)
source("common.R")
source("read.R")
source("extract.R")
source("check.R")
source("run.R")

m1 <- readModule("module-1.xml")
checkModule(xmlRoot(m1))
m2 <- readModule("module-2.xml")
checkModule(xmlRoot(m2))

p <- readPipeline("pipeline.xml")
checkPipeline(p)
runPipeline(p)

m3 <- readModule("module-3.xml")
checkModule(xmlRoot(m3))
m4 <- readModule("module-4.xml")
checkModule(xmlRoot(m4))

p2 <- readPipeline("pipeline-2.xml")
checkPipeline(p2)
runPipeline(p2)
