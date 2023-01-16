#!/usr/bin/env nextflow

// DSL-2 enabled

nextflow.enable.dsl = 2


/// Some help 

def helpMessage() {
    log.info"""
  Usage:  nextflow run <PATH TO REPO>/haploflow <args> --input <samples.tsv>

  Required Arguments:

  --input	    Three column TSV file, with sample name, read 1, and read 2
  --outdir      Output folder

  Optional Arguments:

  --help        Print this help statement
	
"""
}

// Import modules to process data
include { run_fastp } from './modules/local/fastp/main'
include { run_spades } from './modules/local/spades/main'
include { run_blastn } from './modules/local/amplicon-sorting/main'

if (params.help) {
    helpMessage()
    exit 0
}

// Read the input file

sample_ch = Channel.fromPath(params.input) \
        | splitCsv(header:true) \
        | map { row-> tuple(row.sampleID, row.tissue, row.segment, file(row.R1), file(row.R2)) }

workflow {
    run_fastp(sample_ch)
    run_spades(run_fastp.out.trimmed)
    run_blastn(run_spades.out.assembled)
}