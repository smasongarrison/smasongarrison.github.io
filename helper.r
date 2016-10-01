# Compile

## Generate Index Page
source("generateIndexPage.R")

## Generate Navigation Bar
source("generateNavigationBar.R")

## Extract Datasets from R
source("datalists/datasets_extract.r")

## Render Markdown File
rmarkdown::render(input="Data.Rmd", output_file="Data.html")




