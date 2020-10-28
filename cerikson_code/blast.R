library(Biostrings)  # import biostrings functions into current environment
library(dplyr)       # import dplyr functions into current environment

nbhd <- readAAStringSet("data/plass/query_nbhd_plass.cdhit.fa") # import the plass nbhd
nbhd_aas <- length(nbhd)                                # get number of AAs in nbhd
blast <- read.table("data/blast/query_nbhd_blast.tab")             # import blast results
query_aas <- length(readAAStringSet("data/protien/GCA_001508995.1_ASM150899v1_protein.faa"))

blast_100 <- filter(blast, V3 == 100)    # retain only AAs that were 100%
aas_100 <- length(unique(blast_100$V2))  # count num aas 100% contained

aas_100/nbhd_aas # calculate the percent of AAs from the nbhd that were in the query
aas_100/query_aas # calculate the percent of query that was in the nbhd
