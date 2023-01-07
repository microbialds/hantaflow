#!/bin/env nextflow

// Enable DSL-2 syntax
nextflow.enable.dsl=2

process run_fastp {
    container "quay.io/biocontainers/fastp:0.23.2--h5f740d0_3"

    publishDir "${params.outdir}/clean_reads", mode: "copy"

    input:
        tuple val(sampleID), val(tissue), val(segment), path(R1), path(R2)

    output:
        tuple val(sampleID), path("${sampleID}_trimmed_R{1,2}.fastq.gz"), emit: trimmed

    script:
    """
    fastp -i $R1 -I $R2 \
    --thread $params.threads \
    -o ${sampleID}_trimmed_R1.fastq.gz \
    -O ${sampleID}_trimmed_R2.fastq.gz \
    -j ${sampleID}_report.json \
    -h ${sampleID}_report.html \
    --n_base_limit $params.n_base_limit \
    --detect_adapter_for_pe \
    --unqualified_percent_limit $params.unqualified_percent_limit --cut_front \
    --cut_front_window_size $params.cut_front_window_size \
    --cut_front_mean_quality $params.cut_front_mean_quality \
    --cut_right \
    --cut_right_window_size $params.cut_right_window_size \
    --cut_right_mean_quality $params.cut_right_mean_quality 2> ${sampleID}.fastp.log
    """
}