### R/qtl2bioc

[![Build Status](https://travis-ci.org/rqtl/qtl2bioc.svg?branch=master)](https://travis-ci.org/rqtl/qtl2bioc)

[Karl Broman](http://kbroman.org)

[qtl2bioc](https://github.com/rqtl/qtl2bioc) is part of [R/qtl2](http://kbroman.org/qtl2).
It is related to the [qtl2db](https://github.com/rqtl/qtl2db) package
but uses
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
