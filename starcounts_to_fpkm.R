# Calculate fpkm from count data from multiple files from STAR output
# setwd("/Volumes/target_nbl_ngs/KP/papThyCarc_bulkRNASeq")

library(edgeR)
library(GenomicFeatures)


# list files with count data
files <- grep ("ReadsPerGene.out.tab",  dir("aligned"),value=TRUE)

# read each file containing count data into a list
cntlist<-list()
for(i in files){
  tab <-read.delim(paste("aligned/",i,sep=""),header=FALSE)
  cntlist[[i]] <- tab[,2]
}
# colapse list of count vectors into matrix
cnt <- do.call(cbind,cntlist)
# change colnames and rownames
colnames(cnt) <- do.call(rbind,strsplit(colnames(cnt),"\\."))[,1]
rownames(cnt) <- tab[,1]

# remove non gene counts
cntgenes <- cnt[grep("N_",rownames(cnt),invert=TRUE),]

# Obtain gene lengths from a GTF file 
# read GTF file
GTFfile <- "/Volumes/target_nbl_ngs/KP/hg19/gencode.v38.annotation.gtf"
txdb <- makeTxDbFromGFF(GTFfile,format="gtf")
# then collect the exons per gene id
exons.list.per.gene <- exonsBy(txdb,by="gene")
# then for each gene, reduce all the exons to a set of non overlapping exons, calculate their lengths (widths) and sum then
exonic.gene.sizes <- lapply(exons.list.per.gene,function(x){sum(width(reduce(x)))})


# calculate fpkm
# calculate library sizes from original count data
libSize <- apply(cnt,2,sum)
# reorder gene lengths in a vector  of ncol(gene count matrix)
geneLength <- unlist(exonic.gene.sizes)[rownames(cntgenes)]
# calculate fpkm
fpkm_matrix <- rpkm(cntgenes,lib.size=libSize,gene.length=geneLength)

save(fpkm_matrix,file= paste0("counts/", Sys.Date(), "-fpkm_matrix.RData"))

write.table(fpkm_matrix,file= paste0("counts/", Sys.Date(),"-fpkm_matrix.txt"), 
            sep = "\t", row.names = T, col.names = T)

