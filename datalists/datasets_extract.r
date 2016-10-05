### Datasets in R
if (!require("DT")) install.packages('DT')
if (!require("plyr")) install.packages('plyr')
if (!require("R2HTML")) install.packages('R2HTML')


### Download cranlog, which gives list of datasets
#download.file("http://cran-logs.rstudio.com/2016/2016-10-01.csv.gz","2016-10-01.csv.gz")
#cranlog <- read.csv("2016-10-01.csv.gz", stringsAsFactors=FALSE)
#packages<-unique(cranlog$package[cranlog$r_version=="3.3.1"])
#write.csv(packages,"allpackages_2016-10-01.csv")

packages<-read.csv("allpackages_2016-10-01.csv", stringsAsFactors=FALSE)[num:(num+j),2]


#########################################
unload_Namespaces<- function(try=1,loadedOnly=TRUE,otherPkgs=TRUE){
  ns<-NULL
  if(loadedOnly){
  ns <-  c(ns,names(sessionInfo()$loadedOnly))}
  if(otherPkgs){
      ns <-  c(ns,names(sessionInfo()$otherPkgs))
  }
  for(i in 1:try){
    for (name in ns) {
      try(unloadNamespace(name), silent=TRUE)
    }
  }
}

is.even <- function(x) x %% 2 == 0;is.odd <- function(x) x %% 2 != 0;is.10 <- function(x) x %% 10 == 0; is.25 <- function(x) x %% 25 == 0
detach_package <- function(pkg, character.only = FALSE)
{
  if(!character.only)
  {
    pkg <- deparse(substitute(pkg))
  }
  search_item <- paste("package", pkg, sep = ":")
  while(search_item %in% search())
  {
    detach(search_item, unload = TRUE, character.only = TRUE)
  }
}

unloadNamespaces <- function(ns, ...) {
while (length(ns) > 0) {
ns0 <- loadedNamespaces()
for (name in ns) {
try(unloadNamespace(name), silent=TRUE)
}
ns1 <- loadedNamespaces()
## No namespace was unloaded?
if (identical(ns1, ns0)) break
ns <- intersect(ns, ns1)
}
if (length(ns) > 0) warning("Failed to unload namespace: ",
paste(sQuote(ns), collapse=", "))
} # unloadNamespaces()


  # Installed only packages that are not pre-installed.
  # Credits: http://stackoverflow.com/a/9345167/756986
  new.packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages, repos="http://cran.rstudio.com")
  index = data(package=packages)$results[,c(1,3,4)]
  index = data.frame(index, stringsAsFactors=FALSE)
  index_out = NULL
  index<-arrange(index,Package,Item)
  # Load packages which store datasets
  # and then Save datasets
  for (i in 1:nrow(index)) {

    library(index$Package[i], character.only=TRUE)
    dataset = index$Item[i]
    package = index$Package[i]
    # Load data in new environment (very hackish)
    e = new.env(hash = TRUE, parent = parent.frame(), size = 29L)
    cmd = paste('data(', dataset, ', envir=e)', sep='')
    eval(parse(text=cmd))
    d = e[[dataset]]
    if(class(d) %in% c('data.frame', 'matrix', 'numeric', 'table', 'ts')){
      cat("Processing data set: ", dataset, "\n")
      if(class(d)=='ts'){
        d = data.frame(time(d), d)
        colnames(d) = c('time', dataset)
      }
      try(dir.create(paste('datalists/csv/', package, sep='')))
      try(dir.create(paste('datalists/doc/', package, sep='')))
      dest_csv = paste('datalists/csv/', package, '/', dataset, '.csv', sep='')
      dest_doc = paste('datalists/doc/', package, '/', dataset, '.html', sep='')
      # Save data as CSV
      write.csv(d, dest_csv)
      # Save documentation as HTML
      help.ref = help(eval(dataset), package=eval(package))
      help.file = utils:::.getHelpFile(help.ref)
      tools::Rd2HTML(help.file, out=dest_doc)
      # Add entry to index out
      index_out = rbind(index_out, index[i,])
    }
    detach_package(index$Package[i],character.only = TRUE)
    if(is.10(i)){
      try(unload_Namespaces(try=2,loadedOnly=FALSE))
    }
    closeAllConnections()
  }
  index_out$unique<-paste0(index_out$Package,index_out$Item)
  write.csv(index_out, file='datalists/datasets_import.csv', row.names=FALSE)
