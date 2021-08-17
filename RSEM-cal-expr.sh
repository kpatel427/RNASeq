#!/usr/bin/bash
#SBATCH --job-name=RSEM-bowtie2 
#SBATCH -c 16
#SBATCH --mem=256G
#SBATCH -t 72:00:00
#SBATCH --output=RSEM-bowtie2-%j.out
#SBATCH --error=RSEM-bowtie2-%j.err



#echo "Generating indexes..."
#/home/patelk26/KP/tools/RSEM/rsem-prepare-reference --gtf /home/patelk26/KP/hg19/Homo_sapiens.GRCh38.86.gtf --bowtie2 --bowtie2-path /mnt/isilon/maris_lab/target_nbl_ngs/shared_resources/apps/bowtie2/bowtie2-2.2.8/ /home/patelk26/KP/hg19/Homo_sapiens.GRCh38.dna.primary_assembly.fa /home/patelk26/KP/papThyCarc_bulkRNASeq/bowtie_2.2.8_hg38_index/GRCh38

#/mnt/isilon/maris_lab/target_nbl_ngs/shared_resources/apps/bowtie2/bowtie2-2.2.8/bowtie2-build -f home/patelk26/KP/hg19/Homo_sapiens.GRCh38.dna.primary_assembly.fa /home/patelk26/KP/papThyCarc_bulkRNASeq/bowtie_2.2.8_hg38_index/GRCh38


echo "RSEM calculate expression..."
/home/patelk26/KP/tools/RSEM/rsem-calculate-expression --bowtie2 \
                           --bowtie2-path /mnt/isilon/maris_lab/target_nbl_ngs/shared_resources/apps/bowtie2/bowtie2-2.2.8/ \
                           --paired-end \
                           -p 16 \
                           /mnt/isilon/maris_lab/target_nbl_ngs/papThyCarcinoma_bulkRNASeq/6525844154_ds.790c25ced1574bbb86c1166a4fa1d902/6525844154_S1_L002_R1_001.fastq.gz \
                           /mnt/isilon/maris_lab/target_nbl_ngs/papThyCarcinoma_bulkRNASeq/6525844154_ds.790c25ced1574bbb86c1166a4fa1d902/6525844154_S1_L002_R2_001.fastq.gz \
                           /home/patelk26/KP/papThyCarc_bulkRNASeq/bowtie_2.2.8_hg38_index/GRCh38 \
                           6525844154_S1_L002


echo "Done!"