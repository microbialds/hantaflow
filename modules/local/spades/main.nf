#!/bin/env nextflow

// Enable DSL-2 syntax
nextflow.enable.dsl=2

process run_spades {
    container "quay.io/biocontainers/spades:3.15.5--h95f258a_1"

    publishDir "${params.outdir}/assembly/", mode: "copy"

    input:
        tuple val(sampleID), path(trimmed)

    output:
        tuple val(sampleID), path("${sampleID}_contigs.fasta"), emit: assembled

    script:

    """
      spades.py \
      -t $params.threads \
      -1 ${trimmed[0]} \
      -2 ${trimmed[1]} \
      -o ${sampleID}_out \
      --meta
      mv ./${sampleID}_out/contigs.fasta ${sampleID}_contigs.fasta
    """
}