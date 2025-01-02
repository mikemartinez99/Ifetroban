#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# The purpose of this code is to enable to generation of GSEA barcode plots.
#
# Client: Ryan Beach
# Lab Affiliation: Rosenberg Lab (UCHC)
# Date Started: 12/31/24
# Author: Mike Martinez
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# LOAD LIBRARIES AND SET PATHS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Libraries
library(clusterProfiler)
library(org.Rn.eg.db)
library(ggplot2)
library(enrichplot)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# FUNCTION DEFINITIONS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#----- Function to plot multiple GSEA running enrichment scores on one plot
plotESMulti <- function(obj, geneSetIDs) {
    # Generate the GSEA plot
    plot <- gseaplot2(
      x = obj,
      geneSetID = geneSetIDs,  # Vector of GO terms
      subplots = 1:3, # Don't change
      pvalue_table = TRUE, # Change to FALSE if pvalue table is not wanted
      ES_geom = "line" # Either "line" or "dot"
    )
    return(plot)
  }


#----- Function to plot single GSEA running enrichment score
plotESSingle <- function(obj, geneSetID, title) {
  # Generate the GSEA plot
  plot <- gseaplot2(
    x = obj,
    geneSetID = geneSetID, 
    title = title, # Vector of GO terms
    pvalue_table = TRUE, # Change to FALSE if pvalue table is not wanted
    ES_geom = "line" # Either "line" or "dot"
  )
  return(plot)
}







