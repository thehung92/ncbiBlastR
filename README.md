
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
res <- blast_api_wrapper(rbcLseq)
# it will run blast on NCBI first
# the program will check if there are no hit. then run blastn next
## extract the table from the response in HTML format with function
df.result <-  extract_table_fromHtml(res)
```

Example input and output data

``` r
library(ncbiBlastR)
# example sequence to submit
data(rbcLseq)
rbcLseq
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               rbcL 
#> "ATGTCACCACAAACAGAGACTAAAGCAAGTGCTGGATTCAAAGCTGGTGTTAAAGATTACAAATTGACTTATTATACTCCTGACTATGAAACCAAAGATACTGATATCTTGGCAGCATTCCGAGTAACTCCGCAACCCGGAGTTCCACCCGAAGAGGCAGGGGCAGCGGTAGCCGCCGAATCTTCCACTGGTACATGGACAACTGTGTGGACTGATGGACTTACCAGTCTTGATCGTTACAAAGGACGCTGCTACCACATCGAGAGCGTTGTTGGGGAGGAAAATCAATATATTGCTTATGTAGCTTATCCTTTAGACCTTTTTGAAGAAGGTTCTGTTACTAACATGTTTACTTCTATTGTGGGTAATGTATTTGGTTTCAAAGCCCTACGAGCTCTACGTCTGGAGGATCTGCGAATTCCTACTGCTTATTCTAAAACTTTCCAAGGCCCGCCTCATGGCATCCAAGTTGAAAGGGATAAATTGAACAAGTATGGTCGTCCCCTATTAGGATGTACCATTAAACCAAAATTGGGATTATCTGCAAAGAACTATGGTAGAGCGGTTTATGAATGTTTGCGCGGTGGACTTGATTTTACCAAGGATGATGAAAACGTGAACTCACAACCATTTATGCGTTGGAGAGACCGTTTCTTATTTTGTGCCGAAGCACTTTATAAAGCGCAGGCCGAAACGGGTGAAATCAAAGGACATTACTTGAATGCTACTGCGGGTACATGTGAAGAAATGATGAAAAGGGCCATATTTGCTAGAGAATTGGGAGCTCCTATCGTAATGCATGACTACTTAACGGGGGGATTCACTGCAAATACTAGCTTGGCTCATTATTGCCGAGACAACGGCCTACTTCTTCACATTCATCGTGCAATGCATGCAGTTATTGATAGACAGAAAAATCATGGTATGCATTTCCGCGTACTAGCTAAAGCATTACGTATGTCCGGTGGCGATCATATTCACGCTGGTACAGTAGTAGGTAAACTGGAAGGAGAACGCGAGATGACTTTAGGTTTTGTTGATTTACTACGCGATGATTTTATTGAAAAAGACCGAAGTCGTGGTATTTTTTTCACTCAAGATTGGGTCTCTATGCCAGGTGTTCTGCCTGTGGCTTCGGGGGGTATTCATGTTTGGCATATGCCTGCTCTAACCGAAATCTTTGGGGATGATTCCGTACTACAGTTCGGCGGAGGAACTTTAGGGCACCCTTGGGGAAATGCACCTGGTGCAGTAGCTAATCGAGTGGCTTTAGAAGCGTGTGTACAAGCTCGTAATGAGGGGCGTGATCTTGCTCGTGAGGGTAATGAAATTATCCGTGAAGCTTGCAAATGGAGTCCTGAACTAGCTGCCGCTTGAGAAGAATCGAAGGAG"
# res <- blast_api_wrapper(rbcLseq)
#  example data to extract table
data(rbcLres)
df.result <- extract_table_fromHtml(rbcLres)
df.result
#> # A tibble: 20 × 8
#>    Description           Max S…¹ Total…² Query…³ E val…⁴ Per. …⁵ Acces…⁶ scien…⁷
#>    <chr>                   <int>   <int> <chr>     <dbl> <chr>   <chr>   <chr>  
#>  1 Clintonia uniflora c…    2571    2571 100%          0 100.00% D28335… Clinto…
#>  2 Clintonia andrewsian…    2545    2545 99%           0 99.71%  AB0568… Clinto…
#>  3 Clintonia borealis r…    2538    2538 100%          0 99.57%  KU3031… Clinto…
#>  4 Clintonia umbellulat…    2534    2534 99%           0 99.57%  AB0568… Clinto…
#>  5 Clintonia borealis c…    2532    2532 99%           0 99.57%  AB0568… Clinto…
#>  6 Clintonia udensis ch…    2521    2521 100%          0 99.35%  MT2611… Clinto…
#>  7 Clintonia udensis ch…    2518    2518 99%           0 99.35%  AB0347… Clinto…
#>  8 Clintonia udensis ch…    2516    2516 100%          0 99.28%  MK6737… Clinto…
#>  9 Clintonia udensis ch…    2516    2516 100%          0 99.28%  NC_057… Clinto…
#> 10 Clintonia borealis c…    2516    2516 98%           0 99.85%  D17372… Clinto…
#> 11 Lilium formosanum pl…    2438    2438 100%          0 98.28%  MT2611… Lilium…
#> 12 Lilium candidum chlo…    2438    2438 100%          0 98.28%  NC_042… Lilium…
#> 13 Lilium formosanum ch…    2438    2438 100%          0 98.28%  NC_042… Lilium…
#> 14 Lilium candidum chlo…    2438    2438 100%          0 98.28%  MK7532… Lilium…
#> 15 Lilium formosanum ch…    2438    2438 100%          0 98.28%  MK7532… Lilium…
#> 16 Lilium brownii chlor…    2438    2438 100%          0 98.28%  KY7482… Lilium…
#> 17 Lilium brownii chlor…    2438    2438 100%          0 98.28%  NC_035… Lilium…
#> 18 Lilium longiflorum c…    2438    2438 100%          0 98.28%  KC9689… Lilium…
#> 19 Lilium brownii chlor…    2438    2438 100%          0 98.28%  MK4932… Lilium…
#> 20 Lilium longiflorum c…    2433    2433 100%          0 98.20%  NC_063… Lilium…
#> # … with abbreviated variable names ¹​`Max Score`, ²​`Total Score`,
#> #   ³​`Query Cover`, ⁴​`E value`, ⁵​`Per. Ident`, ⁶​Accession, ⁷​scientific_name
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
