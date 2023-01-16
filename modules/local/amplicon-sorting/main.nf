#!/bin/env nextflow

// Enable DSL-2 syntax
nextflow.enable.dsl=2



process run_blastn {
    ///container "quay.io/biocontainers/blast:2.13.0--hf3cf87c_0"

    publishDir "${params.outdir}/blast", mode: "copy"

    input:
        tuple val(sampleID), path(contig_file)

    output:
        path("${sampleID}.blastn"), emit: blastn_results

    script:
    """
    blastn \
    -query ${contig_file} \
    -out ${sampleID}.blastn \
    -db /home/jugalde/hanta/new_pipeline/hantaflow/data/segmentdb/SegmentsDB \
    -outfmt "6 qseqid qlen sseqid slen pident length sstart send qstart qend" \
    -qcov_hsp_perc 50
    """
}

