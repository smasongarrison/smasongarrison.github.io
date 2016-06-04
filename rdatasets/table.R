## Data
```{r message=FALSE,echo=FALSE}
if (!require("DT")) install.packages('DT')
m = matrix(c(
  '<b>Bold</b>', '<em>Emphasize</em>', '<a href="http://rstudio.com">RStudio</a>',
  '<a href="#" onclick="alert(\'Hello World\');">Hello</a>'
), 2)
colnames(m) = c('<span style="color:red">Data Set</span>', '<em>Description</em>')
datatable(m, escape = FALSE)
```

