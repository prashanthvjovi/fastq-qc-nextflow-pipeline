# FASTQ QC Nextflow Pipeline

A small Nextflow DSL2 pipeline that runs FastQC on toy FASTQ inputs and aggregates results with MultiQC.

## Features
- Nextflow DSL2 workflow
- Dockerized execution
- Per-sample FastQC outputs
- Combined MultiQC HTML report

## Run
```bash
nextflow run main.nf

![MultiQC report](assets/multiqc-screenshot.png)
