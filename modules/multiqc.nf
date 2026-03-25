process MULTIQC {
    publishDir "${params.outdir}/multiqc", mode: 'copy'

    container 'staphb/multiqc:1.33'

    input:
    path fastqc_zips

    output:
    path "multiqc_report.html"
    path "multiqc_report_data"

    script:
    """
    multiqc . --force --filename multiqc_report.html --outdir .
    """
}
