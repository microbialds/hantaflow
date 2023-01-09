# hantaflow
Nextflow pipeline for the analysis of Hantavirus (and related) genomes generated using amplicon-based approaches

## Introduction

<!-- TODO nf-core: Add full-sized test dataset and amend the paragraph below if applicable -->

## Pipeline summary

<!-- TODO : Fill in short bullet-pointed list of the default steps in the pipeline -->

1. Present QC for raw reads ([`MultiQC`](http://multiqc.info/))
2. Sort amplicons and rearrange amplicons (if needed)
3. Generate consensus from reads using viral consensus (https://github.com/niemasd/ViralConsensus)
4. Quasispecies analysis from consensus
5. Quasispecies analysis from assembled genomes
6. Generate reports!




## Quick Start
