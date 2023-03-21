# log of usefull command to initialize the packages

## git repos from a new R package project

```shell
# init
echo "# ncbiBlastR" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/thehung92/ncbiBlastR.git
git push -u origin main
# fast sync
git add .
git commit -m "README with flowchart"
git push
```

## devtools, usethis, and testthat function

```R
# the following r code will create a blank file in the R dir
library(devtools)
library(usethis)
library(testthat)
use_testthat() # add testthat to package dependencies
# create MIT license with you as the author # will create a LICENSE file and an .md file
use_mit_license("Hung TT Nguyen")
# create blank file for function
use_r("blast_api_wrapper")
use_r("blast_api_megablast")
use_r("wait_and_check")
use_r("blast_api_blastn")
use_r("extract_table_fromGET")
# create test file for checking the function in separate env
use_test('blast_api_wrapper')
# create dependencies with package you used
usethis::use_package("httr")
usethis::use_package("xml2")
usethis::use_package("stringr")
usethis::use_package("rvest")
usethis::use_package("dplyr")
# import specific function
usethis::use_import_from("janitor", "clean_names")
# create external data with accompanying documentation
usethis::use_data_raw("rbcLseq")
usethis::use_r("data")
# create external data for binary Rdata, data must appear in current env first
usethis::use_data(rbcLres)
# create automatic README file
use_readme_rmd()
## and update the readme file along with the code
devtools::build_readme()
```

