FROM continuumio/miniconda3:latest

# Instalando Jupyter Notebook
RUN conda install -y jupyter

# Configurando ambiente Bioconda
RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge

# Instalando pacotes do Bioconda
RUN conda install -y \
    samtools \
    bedtools \
    bwa \
    picard \
    gatk \
    star \
    hisat2 \
    deseq2 \
    edger \
    limma \
    salmon \
    biopython \
    pandas \
    fastqc \
    multiqc \
    subread \
    cutadapt \
    trimmomatic \
    kraken2 \
    bracken \
    metaphlan \
    krona \
    humann \
    spades \
    quast \
    busco

# Expondo a porta do Jupyter Notebook
EXPOSE 8888

# Configurando o comando padrão para iniciar o Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
