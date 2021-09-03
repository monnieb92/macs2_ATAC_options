#!/bin/bash


BAM=/Volumes/MBomber_Ext/3910bam-wdup/3910-hg19-bam-wdup

OUTPUT_DIR=/Volumes/MBomber_Ext/3910bam-wdup/3910_macs2

source /Users/monicabomber/opt/anaconda3/etc/profile.d/conda.sh

# sort bedGraph files
conda activate macs2

echo "Calling Peaks for cut sites"
for i in 3 4 5 6 7 8 9 10
do
	
macs2 callpeak -t ${BAM}/3910-MB-${i}.hg19.sorted.F4q10.bam -q 0.01 -f BAM --nomodel --shift -100 --extsize 200 --keep-dup all -n ${OUTPUT_DIR}/3910-MB-${i}.hg19.q0.01.nomodel.shift100.ext200.keepdup

done

echo "Calling Peaks for nucleosome sites"
for i in 3 4 5 6 7 8 9 10
do
	
macs2 callpeak -t ${BAM}/3910-MB-${i}.hg19.sorted.F4q10.bam -q 0.01 -f BAM --nomodel --shift -75 --extsize 73 --keep-dup all -n ${OUTPUT_DIR}/3910-MB-${i}.hg19.q0.01.nomodel.shift37.ext73.keepdup

done


conda deactivate

conda activate bedtools

echo "Removing blacklist"
 
for i in 3 4 5 6 7 8 9 10
do
	
bedtools intersect -v -abam ${OUTPUT_DIR}/3910-MB-${i}.hg19.q0.01.nomodel.shift100.ext200.keepdup_peaks.narrowPeak -b /Volumes/BombXtreme/hg19_scer_genomes/hg19_blacklist/hg19.blacklistpeaks.bed > ${OUTPUT_DIR}/3910-MB-${i}.hg19.q0.01.nomodel.shift100.ext200.keepdup.peaks.BLfiltered.narrowPeak

done

for i in 3 4 5 6 7 8 9 10
do
	
bedtools intersect -v -abam ${OUTPUT_DIR}/3910-MB-${i}.hg19.q0.01.nomodel.shift37.ext73.keepdup_peaks.narrowPeak -b /Volumes/BombXtreme/hg19_scer_genomes/hg19_blacklist/hg19.blacklistpeaks.bed > ${OUTPUT_DIR}/3910-MB-${i}.hg19.q0.01.nomodel.shift37.ext73.keepdup.peaks.BLfiltered.narrowPeak

done

conda deactivate
