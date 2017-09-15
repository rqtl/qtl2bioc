### R/qtl2bioc

[![Build Status](https://travis-ci.org/rqtl/qtl2bioc.svg?branch=master)](https://travis-ci.org/rqtl/qtl2bioc)

[Karl Broman](http://kbroman.org)

[R/qtl2](http://kbroman.org/qtl2) (aka qtl2) is a reimplementation of
the QTL analysis software [R/qtl](https://rqtl.org), to better handle
high-dimensional data and complex cross designs. It is split into the
multiple packages, including
[qtl2geno](https://github.com/rqtl/qtl2geno) (for calculating genotype
probabilities, imputations, and genetic maps),
[qtl2scan](https://github.com/rqtl/qtl2scan) (for QTL genome scans and
related calculations), and
[qtl2plot](https://github.com/rqtl/qtl2plot) (for data visualization).
A further package, [qtl2convert](https://github.com/rqtl/qtl2convert),
contains functions for converting data among the R/qtl2,
[DOQTL](https://www.bioconductor.org/packages/release/bioc/html/DOQTL.html),
and [R/qtl](https://rqtl.org) formats, for example to convert genotype
probabilities produced by DOQTL to the format needed by qtl2scan, or
to convert qtl2scan results to the format produced by `scanone` in
R/qtl, so that they may be graphed with the R/qtl functions.

The [qtl2db](https://github.com/rqtl/qtl2db) package is for connecting
to genome databases. The present package, [qtl2bioc](https://github.com/rqtl/qtl2bioc),
has related functionality for using
[Bioconductor](https://bioconductor.org) facilities to obtain
the set of mouse genes in a region. While the functions within
[qtl2bioc](https://github.com/rqtl/qtl2bioc) could logically be
included within [qtl2db](https://github.com/rqtl/qtl2db), we've kept
it separate in order to reduce package dependencies for those not
interested in making use of the
[Bioconductor](https://bioconductor.org) features.

---

### Installation

See the [R/qtl2 webpage](http://kbroman.org/qtl2/) for instructions on
installation of the main R/qtl2 packages.

To install the present [qtl2bioc](https://github.com/rqtl/qtl2bioc)
package, you'll first need to install the Bioconductor package
[AnnotationHub](https://bioconductor.org/packages/release/bioc/html/AnnotationHub.html).:

    source("http://bioconductor.org/biocLite.R")
    biocLite(c("GenomicRanges", "AnnotationHub"))

Next install [devtools](https://github.com/hadley/devtools):

    install.packages("devtools")

Finally, install [R/qtl2bioc] using `devtools::install_github()`.

    library(devtools)
    install_github("rqtl/qtl2bioc")

---

### Usage

The [R/qtl2bioc](https://github.com/rqtl/qtl2bioc) package contains two
key functions, `grab_ensembl()`, for downloading the
[Ensembl](http://ensembl.org) gene annotations, and
`create_ensembl_query_func()`, for creating a query function to
grab gene records for a given region.

---

#### License

[Licensed](License.md) under [GPL-3](https://www.r-project.org/Licenses/GPL-3).
