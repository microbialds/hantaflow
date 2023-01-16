# hantaflow
Nextflow pipeline for the analysis of Hantavirus (and related) genomes generated using amplicon-based approaches

## Introduction

## Pipeline summary

The goal of this pipeline is to process amplicon generated hantavirus genomes. Although the pipeline is designed for the requirements of these hantavirus genomes, the construction should be modular enough that in the near future could be expanded to other genomes generated with similar approaches.

Steps of the pipeline include:

1) De novo analysis
- Read QC using FastP
- Assembly of reads using SPAdes in metagenomics mode. This was done because in some cases two different viral regions were mixed in the same library.
- Classification, sorting, and rearregmente of the amplicons.

2) Reference-based analysis (quasispecies):
   
   To evaluate quasispecies in this dataset, we can use the genomes generated in the denovo analysis, and also a set of reference genomes for the segments.


## TODO
1. Present QC for raw reads ([`MultiQC`](http://multiqc.info/))
2. Sort amplicons and rearrange amplicons (if needed)
3. Generate consensus from reads using viral consensus (https://github.com/niemasd/ViralConsensus)
4. Quasispecies analysis from consensus
5. Quasispecies analysis from assembled genomes
6. Generate reports!




## Quick Start
