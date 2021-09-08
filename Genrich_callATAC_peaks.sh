#!/bin/bash

BAM=/Volumes/MBomber_Ext/3910bam-wdup/3910-hg19-bam-wdup

BAMSORTN=/Volumes/MBomber_Ext/3910bam-wdup/3910-hg19-bam-sortn

OUTPUT_DIR=/Volumes/MBomber_Ext/3910bam-wdup/3910_Genrich

GENOME_DIR=/Volumes/MBomber_Ext/hg19_blacklist

source /Users/monicabomber/opt/anaconda3/etc/profile.d/conda.sh

conda activate Genrich
echo "Creating sort -n .bam files"
for i in 3 4 5 6 7 8 9 10
do
	
samtools sort -@ 5 -n ${BAM}/3910-MB-${i}.hg19.sorted.F4q10.bam -o ${BAMSORTN}/3910-MB-${i}.hg19.sorted.F4q10.sortn.bam

done


echo "Calling Peaks with Genrich"
for i in 3 4 5 6 7 8 9 10
do
	
Genrich -t ${BAMSORTN}/3910-MB-${i}.hg19.sorted.F4q10.sortn.bam -j -r -E ${GENOME_DIR}/hg19.blacklistpeaks.bed -q 0.05 -o ${hg19_blacklist}/3910-${i}.withdup.j.r.Eblacklist.q0.05.narrowPeak

done

conda deactivate 
