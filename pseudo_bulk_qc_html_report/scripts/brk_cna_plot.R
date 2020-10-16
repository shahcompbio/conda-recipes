#!/usr/bin/env Rscript

library(circlize)

args <- commandArgs(TRUE)
overlap = args[1]
plot = args[2]
chromosomes = c(1,2,3,4,5)

plot_svs = function(svs){
  if (! nrow(svs)){
    return()
  }
  for (sv in 1:nrow(svs)){
    chr1 = paste0("chr", svs[sv, "chromosome_1"])
    chr2 = paste0("chr", svs[sv, "chromosome_2"])
    p1 =  svs[sv, "position_1"]
    p2 =  svs[sv, "position_2"]

    if (chr1 == "chrY" | chr2 == "chrY"){
      next
    }
    circos.link(chr1, p1, chr2, p2, col = "black", h.ratio=0.7)

  }
    
  x = c(svs$start_pos_1, svs$start_pos_2)
  y = c(svs$state_pos_1, svs$state_pos_2)
  factors = paste0("chr", c(svs$chr_pos_1, svs$chr_pos_2))

  circos.track(factors, x, y, panel.fun = function(x, y) {
      circos.points(x, y, col="blue")
  })
  
} 

data = read.csv(overlap, header = TRUE, sep = "\t")
data = data[data$pos_1_in_cn_change_region == "True" & data$pos_2_in_cn_change_region  == "True",]
data = data[data$chromosome_1 %in% chromosomes & data$chromosome_2 %in% chromosomes, ]

#save plot to pdf
pdf(plot, 8, 9)

circos.initializeWithIdeogram(chromosome.index = paste0("chr", chromosomes))
plot_svs(data)
title("destruct")

#turn off pdf
dev.off()
