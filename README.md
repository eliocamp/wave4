# Comment on "Global wave number-4 pattern in the southern subtropical sea surface temperature"

This repository contains data, code and other source files associated with 

Clone this repo. If using RStudio, open the project. 

This project uses the renv package to manage a reproducible environment. To recreate that environment just run

```r
if (!require("renv")) {
   install.packages("renv")
}
renv::restore()
```

This should install all the package dependencies needed to install the package and compile the document. 

Then install the package with 

```r
if (!require("devtools")) {
   install.packages("devtools")
}
devtools::install()
```

The data required to run the analysis is downloaded automatically by the functions `HADSST()` and `CMAP()`. If you want to download it before going into the code, then run those functions first. 

```r
wave4::HADSST()
wave4::CMAP()
``` 

The code of the manuscript can be found at [analysis/paper/paper.Rmd](https://github.com/eliocamp/wave4/tree/main/analysis/paper). Render it by opening it up in RStudio and hitting that knitr button or with 

```r
if (!require("devtools")) {
   install.packages("devtools")
}
rmarkdown::render("analysis/paper/paper.Rmd")
```


