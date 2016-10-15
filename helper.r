# Compile

## Generate Index Page
source("generateIndexPage.R")

## Generate Navigation Bar
source("generateNavigationBar.R")
j=50
#c=c+1
#num=c*j+31
#i=0; num=0+i




num=num+j+c(1:length(packages))[packages==package]
## Extract Datasets from R
source("datalists/datasets_extract.r")
index_out$unique<-paste0(index_out$Package,index_out$Item)
write.csv(index_out, file='datalists/datasets_import.csv', row.names=FALSE)
## Render Markdown Files
rmarkdown::render(input="Data.Rmd", output_file="Data.html")

rmarkdown::render(input="AAA.Rmd", output_file="AAA.html")

.rs.restartR()

