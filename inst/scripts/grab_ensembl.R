# script to grab a portion of the ensembl gene annotation data

library(AnnotationHub)
hub <- AnnotationHub()
hub <- query(hub, c("mus musculus", "ensembl", "gtf"))
ensembl <- hub[["AH51040"]]


# subset to 2 small regions
ensembl_small <- subset(ensembl, (seqnames(ensembl)=="2" &
                                  ((start(ensembl) >= 96500000 & start(ensembl) <= 98500000) |
                                   (end(ensembl) >=   96500000 & end(ensembl) <=  98500000) |
                                   (start(ensembl) <=  98500000 & end(ensembl) >=  96500000))) |
                                 (seqnames(ensembl)=="3" &
                                  ((start(ensembl) >= 14000000 & start(ensembl) <= 16000000) |
                                   (end(ensembl) >=   14000000 & end(ensembl) <=  16000000) |
                                   (start(ensembl) <=  16000000 & end(ensembl) >=  14000000))))

# save as RDS file
saveRDS(ensembl_small, "../extdata/ensembl_small.rds")
