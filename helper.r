# Compile

## Generate Index Page
source("generateIndexPage.R")

## Generate Navigation Bar
source("generateNavigationBar.R")
c=6
j=25
c=c+1
num=c*j+15+j
## Extract Datasets from R
source("datalists/datasets_extract.r")

## Render Markdown Files
rmarkdown::render(input="Data.Rmd", output_file="Data.html")

rmarkdown::render(input="AAA.Rmd", output_file="AAA.html")

.rs.restartR()

