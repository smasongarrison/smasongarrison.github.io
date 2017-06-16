# Compile
## Generate Navigation Bar
library(rmarkdown)
library(knitr)
library(plyr)
library(dplyr)
source("generateNavigationBar.R")

## Generate Index Page
source("generateIndexPage.R")

j=25
#c=c+1
#num=c*j+31
#i=0; num=0+i

#num<-as.matrix(read.csv("datalists/num.txt"))[1,1]

#num=num+j+c(1:length(packages))[packages==package]

## Extract Datasets from R
source("datalists/datasets_extract.r")

source("datalists/data_extract_program.r")
index_out$unique<-paste0(index_out$Package,index_out$Item)
write.csv(index_out, file='datalists/datasets_import.csv', row.names=FALSE)
## Render Markdown Files
rmarkdown::render(input="Data.Rmd", output_file="Data.html")
rmarkdown::render(input="Class.Rmd", output_file="Class.html")
#rmarkdown::render(input="AAA.Rmd", output_file="AAA.html")

.rs.restartR()

