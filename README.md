# macs2_ATAC_options

## This code is to acitvate and run conda enviorments to determine the cut sites or the mononucleosomes of ATAC-seq peaks and remove any blacklist peaks

### Install macs

required: https://anaconda.org/bioconda/macs2

```{bash}
conda create -n macs2

conda activate macs2

conda install -c bioconda/label/cf201901 macs2 

conda deactivate 
```

### Install bedtools
required: https://anaconda.org/bioconda/bedtools

```{bash}
conda create -n bedtools

conda activate bedtools

conda install -c bioconda/label/cf201901 bedtools 

conda deactivate 
```
### Blacklist peaks hg19
required: https://www.encodeproject.org/annotations/ENCSR797MUY/

# Genrich_ATAC_options

### Install Genrich

required: https://anaconda.org/bioconda/genrich

```{bash}
conda create -n Genrich

conda activate Genrich

conda install -c bioconda genrich

conda deactivate 
```

