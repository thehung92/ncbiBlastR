
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ncbiBlastR

<!-- badges: start -->
<!-- badges: end -->

The goal of ncbiBlastR is to submit the sequence to NCBI blast and
extract the table from the response in HTML format.

## Installation

You can install the development version of ncbiBlastR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thehung92/ncbiBlastR")
```

## Submit a sequence for NCBI blast

``` r
library(ncbiBlastR)
## the blast_api_wrapper
res = blast_api_wrapper(rbcLseq)
# it will run blast on NCBI first
# the program will check if there are no hit. then run blastn next
## extract the table from the response in HTML format with function
df.result <-  extract_table_fromHtml(res)
df.result
```

Example input and output data

``` r
library(ncbiBlastR)
# example sequence to submit
data(rbcLseq)
res <- blast_api_wrapper(rbcLseq)
#> Submit blastn megablast
#> Wait for it ... (30s) ...
#  example data to extract table
df.result <- extract_table_fromHtml(rbcLres)
```

## Current structure of the library

``` mermaid
flowchart TD
  input["input:<br>string of DNA_BASES"] --> F1
  %%
  subgraph F1 ["blast_api_wrapper"]
    direction LR
    f2("Start:<br>blast_api_megablast")
    f2 --> f3{{"wait_and_check<br>There are hits?"}}
    f3 -->|"yes"|output["End:<br>response<br>html format"]
    f3 -->|"no"|f4("blast_api_blastn")
    f4 --> f5{{"wait_and_check<br>ThereAreHits?"}}
    f5 -->|"yes"|output
    f5 -->|"no"|error("End:<br>message NoHit")
  end
  %%
  F1 -->|html format|f6("extract_table_fromGET")
  f6 --> return[output:<br>data frame]

  %%
  %%
  %%
  %%
  %%
```
