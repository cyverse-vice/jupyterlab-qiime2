FROM quay.io/qiime2/core:2022.8
SHELL ["/bin/bash", "-c"]
USER root
RUN apt-get update \
    && apt-get install -y bash-completion nodejs less vim nano htop libpq-dev lsb-release wget gnupg apt-transport-https python3 curl gcc

# Install iCommands
RUN wget -qO - https://packages.irods.org/irods-signing-key.asc | apt-key add - \
    && echo "deb [arch=amd64] https://packages.irods.org/apt/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/renci-irods.list \
    && apt-get update \
    && apt-get install -y irods-icommands \
    && apt-get clean \
    && rm -rf /usr/lib/apt/lists/* 
# && fix-permissions $CONDA_DIR

# Install tini
RUN apt-get update && \
    apt-get install -y curl grep sed dpkg && \
    curl -L "https://github.com/krallin/tini/releases/download/v0.19.0/tini_0.19.0-amd64.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*  

# Add the qiime2 user so the container doesn't run as root
RUN useradd -d /home/qiime2 -u 1001 qiime2 \
    && chown -R qiime2:qiime2 /home/qiime2
ENV SHELL=bash

# Add limited sudo to qiime2 user
RUN apt update && \
    apt install -y sudo && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
    
ARG LOCAL_USER=qiime2
ARG PRIV_CMDS='/bin/ch*,/bin/cat,/bin/gunzip,/bin/tar,/bin/mkdir,/bin/ps,/bin/mv,/bin/cp,/usr/bin/apt*,/usr/bin/pip*,/bin/yum'

RUN usermod -aG sudo qiime2 && \
    echo "$LOCAL_USER ALL=NOPASSWD: $PRIV_CMDS" >> /etc/sudoers

RUN chown -R 1001:1001 /opt/conda

USER qiime2

# Install Jupyter lab
RUN conda update -n base conda \
    && conda install -c conda-forge mamba --yes \
    && mamba install -c conda-forge --yes nodejs jupyterlab ipykernel \
    && jupyter lab build

# make sure QIIME2 Conda Kernel is installed and starts 
RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> /home/qiime2/.bashrc && \
    echo "conda deactivate" >> /home/qiime2/.bashrc && \
    echo "conda activate qiime2-2022.8" >> /home/qiime2/.bashrc
RUN . /opt/conda/etc/profile.d/conda.sh && conda activate qiime2-2022.8 && python3 -m ipykernel install --user --name qiime2-2022.8     
RUN source /home/qiime2/.bashrc

# add auto-completion with tab for qiime2 CLI
RUN source tab-qiime

# Install and configure jupyter lab.
COPY jupyter_notebook_config.json /opt/conda/envs/qiime2-2022.8/etc/jupyter/

EXPOSE 8888

WORKDIR /home/qiime2/

COPY entry.sh /bin
RUN mkdir -p /home/qiime2/.irods
ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/bin/entry.sh"]