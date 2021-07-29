#!/usr/bin/bash
#SBATCH --job-name=deeptools
#SBATCH --mem=64G
#SBATCH -t 12:00:00

# change working dir
cd /home/patelk26/KP/papThyCarc_bulkRNASeq


echo "Running command..."

bamPEFragmentSize \
-hist fragmentSize.png \
-T "Fragment size of PE RNA-seq data" \
--maxFragmentLength 1000 \
-b aligned/sample1_Aligned.sortedByCoord.out.bam aligned/sample2_Aligned.sortedByCoord.out.bam \
--samplesLabel sample1 sample2

echo "Done!"
