#' DNA sequence for the rbcL gene
#'
#' the Sequence is downloaded as a fasta file from ENA website
#'
#' @format ## `rbclSeq`
#' A string with 1392 characters:
#' \describe{
#'   \item{a sequence of ACTG character}
#'   \item{read from fasta file}
#'   \item{header: ENA|D28335|D28335}
#'   \item{header: 1 Clintonia uniflora chloroplast rbcL gene.}
#' }
#' @source <https://www.ebi.ac.uk/ena/browser/view/D28335>
"rbcLseq"

#' blast result for the rbcL gene sequence
#'
#' the result from blast_api_wrapper function. It is run with megablast method.
#' The object has class "response" from httr::GET function
#'
#' @format ## `rbcLres`
#' an html response that can be parsed with xml2 library
#' \describe{
#'   \item{the goal is to extract table data from this html response}
#'   \item{if the response has no table with data, send error message}
#' }
#' @source <blastn api>
"rbcLres"
