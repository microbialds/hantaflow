#!/bin/env nextflow

// Enable DSL-2 syntax
nextflow.enable.dsl=2

process run_spades {
    container "quay.io/biocontainers/spades:3.15.5--h95f258a_1"

    publishDir "${params.out}/assembly/", mode: "copy"

    input:
        tuple val(sampleID), path(trimmed)

    output:
        path("${sampleID}_contigs.fasta"), emit: assembled

    script:

    """
      spades.py \
      -t $params.threads \
      -1 ${trimmed[0]} \
      -2 ${trimmed[1]} \
      -o ${sampleID}_out \
      --meta 
    """
}