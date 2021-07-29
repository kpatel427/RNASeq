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
-b aligned/6525844154_S1_L001_Aligned.sortedByCoord.out.bam aligned/6525844154_S1_L002_Aligned.sortedByCoord.out.bam \
--samplesLabel 6525844154_S1_L001 6525844154_S1_L002

echo "Done!"