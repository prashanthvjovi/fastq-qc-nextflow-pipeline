nextflow.enable.dsl = 2

params.input  = params.input ?: "${projectDir}/data/*.fastq"
params.outdir = params.outdir ?: "${projectDir}/results"

include { FASTQC }  from './modules/fastqc'
include { MULTIQC } from './modules/multiqc'

workflow {
    reads_ch = Channel
        .fromPath(params.input, checkIfExists: true)
        .map { read -> tuple(read.baseName, read) }

    fastqc_out = FASTQC(reads_ch)
    MULTIQC(fastqc_out.zip.collect())
}
