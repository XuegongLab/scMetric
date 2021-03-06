# scMetric

**`scMetric`** is an R package that applies a metric learning algorithm to scRNA-seq data. It allows users to give weakly annotated samples to tell expected angle they would use to analyze the data, and the package learns the metric from the examples and apply the metric for downstream clustering and visualization. The package also outputs the genes that are weighted as more important in learned metric. 

For more information, please refer to the [manuscript](https://www.biorxiv.org/content/early/2018/10/30/456814) by Wenchang Chen and Xuegong Zhang.
## Installing

The package is developed . Users should . To install the developmental version from [GitHub](https://github.com/chenwenchang/scMetric): 

```
if(!require(devtools)) install.packages("devtools")
devtools::install_github("chenwenchang/scMetric", build_vignettes = TRUE)
```

To load the installed **`scMetric`** in R:

```
library(scMetric)
```

## Input

**`scMetric`** takes 7 inputs: 
* **`X`**: a scRNA-seq gene expression matrix, cells for rows and genes for columns
* **`label`**: a vector specifying which group cells belong to,corresponding to rows in X. 
* **`constraints`**: weak supervision information, a few pairs of cells along with whether they are similar or not
* **`num_constraints`**: total number of similar and dissimilar pairs that are used
* **`thresh`**: threshold that decides when metric learning iteration stops. Default: 0.01
* **`max_iters`**: max iterations of metric learning. Default: 100000 
* **`draw_tSNE`**: whether to draw tSNE plot or not

If users provide `constraints` themselves, the input `label` is used for visualization only. If users want **`scMetric`** to select `constraints` automatically, then `label` is used for selecting similar and dissimilar pairs. Cells that have the same label are similar. Otherwise, they are dissimilar.

Default `num_constraints` value is 100. Users should give a number for particular use.

## Test data

Users can load the test data in **`scMetric`** by

```
library(scMetric)
data(testData)
```
The toy data `counts` in `testData` is a scRNA-seq read counts matrix which has 1000 cells (rows) and 1000 genes (columns). The object `label1` and `label2` are two vectors specifying two kinds of grouping.

## Usage

Here is an example to run **`scMetric`** with read counts matrix input:

```
# Load library and the test data for DEsingle
library(scMetric)
data(testData)

# Learning metric using label1 as similarity
res <- scMetric(counts, label = label1, num_constraints = 50, thresh = 0.1, draw_tSNE = TRUE)

```

## Output
**`scMetric`** outputs 4 objects:
* **`newData`**: new data based on new metric which can be used for downstream analysis
* **`newMetric`**: learned metric, a d by d matric where d represents genes numbers
* **`constraints`**: constraints which **`scMetric`** uses
* **`sortGenes`**: genes sorted by importance score

## Authors

* Wenchang Chen - wrote **`scMetric`** and analyzed data
* Xuegong Zhang - planned the study 

## Acknowledgments

This work is supported by CZI HCA pilot project, the National Key R&D Program of China grant 2018YFC0910400 and the NSFC grant 61721003.

## References
Jason V. Davis, Brian Kulis, Prateek Jain, Suvrit Sra, and Inderjit S. Dhillon.  "Information-theoretic Metric Learning."  Proc. 24th International Conference on Machine Learning (ICML), 2007.
