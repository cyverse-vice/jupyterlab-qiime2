FROM qiime2/core:2019.10
SHELL ["/bin/bash", "-c"]
USER root

RUN apt-get update \
    && apt-get install -y nodejs less vim nano htop libpq-dev lsb wget gnupg apt-transport-https python3 python-requests curl 

RUN curl "http://ftp.se.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb" -O && \
    dpkg -i libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb && \
    rm libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb

# Install iCommands
RUN wget -qO - https://packages.irods.org/irods-signing-key.asc | apt-key add - \
    && echo "deb [arch=amd64] https://packages.irods.org/apt/ xenial main" > /etc/apt/sources.list.d/renci-irods.list \
    && apt-get update \
    && apt-get install -y irods-icommands \
    && apt-get clean \
    && rm -rf /usr/lib/apt/lists/* 
   # && fix-permissions $CONDA_DIR

RUN apt-get install -y gcc

# Install Jupyter lab
RUN pip install ipython-sql jupyterlab==1.0.9 jupyterlab_sql psycopg2 \
    && conda update -n base conda \
    && conda install -c conda-forge nodejs \
    && jupyter serverextension enable jupyterlab_sql --py --sys-prefix \
    && jupyter lab build

# install the irods plugin for jupyter lab
RUN pip install jupyterlab_irods \
    && jupyter serverextension enable --py jupyterlab_irods \
    && jupyter labextension install ijab

# install jupyterlab hub-extension, lab-manager, bokeh
RUN jupyter lab --version \
    && jupyter labextension install @jupyterlab/hub-extension \
                                    @jupyter-widgets/jupyterlab-manager \
                                    jupyterlab_bokeh 

# install jupyterlab git extension
RUN jupyter labextension install @jupyterlab/git && \
        pip install --upgrade jupyterlab-git && \
        jupyter serverextension enable --py jupyterlab_git

# install jupyterlab github extension
RUN jupyter labextension install @jupyterlab/github

# Install and configure jupyter lab.
COPY jupyter_notebook_config.json /opt/conda/envs/qiime2-2019.10/etc/jupyter/
RUN jupyter serverextension enable --py qiime2 --sys-prefix

# Add the qiime2 user so the container doesn't run as root
RUN useradd -d /home/qiime2 -u 1000 qiime2
RUN chown -R qiime2:qiime2 /home/qiime2

# RUN adduser qiime2 sudo
USER qiime2
WORKDIR /home/qiime2

EXPOSE 8888

COPY entry.sh /bin
RUN mkdir -p /home/qiime2/.irods

ENTRYPOINT ["bash", "/bin/entry.sh"]
