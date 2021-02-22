# Datasly <img src="assets/img/datasly-logo.svg" align="right" width="120" />

**Author**:  Christos Stylianou

# Overview

Datasly is a light-weight and powerful data visualization tool developed by ClinBAY, which can be [downloaded for free](https://clinbay.com/datasly).
It can be used to view, filter, sort, query data tables in SAS™ (.sas7bdat, .xpt), R (.RData), CSV, Excel formats.

This R package gives ability to R users to open data frames, tibbles and 2D matrice within Datasly with a single R code line:

<img src="/assets/img/OpenDataslyFromR.png" />

# Installation

**RStudio users**
Go to "Tools" and then "Install Packages"
Choose "Install from Package archive file"
Click "Browse"
Select your package file (".zip" for Binary or ".tar.gz" for Source)


**Rgui users**
Type the following command in R Console:
install.packages("C:/pathofsavedzipfolder/Datasly_0.2.0.zip") for Binary
or
install.packages("C:/pathofsavedzipfolder/Datasly_0.2.0.tar.gz") for Source

** Install from GitHub**
First, you need to install the devtools package. You can do this from CRAN. Invoke R and then type
```R
install.packages("devtools")
```

Load the devtools package.
```R
library(devtools)
```

Install from GitHub repository
```R
install_github("ClinBAY/Datasly-R")
```

# Usage
Use the *Datasly* function to open one or several data frames, tibbles and 2D matrice.