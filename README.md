
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ncbiBlastR

<!-- badges: start -->
<!-- badges: end -->

The goal of ncbiBlastR is to …

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
res |>
  extract_table_fromGET()
```

Example input and output data

``` r
library(ncbiBlastR)
# sequence to submit
rbcLseq
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               rbcL 
#> "ATGTCACCACAAACAGAGACTAAAGCAAGTGCTGGATTCAAAGCTGGTGTTAAAGATTACAAATTGACTTATTATACTCCTGACTATGAAACCAAAGATACTGATATCTTGGCAGCATTCCGAGTAACTCCGCAACCCGGAGTTCCACCCGAAGAGGCAGGGGCAGCGGTAGCCGCCGAATCTTCCACTGGTACATGGACAACTGTGTGGACTGATGGACTTACCAGTCTTGATCGTTACAAAGGACGCTGCTACCACATCGAGAGCGTTGTTGGGGAGGAAAATCAATATATTGCTTATGTAGCTTATCCTTTAGACCTTTTTGAAGAAGGTTCTGTTACTAACATGTTTACTTCTATTGTGGGTAATGTATTTGGTTTCAAAGCCCTACGAGCTCTACGTCTGGAGGATCTGCGAATTCCTACTGCTTATTCTAAAACTTTCCAAGGCCCGCCTCATGGCATCCAAGTTGAAAGGGATAAATTGAACAAGTATGGTCGTCCCCTATTAGGATGTACCATTAAACCAAAATTGGGATTATCTGCAAAGAACTATGGTAGAGCGGTTTATGAATGTTTGCGCGGTGGACTTGATTTTACCAAGGATGATGAAAACGTGAACTCACAACCATTTATGCGTTGGAGAGACCGTTTCTTATTTTGTGCCGAAGCACTTTATAAAGCGCAGGCCGAAACGGGTGAAATCAAAGGACATTACTTGAATGCTACTGCGGGTACATGTGAAGAAATGATGAAAAGGGCCATATTTGCTAGAGAATTGGGAGCTCCTATCGTAATGCATGACTACTTAACGGGGGGATTCACTGCAAATACTAGCTTGGCTCATTATTGCCGAGACAACGGCCTACTTCTTCACATTCATCGTGCAATGCATGCAGTTATTGATAGACAGAAAAATCATGGTATGCATTTCCGCGTACTAGCTAAAGCATTACGTATGTCCGGTGGCGATCATATTCACGCTGGTACAGTAGTAGGTAAACTGGAAGGAGAACGCGAGATGACTTTAGGTTTTGTTGATTTACTACGCGATGATTTTATTGAAAAAGACCGAAGTCGTGGTATTTTTTTCACTCAAGATTGGGTCTCTATGCCAGGTGTTCTGCCTGTGGCTTCGGGGGGTATTCATGTTTGGCATATGCCTGCTCTAACCGAAATCTTTGGGGATGATTCCGTACTACAGTTCGGCGGAGGAACTTTAGGGCACCCTTGGGGAAATGCACCTGGTGCAGTAGCTAATCGAGTGGCTTTAGAAGCGTGTGTACAAGCTCGTAATGAGGGGCGTGATCTTGCTCGTGAGGGTAATGAAATTATCCGTGAAGCTTGCAAATGGAGTCCTGAACTAGCTGCCGCTTGAGAAGAATCGAAGGAG"
# table from request
rbcLres |>
  extract_table_fromGET()
#> # A tibble: 20 × 8
#>    description           max_s…¹ total…² query…³ e_value per_i…⁴ acces…⁵ scien…⁶
#>    <chr>                   <int>   <int> <chr>     <dbl> <chr>   <chr>   <list> 
#>  1 Clintonia uniflora c…    2571    2571 100%          0 100.00% D28335… <chr>  
#>  2 Clintonia andrewsian…    2545    2545 99%           0 99.71%  AB0568… <chr>  
#>  3 Clintonia borealis r…    2538    2538 100%          0 99.57%  KU3031… <chr>  
#>  4 Clintonia umbellulat…    2534    2534 99%           0 99.57%  AB0568… <chr>  
#>  5 Clintonia borealis c…    2532    2532 99%           0 99.57%  AB0568… <chr>  
#>  6 Clintonia udensis ch…    2521    2521 100%          0 99.35%  MT2611… <chr>  
#>  7 Clintonia udensis ch…    2518    2518 99%           0 99.35%  AB0347… <chr>  
#>  8 Clintonia udensis ch…    2516    2516 100%          0 99.28%  MK6737… <chr>  
#>  9 Clintonia udensis ch…    2516    2516 100%          0 99.28%  NC_057… <chr>  
#> 10 Clintonia borealis c…    2516    2516 98%           0 99.85%  D17372… <chr>  
#> 11 Lilium formosanum pl…    2438    2438 100%          0 98.28%  MT2611… <chr>  
#> 12 Lilium candidum chlo…    2438    2438 100%          0 98.28%  NC_042… <chr>  
#> 13 Lilium formosanum ch…    2438    2438 100%          0 98.28%  NC_042… <chr>  
#> 14 Lilium candidum chlo…    2438    2438 100%          0 98.28%  MK7532… <chr>  
#> 15 Lilium formosanum ch…    2438    2438 100%          0 98.28%  MK7532… <chr>  
#> 16 Lilium brownii chlor…    2438    2438 100%          0 98.28%  KY7482… <chr>  
#> 17 Lilium brownii chlor…    2438    2438 100%          0 98.28%  NC_035… <chr>  
#> 18 Lilium longiflorum c…    2438    2438 100%          0 98.28%  KC9689… <chr>  
#> 19 Lilium brownii chlor…    2438    2438 100%          0 98.28%  MK4932… <chr>  
#> 20 Lilium longiflorum c…    2433    2433 100%          0 98.20%  NC_063… <chr>  
#> # … with abbreviated variable names ¹​max_score, ²​total_score, ³​query_cover,
#> #   ⁴​per_ident, ⁵​accession, ⁶​scientific_name
```

## current structure of the library

``` mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
