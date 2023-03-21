## code to prepare `rbcLseq` dataset goes here

# file = system.file('extdata', package='ncbiBlastR') |> list.files(full.names=TRUE)
file = "rbcL.fasta"
lines = readLines(file)
lines = lines[-1]
rbcLseq = paste(lines, collapse = "")
names(rbcLseq) = "rbcL"
usethis::use_data(rbcLseq, overwrite = TRUE)
