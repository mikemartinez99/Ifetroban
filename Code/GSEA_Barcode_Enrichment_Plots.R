#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# The purpose of this code is to enable to generation of GSEA barcode plots.
#
# Client: Ryan Beach
# Lab Affiliation: Rosenberg Lab (UCHC)
# Date Started: 12/31/24
# Author: Mike Martinez
#
# To run this code, clone the repository from github by running the following
# line of code:
#
# Input: First few blocks are re-generating the GSEA GO term results using the
# same seed as when they were originally generated to ensure the same results.
# There is no need to re-run the first few blocks. This will save greatly on 
# memory and time.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# LOAD LIBRARIES AND SET PATHS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Libraries
library(clusterProfiler)
library(org.Rn.eg.db)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(enrichplot)

# Set paths
opDir <- "Outputs/014_TIfetroban_vs_All_Outputs/"
#inputGenes <- "Outputs/014_TIfetroban_vs_All_Outputs/GSEA/TIfetroban_vs_TControl_GSEA_Input_List.csv"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# READ IN THE DATA
# DO NOT RE RUN THIS BLOCK
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#----- Read in the data and format as a named list (log2FC named by Entrez gene ID)
#unique_genes <- read.csv(inputGenes)

#----- Get the Fold changes
#uniqueGenes <- unique_genes$unique_genes

#----- Set names as entrez IDs
#names(uniqueGenes) <- unique_genes$X

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# RUN CLUSTERPROFILER AND SAVE RDS
# DO NOT RE-RUN THIS BLOCK
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#----- Set seed for reproducibility
#set.seed(1234)

#----- Run GSEA for GO terms
#GO <- gseGO(uniqueGenes,
#            ont = "all",
#            OrgDb = "org.Rn.eg.db",
#            pvalueCutoff = 0.05,
#            pAdjustMethod = "BH",
#            eps = 1e-300,
#            verbose = TRUE,
#            by = "fgsea",
#            seed = TRUE)
#GO.simp <- clusterProfiler::simplify(GO, cutoff = 0.6, by = "p.adjust", select_fun = min)

#----- Save results as an Rds file
#fileName <- "TIfetroban_vs_TControl_gseGO.rds"
#rdsDir <- paste0(opDir, "Rds_Files/")
#saveRDS(GO.simp, file = paste0(rdsDir, fileName))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# READ IN THE GSEA GO RESULTS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Read in the rds file
go <- readRDS(paste0(opDir, "Rds_Files/TIfetroban_vs_TControl_gseGO.rds"))
test <- as.data.frame(go)


#----- Function to plot multiple GSEA running enrichment scores on one plot
# This is useful for grouping highly similar terms to visualize concordant 
# enrichment results
plotGSEA <- function(obj, geneSetIDs) {
    # Generate the GSEA plot
    plot <- gseaplot2(
      x = obj,
      geneSetID = geneSetIDs,  # Vector of GO terms
      subplots = 1:2,
      pvalue_table = TRUE,
      ES_geom = "line" # Either "line" or "dot"
    )
    return(plot)
  }

#----- Example usage
# Replace 'gsea_result' with your actual GSEA rds object (the name of the variable)
# Replace "GO:0004888" and "GO:0030545" with actual GO terms from your analysis (see the dataframe for the values)
gsea_plot <- plotGSEA(go, c("GO:0004888", "GO:0030545"))
print(gsea_plot)





