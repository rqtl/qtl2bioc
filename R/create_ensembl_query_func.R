#' Create a function to query genes
#'
#' Create a function that will query genes from a GenomicRanges object with
#' ensembl gene annotations and return a data frame with gene
#' information for a selected region.
#'
#' @param ensembl Ensembl gene annotations as a GenomicRanges object.
#' @param full_genes_only If TRUE, filter by `type=="gene"`
#'
#' @return Function with three arguments, `chr`, `start`,
#'     and `end`, which returns a data frame with the genes
#'     overlapping that region, with `start` and `end` being
#'     in Mbp. The output should contain at least the columns
#'     `Name`, `chr`, `start`, and `stop`, the
#'     latter two being positions in Mbp.
#'
#' @details Note that this function assumes that the database has
#'     `start` and `end` fields that are in basepairs, but
#'     the selection uses positions in Mbp, and the output data frame
#'     should have `start` and `stop` columns in Mbp.
#'
#' @export
#' @importFrom GenomicRanges seqnames start end
#' @importClassesFrom GenomicRanges GRanges
#'
#' @examples
#' # small version of ensembl data
#' ensembl <- readRDS(system.file("extdata", "ensembl_small.rds", package="qtl2bioc"))
#'
#' # create query function, pulling only full genes
#' query_ensembl <- create_ensembl_query_func(ensembl)
#'
#' # genes on chr 2 overlapping (96.5 - 97.0)
#' genes <- query_ensembl("2", 96.5, 97.0)

create_ensembl_query_func <-
    function(ensembl, full_genes_only=TRUE)
{
    query_func <- function(chr, start, end) {

        # convert input positions from Mbp to basepairs
        start <- round(start * 1e6)
        end <- round(end * 1e6)

        # grab result subset
        selection <- seqnames(ensembl) == chr &
            ((start(ensembl) >= start & start(ensembl) <= end) |
             (end(ensembl) >= start & end(ensembl) <= end) |
             (start(ensembl) <= start & end(ensembl) >= end))

        result <- subset(ensembl, as.logical(selection))

        # convert to data frame
        result <- data.frame(result, stringsAsFactors=FALSE)

        if(full_genes_only)
            result <- result[result$type=="gene", , drop=FALSE]

        # change some names
        oldn <- c("seqnames", "end", "gene_name")
        newn <- c("chr", "stop", "Name")
        m <- match(oldn, colnames(result))
        if(any(is.na(m))) {
            warning('column name "', oldn[is.na(m)], '"not found')
            oldn <- oldn[!is.na(m)]
            newn <- newn[!is.na(m)]
            m <- m[!is.na(m)]
        }
        if(length(m) > 0)
            colnames(result)[m] <- newn

        # bp -> Mbp
        result$start <- result$start / 1e6
        result$stop <- result$stop / 1e6

        # factors -> character
        wh_factor <- sapply(result, is.factor)
        if(any(wh_factor)) {
            for(i in which(wh_factor))
                result[,i] <- as.character(result[,i])
        }

        result
    }

    query_func
}
