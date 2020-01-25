library(ComplexHeatmap)
# Clustering
library(ComplexHeatmap)
library(circlize)
library(ggplot2)
#setwd("../../media/rachel/Windows/Users/All Users/Documents/project_jnu/Brassica_napus_Trihelix/Figures/heatmaps/")
setwd("../PRJNA331148/")
hm_data = read.csv("PRJNA331148.csv", row.names = 1)
trihelix = read.csv("../napus_clades.csv")
trihelix_hm_data = hm_data[match(trihelix$Gene.Name, rownames(hm_data)),]
trihelix_hm_data$clusters = trihelix[match(rownames(trihelix_hm_data), trihelix$Gene.Name),2]
trihelix_hm_merged = data.frame(cbind(rowMeans(trihelix_hm_data[,1:3]),
                                      rowMeans(trihelix_hm_data[,4:6]),
                                      rowMeans(trihelix_hm_data[,7:9]),
                                      rowMeans(trihelix_hm_data[,10:12])))
colnames(trihelix_hm_merged) = c("Water",
                                 "PA23",
                                 "PA23+Ss",
                                 "Ss")

#th_hm_sc = t(scale(t(trihelix_hm_merged), center = T, scale = T))
f1 = colorRamp2(seq(min(trihelix_hm_merged), max(trihelix_hm_merged), length = 3), c("blue", "white", "red"), space = "LAB")
f2 = colorRamp2(seq(min(th_hm_sc), max(th_hm_sc), length = 3), c("blue", "white", "red"), space = "LAB")
Heatmap(trihelix_hm_merged, col = f1, cluster_rows = T, show_row_dend = F, cluster_columns = F, show_row_names = T, split = trihelix_hm_data$clusters, row_names_gp = gpar(fontsize=05), name = "fpkm values")
#Heatmap(th_hm_sc, col = f2, cluster_rows = T, show_row_dend = F, cluster_columns = F, show_row_names = T, split = trihelix_hm_data$clusters, row_names_gp = gpar(fontsize=06), name = "z scores")

