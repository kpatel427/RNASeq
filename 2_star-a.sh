#!/usr/bin/bash
#SBATCH --job-name=a_STAR_align 
#SBATCH -c 8
#SBATCH --mem=512G
#SBATCH -t 48:00:00
#SBATCH --output=star_a-%j.out
#SBATCH --error=star_a-%j.err

fastq_dir="/mnt/isilon/maris_lab/target_nbl_ngs/papThyCarcinoma_bulkRNASeq/6525844154_ds.790c25ced1574bbb86c1166a4fa1d902"


	echo "Performing alignment..."
	# Step 2: Alignment
	/home/patelk26/apps/star/STAR-STAR_2.4.2a/bin/Linux_x86_64/STAR \
	--genomeDir /home/patelk26/KP/papThyCarc_bulkRNASeq/STAR2 \
	--runThreadN 20 \
	--readFilesIn $fastq_dir/6525844154_S1_L001_R1_001.fastq.gz,$fastq_dir/6525844154_S1_L001_R2_001.fastq.gz \
	--outFileNamePrefix ./aligned2/6525844154_S1_L001 \
	--outSAMtype BAM Unsorted \
	--outSAMunmapped Within \
	--twopassMode Basic \
	--outSAMattributes Standard \
	--readFilesCommand zcat \
	--sjdbGTFfile /home/patelk26/KP/hg19/Homo_sapiens.GRCh38.86.gtf \
	--quantMode transcriptomeSAM GeneCounts \
	--limitOutSJcollapsed 5000000 \
	--limitBAMsortRAM 41977863454




