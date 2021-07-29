#!/usr/bin/bash
#SBATCH --job-name=picard
#SBATCH -a 1-2
#SBATCH --mem=64G
#SBATCH -t 10:00:00


# change working dir
cd /home/patelk26/KP/papThyCarc_bulkRNASeq




function getFragmentLength () {
        name=$(basename ${1})
        filename="${name%.*}"

        echo "filename = $filename"


        java -jar ~/apps/picard.jar CollectInsertSizeMetrics \
              I=./aligned/$filename.bam \
              O=$filename.insert_size_metrics.txt \
              H=insert_size_histogram.pdf


}


arr=("sample1_Aligned.sortedByCoord.out.bam" "sample2_Aligned.sortedByCoord.out.bam")

# calling function and assigning jobs from arrays to cluster
getFragmentLength ${arr[$SLURM_ARRAY_TASK_ID-1]}

