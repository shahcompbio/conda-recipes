#!/usr/bin/env Rscript

plot.titan.chromosome <- function(args)
{
  library(TitanCNA)
  
  params = read.table(args$param_file, header=F, row.names=1, sep='\t', colClasses='character')
  results = read.table(args$cn_file, header=T)
	
  norm <- as.numeric(params['Normal contamination estimate:',])
  ploidy <- as.numeric(params['Average tumour ploidy estimate:',])
  
  png(args$plot_file, width=1200, height=1000, res=100)
  par(mfrow=c(3,1))
  
  plot.title = paste('Chromosome', args$chromosome)
  
  plotCNlogRByChr(results, args$chromosome, normal=norm, ploidy=ploidy, geneAnnot=NULL, spacing=4, ylim=c(-4,6), cex=0.5, main=plot.title)
  plotAllelicRatio(results, args$chromosome, geneAnnot=NULL, spacing=4, ylim=c(0,1), cex=0.5, main=plot.title)
  plotClonalFrequency(results, args$chromosome, normal=norm, geneAnnot=NULL, spacing=4, ylim=c(0,1), cex=0.5, main=plot.title)

  if (args$plot_idiogram) {
    library(SNPchip)
    pI <- plotIdiogram(args$chromosome, build="hg19", unit="bp", label.y=-4.25, new=FALSE, ylim=c(-2,-1))
  }
  
  dev.off()
}

suppressPackageStartupMessages(library("argparse"))

parser <- ArgumentParser(description='CLI to plot a TITAN analysis for a chromosome.')

parser$add_argument('chromosome',
  help='Chromosome to plot.')

parser$add_argument('cn_file',
  help='Path of filename where input copy number has been written.')

parser$add_argument('param_file',
  help='Path of filename where input parameters has been written.')

parser$add_argument('plot_file',
  help='Path of filename where output parameters will be written.')

parser$add_argument('--plot_idiogram', default=FALSE, action='store_true',
  help='If set, an idiogram will be plotted.')				

args <- parser$parse_args()

plot.titan.chromosome(args)

