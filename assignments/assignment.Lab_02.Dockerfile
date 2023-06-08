
    FROM ubuntu:latest
    
    RUN apt-get update && \
        apt-get install -y build-essential git
    
    RUN git clone https://github.com/spack/spack.git /opt/spack
    ENV PATH="/opt/spack/bin:$PATH"
    
    RUN spack env create lab_01
    RUN spack env activate lab_01
    
    RUN spack install --fail-fast
    
    RUN spack env write --dependencies --path /opt/spack-environment
    
    ENV SPACK_ROOT="/opt/spack"
    ENV SPACK_ENV="/opt/spack-environment"
    
    ENTRYPOINT ["spack", "env", "activate", "/opt/spack-environment"]
    