process FASTQC {
    tag "${sample_id}"
    publishDir "${params.outdir}/fastqc", mode: 'copy'

    container 'staphb/fastqc:0.12.1'

    input:
    tuple val(sample_id), path(reads)

    output:
    path("*_fastqc.zip"), emit: zip
    path("*_fastqc.html"), emit: html

    script:
    """
    fastqc --quiet --outdir . ${reads}
    """
}
