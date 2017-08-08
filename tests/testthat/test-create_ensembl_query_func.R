context("create_ensembl_query_func")

test_that("create_ensembl_query_func works", {

    # get all records
    ensembl <- readRDS(system.file("extdata", "ensembl_small.rds", package="qtl2bioc"))
    qf <- create_ensembl_query_func(ensembl, FALSE)

    expected <- structure(list(chr = c("2", "2", "2", "2", "2", "2", "2", "2", "2"),
                               start = c(96.318169, 96.318169, 96.318216, 96.987018, 96.987018,
                                         96.987018, 96.999624, 96.999624, 96.999624),
                               stop = c(97.631666,  97.631666, 97.630983, 97.083561, 97.083561,
                                        96.987138, 97.000293, 97.000293, 97.000293),
                               width = c(1313498L, 1313498L, 1312768L, 96544L, 96544L, 121L, 670L, 670L, 670L),
                               strand = c("+", "+", "+", "-", "-", "-", "+", "+", "+"),
                               source = c("ensembl_havana", "havana", "havana", "havana", "havana", "havana", "havana", "havana", "havana"),
                               type = c("gene", "transcript", "transcript", "gene", "transcript", "exon", "gene", "transcript", "exon"),
                               score = c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                               phase = c(NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_),
                               gene_id = c("ENSMUSG00000050587", "ENSMUSG00000050587", "ENSMUSG00000050587",
                                           "ENSMUSG00000091061", "ENSMUSG00000091061", "ENSMUSG00000091061",
                                           "ENSMUSG00000091288", "ENSMUSG00000091288", "ENSMUSG00000091288"),
                               gene_version = c("14", "14", "14", "1", "1", "1", "1", "1", "1"),
                               Name = c("Lrrc4c", "Lrrc4c", "Lrrc4c", "4930445B16Rik", "4930445B16Rik", "4930445B16Rik", "Gm17075", "Gm17075", "Gm17075"),
                               gene_source = c("ensembl_havana", "ensembl_havana", "ensembl_havana", "havana", "havana", "havana", "havana", "havana", "havana"),
                               gene_biotype = c("protein_coding", "protein_coding", "protein_coding", "lincRNA", "lincRNA", "lincRNA", "processed_pseudogene",
                                                "processed_pseudogene", "processed_pseudogene"),
                               havana_gene = c("OTTMUSG00000014522", "OTTMUSG00000014522", "OTTMUSG00000014522", "OTTMUSG00000036475",
                                               "OTTMUSG00000036475", "OTTMUSG00000036475", "OTTMUSG00000036477",
                                               "OTTMUSG00000036477", "OTTMUSG00000036477"),
                               havana_gene_version = c("6", "6", "6", "1", "1", "1", "1", "1", "1"),
                               transcript_id = c(NA, "ENSMUST00000135431", "ENSMUST00000162807", NA, "ENSMUST00000170085",
                                                 "ENSMUST00000170085", NA, "ENSMUST00000171924", "ENSMUST00000171924"),
                               transcript_version = c(NA, "7", "8", NA, "1", "1", NA, "1", "1"),
                               transcript_name = c(NA, "Lrrc4c-001", "Lrrc4c-002", NA, "4930445B16Rik-001", "4930445B16Rik-001",
                                                   NA, "Gm17075-001", "Gm17075-001"),
                               transcript_source = c(NA, "havana", "havana", NA, "havana", "havana", NA, "havana", "havana"),
                               transcript_biotype = c(NA, "protein_coding", "protein_coding", NA, "lincRNA", "lincRNA",
                                                      NA, "processed_pseudogene", "processed_pseudogene"),
                               havana_transcript = c(NA, "OTTMUST00000034453", "OTTMUST00000093478", NA, "OTTMUST00000093476",
                                                     "OTTMUST00000093476", NA, "OTTMUST00000093481", "OTTMUST00000093481"),
                               havana_transcript_version = c(NA, "3", "1", NA, "1", "1", NA, "1", "1"),
                               tag = c(NA, "basic", "basic", NA, "basic", "basic", NA, "basic", "basic"),
                               transcript_support_level = c(NA, "1", "1", NA, "1", "1", NA, "NA", "NA"),
                               exon_number = c(NA, NA, NA, NA, NA, "5", NA, NA, "1"),
                               exon_id = c(NA, NA, NA, NA, NA, "ENSMUSE00000882453", NA, NA, "ENSMUSE00000877806"),
                               exon_version = c(NA, NA, NA, NA, NA, "1", NA, NA, "1"),
                               ccds_id = c(NA, "CCDS16460", "CCDS16460", NA, NA, NA, NA, NA, NA),
                               protein_id = c(NA_character_, NA_character_, NA_character_, NA_character_, NA_character_,
                                              NA_character_, NA_character_, NA_character_, NA_character_),
                               protein_version = c(NA_character_, NA_character_, NA_character_, NA_character_, NA_character_,
                                                   NA_character_, NA_character_, NA_character_, NA_character_)),
                          .Names = c("chr", "start", "stop", "width", "strand", "source", "type", "score", "phase", "gene_id", "gene_version",
                                     "Name", "gene_source", "gene_biotype", "havana_gene", "havana_gene_version", "transcript_id",
                                     "transcript_version", "transcript_name", "transcript_source", "transcript_biotype", "havana_transcript",
                                     "havana_transcript_version", "tag", "transcript_support_level", "exon_number", "exon_id", "exon_version",
                                     "ccds_id", "protein_id", "protein_version"),
                          row.names = c(NA,-9L), class = "data.frame")

    expect_equal(qf(2, 96.9, 97.0), expected)

    # only full genes
    qf2 <- create_ensembl_query_func(ensembl, TRUE)
    expected_sub <- expected[c(1,4,7),,drop=FALSE]
    expect_equal(qf2(2, 96.9, 97), expected_sub)

})
