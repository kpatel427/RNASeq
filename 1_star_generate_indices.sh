#!/usr/bin/bash
#SBATCH --job-name=1_STAR_index
#SBATCH -c 8
#SBATCH --mem=64G
#SBATCH -t 48:00:00
#SBATCH --output=%j.out
#SBATCH --error=%j.err


echo "Generating genome indices..."
	# Step 1: create genome index
	/home/patelk26/apps/star/STAR-STAR_2.4.2a/bin/Linux_x86_64/STAR \
	--runMode genomeGenerate \
	--genomeDir /home/patelk26/KP/papThyCarc_bulkRNASeq/STAR2 \
	--genomeFastaFiles /home/patelk26/KP/hg19/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
	--sjdbOverhang 99 \
	--sjdbGTFfile /home/patelk26/KP/hg19/Homo_sapiens.GRCh38.86.gtf \
	--runThreadN 16
	

echo "Done!"