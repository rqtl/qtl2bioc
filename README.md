### R/qtl2bioc

[![R-CMD-check](https://github.com/rqtl/qtl2bioc/workflows/R-CMD-check/badge.svg)](https://github.com/rqtl/qtl2bioc/actions)

[Karl Broman](https://kbroman.org)

[qtl2bioc](https://github.com/rqtl/qtl2bioc) is part of [R/qtl2](https://kbroman.org/qtl2).
It uses
[Bioconductor](https://bioconductor.org) facilities to obtain
the set of mouse genes in a region. While the functions within
[qtl2bioc](https://github.com/rqtl/qtl2bioc) could logically be
included within [qtl2](https://github.com/rqtl/qtl2), we've kept
it separate in order to reduce package dependencies for those not
interested in making use of the
[Bioconductor](https://bioconductor.org) features.

---

### Installation

To install [qtl2bioc](https://github.com/rqtl/qtl2bioc), first install
the Bioconductor packages
[GenomicRanges](https://bioconductor.org/packages/release/bioc/html/GenomicRanges.html) and
[AnnotationHub](https://bioconductor.org/packages/release/bioc/html/AnnotationHub.html):

    install.packages("BiocManager")
    BiocManager::install(c("GenomicRanges", "AnnotationHub"))

Next, install the [remotes package](https://remotes.r-lib.org):

    install.packages("remotes")

Finally, install the R/qtl2bioc package from its
[Github repository](https://github.com/rqtl/qtl2bioc).

    remotes::install_github("rqtl/qtl2bioc")

---

### Usage

The [R/qtl2bioc](https://github.com/rqtl/qtl2bioc) package contains two
key functions, `grab_ensembl()`, for downloading the
[Ensembl](https://ensembl.org) gene annotations, and
`create_ensembl_query_func()`, for creating a query function to
grab gene records for a given region.

---

#### License

[Licensed](LICENSE.md) under [GPL-3](https://www.r-project.org/Licenses/GPL-3).
