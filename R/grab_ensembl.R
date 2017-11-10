#' Grab ensembl gene annotations
#'
#' Grab ensembl gene annotations from the Bioconductor AnnotationHub.
#'
#' @md
#'
#' @param organism Character string with name of organism
#' @param set Character string with name of dataset
#'
#' @return A GenomicRanges object with the gene annotation information.
#'
#' @export
#' @importFrom AnnotationHub AnnotationHub query
#'
#' @examples
#' \dontrun{
#' ensembl <- grab_ensembl()
#' }

grab_ensembl <-
    function(organism="mus musculus", set="AH51040")
{
    hub <- AnnotationHub::AnnotationHub()
    hub <- AnnotationHub::query(hub, c(organism, "ensembl", "gtf"))
    hub[[set]]
}
