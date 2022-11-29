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

# Install Jupyter lab
RUN conda update -n base conda \
    && conda install -c conda-forge mamba --yes \
    && mamba install -c conda-forge --yes nodejs jupyterlab psycopg2 ipython-sql \
    && jupyter lab build


# Install and configure jupyter lab.
COPY jupyter_notebook_config.json /opt/conda/envs/qiime2-2022.8/etc/jupyter/
#RUN jupyter serverextension enable --py qiime2 --sys-prefix

# Add the qiime2 user so the container doesn't run as root
RUN useradd -d /home/qiime2 -u 1001 qiime2 \
    && chown -R qiime2:qiime2 /home/qiime2
ENV SHELL=bash
# RUN adduser qiime2 sudo

# make sure QIIME2 Conda Kernel is installed and starts 
RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> /home/qiime2/.bashrc && \
    echo "conda deactivate" >> /home/qiime2/.bashrc && \
    echo "conda activate qiime2-2022.8" >> /home/qiime2/.bashrc
RUN . /opt/conda/etc/profile.d/conda.sh && conda activate qiime2-2022.8 && python3 -m ipykernel install --user --name qiime2-2022.8     
RUN source /home/qiime2/.bashrc

USER qiime2
WORKDIR /home/qiime2

EXPOSE 8888

COPY entry.sh /bin
RUN mkdir -p /home/qiime2/.irods
CMD echo $(getent passwd | awk -F: '{ print $1}')
ENTRYPOINT ["bash", "/bin/entry.sh"]
