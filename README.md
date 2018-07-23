### R/qtl2bioc

[![Build Status](https://travis-ci.org/rqtl/qtl2bioc.svg?branch=master)](https://travis-ci.org/rqtl/qtl2bioc)

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

Make sure you have the latest version of [R](https://cran.r-project.org),
and see the [R/qtl2 webpage](https://kbroman.org/qtl2/) for instructions on
installation of the main R/qtl2 package.

To install the present [qtl2bioc](https://github.com/rqtl/qtl2bioc)
package, you'll first need to install the Bioconductor packages
[GenomicRanges](https://bioconductor.org/packages/release/bioc/html/GenomicRanges.html) and
[AnnotationHub](https://bioconductor.org/packages/release/bioc/html/AnnotationHub.html):

    source("https://bioconductor.org/biocLite.R")
    biocLite(c("GenomicRanges", "AnnotationHub"))

Then, install R/qtl2bioc from the mini-CRAN at
[rqtl.org](http://rqtl.org):

    install.packages("qtl2bioc", repos="http://rqtl.org/qtl2cran")

Alternatively, install [devtools](https://github.com/hadley/devtools)
and then install the source R/qtl2bioc package from its
[Github repository](https://github.com/rqtl/qtl2bioc) using `devtools::install_github()`.

    install.packages("devtools")
    devtools::install_github("rqtl/qtl2bioc")

---

### Usage

The [R/qtl2bioc](https://github.com/rqtl/qtl2bioc) package contains two
key functions, `grab_ensembl()`, for downloading the
[Ensembl](http://ensembl.org) gene annotations, and
`create_ensembl_query_func()`, for creating a query function to
grab gene records for a given region.

---

#### License

[Licensed](LICENSE.md) under [GPL-3](https://www.r-project.org/Licenses/GPL-3).
