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
**3.** `ggplot2`

To install these packages in R, simply run the following:
``` R
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("clusterProfiler")
BiocManager::install("enrichplot")
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

**Outputs:**

`coverage_plots` (folder):
Contains a coverage plot for each amino acid as well as a combined coverage plot.
    
`DESeq_Results` (folder):
Contains multiple differential expression figures (PCAs, Volcanos, scatter plots)
Contains a subdirectory `tabular_data` for numerical data pulled from DESeq2 such as padj vals, fold changes, normalized read counts, dispersion values, and median counts. 
    
`endpoint_plots` (folder):
Contains endpoint plots for each amino acid
    
`Mapping_Diagnostics` (folder):
Contains figures and numerical data related to mapping 
    
`mismatch` (folder):
Contains mismatch information.
Contains a `five_prime`, `three_prime`, `deletions`, and `mismatches` subdirectories for misincorporation estimates. These subdirectories contain heatmaps and numerical data and figures. 
    
`pretRNAs` (folder):
Contains figures and numerical data for pre-tRNA coverages
    
`unique` (folder):
Contains only unique coverages for each amino acid as well as counts
    
`tRNA_tails` (folder):
Contains information and figures regarding the C, CC, CCA ending percentages.
    
`Full_relative_summed_tRNA_mismatches.png` (file):
A heatmap showing summed mismatches in one condition relative to the other for all iso-decoders grouped by amino acid family. 

## Contact
Contact & questions: Please address questions to DataAnalyticsCore@groups.dartmouth.edu or submit an issue in the GitHub repository.

This pipeline was created with funds from the COBRE grant 1P20GM130454. If you use the pipeline in your own work, please acknowledge the pipeline by citing the grant number in your manuscript.

## Citation
Holmes AD, Howard JM, Chan PP, and Lowe TM. tRNA Analysis of eXpression (tRAX): A tool for integrating analysis of tRNAs, tRNA-derived small RNAs, and tRNA modifications. 2020. (submitted)


