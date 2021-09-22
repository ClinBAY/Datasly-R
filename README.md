# Datasly R package <img src="assets/img/datasly-logo.svg" align="right" width="120" />

**Author**:  [Christos Stylianou](https://www.linkedin.com/in/christos-stylianou-9b94b226/)

# Overview

Datasly is a light-weight and powerful data visualization tool developed by ClinBAY, which can be [downloaded for free](https://clinbay.com/datasly).
It can be used to view, filter, sort, query data tables in SAS™ (.sas7bdat, .xpt), R (.RData), CSV, Excel formats.

This R package gives ability to R users to open data frames, tibbles and 2D matrice within Datasly with a single R code line:

<img src="/assets/img/OpenDataslyFromR.png" />

# Installation

**Note about Datasly software installation**

The datasly software will be installed automatically by the R package when using it, if it is not yet installed.
You can also install manually the Datasly free software from the ClinBAY website: <a href="https://clinbay.com/datasly">https://clinbay.com/datasly</a>.
Once installed, the software binaries will be executed from R.
Datasly is only intented to work on Microsoft Windows operating system.

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

**Install from GitHub**

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

```R
library(Datasly)
data(mtcars)
data(BOD)
Datasly(mtcars,BOD)
```

# How it works?

When executing the *Datasly* function to open data from R, the data is saved into a temporary folder as a .RData file, and Datasly is executed in batch mode to open it.

# Main changes history

**v0.1.0 (7-Sep-2020)**
- First version of the package

**v0.2.0 (25-Jan-2021)**
- Bug fixes and improved setup functionality

**v1.0.1 (1-Feb-2021)**
- Uses the new native support from Datasly for RData files.
- Allows the viewing of tibble and matrices in addition to the already available data.frames of the previous version
- Enables to open multiple data from memory into a single Datasly session with only one call

# Contact

Feel free to contact us at github@clinbay.com or via the Discussion GitHub panel!

ClinBAY is a [Biometrics CRO expert in Statistics](https://www.clinbay.com).