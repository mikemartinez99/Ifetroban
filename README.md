# Ifetroban Barcode Plots
Custom functions that can be leveraged for plotting GSEA results with the popular "Running Enrichment Score" plots (aka, barcode plots).

# Table of Contents
- [Introduction](#introduction)
- [Directories](#directories)
- [Files](#files)
- [Implementation](#implementation)
- [Contact](#contact)


## Introduction
This code includes two wrapper functions that utilize the `gseaplot2` function from the popular GSEA package [clusterProfiler](https://bioconductor.org/packages/release/bioc/html/clusterProfiler.html) and [enrichplot](https://yulab-smu.top/biomedical-knowledge-mining-book/enrichplot.html)
The wrapper functions include basic plotting parameters that can be easily manipulated to further customize the plot.
Addtionally, the .rds objects for the GO and KEGG enrichment results are included, which enables the direct plotting with the default function `gseaplot2` from the `enrichplot` package.

This code requires the following packages be installed:
**1.** `clusterProfiler`

**2.** `enrichPlot`

**3.**  `org.Rn.eg.db`

**4.** `ggplot2`


To install these packages in R, simply run the following:
``` R
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("clusterProfiler")
BiocManager::install("enrichplot")
BiocManager::install("org.Rn.eg.db")
install.packages("ggplot2")
```

## Directories
To use this code, clone this github repository in your working directory (whatever folder your R file is)
**1.** Enter your terminal
**2.** Navigate to your working directory using the `cd` command
**3.** Clone this repository to the working directory using the following code:


``` bash
# Run from within your working directory
git clone https://github.com/mikemartinez99/Ifetroban/
```

After successful repo cloning, you should have a folder called `code`, `data` and a 'README.txt` file (of which you're reading)


## Files


# Implementation
Below is an example script showing how to source and call the wrapper functions, and how to implement them.
You will need to change the `wd` variable to the path to your working directory, ensuring that the path ends with a "/"

```R
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# LOAD LIBRARIES AND SET PATHS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Libraries
library(clusterProfiler)
library(org.Rn.eg.db)
library(ggplot2)
library(enrichplot)

# Set path to working directory
# Ensure that paths end with a "/" so the paste0 function works correctly
wd <- "Path/to/your/workingDirectory/"
sourceCode <- paste0(wd, "Ifetroban/Code/GSEA_Barcode_Enrichment_Plots.R"
inputDir <- paste0(wd, "Ifetroban/Data/")
outputDir <- paste0(wd, "Outputs")

# Generate the output Directory
if (!dir.exists(outputDir)) {
    dir.create(outputDir)
}

# Source the functions
source(sourceCode)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# READ IN THE GO OR KEGG DATA
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Read in the rds file for either go or kegg
go <- readRDS(paste0(inputDir, "TIfetroban_vs_TControl_gseGO.rds"))

# See the data in tabular format
goData <- as.data.frame(go)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Example usage of plotESMulti
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Plot multiple running enrichment scores on one plot
plotESMulti(go,
            c("GO:0004888", "GO:0030545")
            )
```
