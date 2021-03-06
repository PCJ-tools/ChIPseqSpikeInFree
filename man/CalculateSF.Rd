% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ChIPseqSpikeInFree.R
\name{CalculateSF}
\alias{CalculateSF}
\title{calculate scaling factors and save results}
\usage{
CalculateSF(
  data,
  metaFile = "sample_meta.txt",
  minFirstTurn = "auto",
  maxLastTurn = 0.99,
  cutoff_QC = 1.2
)
}
\arguments{
\item{data}{a data.frame generated by function ParseReadCounts() or a file name of parsed matrix}

\item{metaFile}{a data.frame of metadata by ReadMeta(); or a filename of metadata file.}

\item{minFirstTurn}{"auto" or a numeric value [between 0.20 and 0.80] to define minimum fraction of noisy reads in non-enriched regions.}

\item{maxLastTurn}{a numeric value [between 0.95 and 0.99] to define maximum fraction of reads to be included for identifying last turning point [0.99 by default]. Slightly smaller maxLastTurn may imporve result when the enrichment is not ideal.}

\item{cutoff_QC}{a numeric value [between 0.90 and 1.20] to identiy sample of QC failure or poor enrichment [1.2 by default]. For some challenging ChIP-seq like H3K9me3, you may try loose cutoff like 1.}
}
\value{
A data.frame of the updated metadata with scaling factors (sacaling factor table)
}
\description{
This function allows you to plot curves, caculate SF(scaling factor) per antibody based on parsedMatrix.
In addtion return a data.frame of updated metadata.
If you run ChIPseqSpikeInFree() seperately for two batches, the scaling factors will be not comparable between two batches.
The correct way is to combine bamFiles parameter and create a new metadata file to include all bam files. Then re-run ChIPseqSpikeInFree().
}
\examples{
## 1. start from a parsedMatrix file

# parsedMatrixFile <- "your/path/test_parsedMatrix.txt"
# metaFile <- "your/path/sample_meta.txt"
# parsedDF <- read.table(parsedMatrixFile, sep="\t",header=TRUE,fill=TRUE,
# quote="",row.names=NULL ,check.names=F)
# SF <- CalculateSF (data=parsedDF,metaFile=metaFile)
## For some ChIP with unideal enrichment like H3K9me3, you may try loose cutoff (1) 
## but use 97\% of total reads to improve performance.
# SF <- CalculateSF(data, metaFile = metaFile, maxLastTurn=0.97, cutoff_QC=1)

## 2. start from a rawCount file

# metaFile <- "your/path/sample_meta.txt"
# parsedDF <- ParseReadCounts(data="your/path/test_rawCounts.txt", metaFile=metaFile,
#     prefix="your/path/test_parsedMatrix.txt")
# SF <- CalculateSF (data=parsedDF,metaFile=metaFile)
}
