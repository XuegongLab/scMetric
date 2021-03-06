% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scMetric.R
\name{scMetric}
\alias{scMetric}
\title{scMetric: metric learning and visualization for scRNA-seq data}
\usage{
scMetric(X, label = NULL, constraints = NULL, num_constraints = 100,
  thresh = 0.01, max_iters = 1e+05, draw_tSNE = FALSE)
}
\arguments{
\item{X}{a scRNA-seq expression matrix, cells for rows and genes for columns.}

\item{label}{a vector. Specify which group cells belong to, corresponding to rows in X. If NULL(default), \code{constraints} should not be NULL.}

\item{constraints}{a N by 3 matrix, weak supervision information. N stands for total number of cell pairs. The first 2 columns specify two cells. The 3rd column is a value specifying whether corresponding two cells in the first two columns are similar, 1 for similar and -1 for dissimilar. If NULL(default), \code{label} cannot be NULL and \code{num_constraints} pairs will be chosen randomly according to \code{label} for metric learning. Cells that have the same label are similar. Otherwise, they are dissimilar.}

\item{num_constraints}{total number of similar and dissimilar pairs that are used. No larger than N. If \code{constraints} is not NULL, first \code{num_constraints} rows of \code{constraints} will be used. Default: 100}

\item{thresh}{threshold that decides when metric learning iteration stops. Default: 0.01}

\item{max_iters}{max iterations of metric learning. Default: 100000}

\item{draw_tSNE}{boolean. Default: FALSE. Specify whether to draw tSNE plot or not}
}
\value{
List containing four outputs:
\itemize{
\item newData: new data based on new metric, rows are cells and columns are linear combination of original genes expressions
\item newMetric: learned metric, a d by d matric where d represents genes numbers
\item constraints: constraints used for metric learning
\item sortGenes: genes sorted by importance score
}
}
\description{
Apply a weakly supervised metric learning algorithm ITML to scRNA-seq data.
Users give very few training samples to tell expected angle they would use
to analyze the data, and the function learns the metric automatically for
downstream clustering and visualization.
}
\examples{
data(testData)
res <- scMetric(counts, label = label1, num_constraints = 50, thresh = 0.1, draw_tSNE = TRUE)

}
