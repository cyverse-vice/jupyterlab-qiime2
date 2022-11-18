FROM quay.io/qiime2/core:2022.8
SHELL ["/bin/bash", "-c"]
USER root
RUN apt-get update \
    && apt-get install -y bash-completion nodejs less vim nano htop libpq-dev lsb-release wget gnupg apt-transport-https python3 curl gcc

RUN curl "http://ftp.de.debian.org/debian/pool/main/g/glibc/multiarch-support_2.28-10+deb10u1_amd64.deb" -O && \
    dpkg -i multiarch-support_2.28-10+deb10u1_amd64.deb && \
    rm multiarch-support_2.28-10+deb10u1_amd64.deb
RUN curl "http://ftp.se.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb" -O && \
    dpkg -i libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb && \
    rm libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb

# Install iCommands
RUN wget -qO - https://packages.irods.org/irods-signing-key.asc | apt-key add - \
    && echo "deb [arch=amd64] https://packages.irods.org/apt/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/renci-irods.list \
    && apt-get update \
    && apt-get install -y irods-icommands \
    && apt-get clean \
    && rm -rf /usr/lib/apt/lists/* 
# && fix-permissions $CONDA_DIR

# Install Jupyter lab
RUN pip install ipython-sql jupyterlab==1.0.9 jupyterlab_sql psycopg2 \
    && conda update -n base conda \
    && conda install -c conda-forge nodejs=13.10.1 \
    && jupyter serverextension enable jupyterlab_sql --py --sys-prefix \
    && jupyter lab build

# install the irods plugin for jupyter lab
RUN pip install jupyterlab_irods==3.0.2 \
    && jupyter serverextension enable --py jupyterlab_irods \
    && jupyter labextension install ijab

# install jupyterlab hub-extension, lab-manager, bokeh
RUN jupyter lab --version \
    && jupyter labextension install @jupyterlab/hub-extension \
    @jupyter-widgets/jupyterlab-manager@1.0 \
    @bokeh/jupyter_bokeh@1.1.0

# install jupyterlab git extension

RUN jupyter labextension install @jupyterlab/git && \
    pip install --upgrade jupyterlab-git && \
    jupyter serverextension enable jupyterlab_git

# install jupyterlab github extension
RUN jupyter labextension install @jupyterlab/github

# Install and configure jupyter lab.
COPY jupyter_notebook_config.json /opt/conda/envs/qiime2-2022.8/etc/jupyter/
RUN jupyter serverextension enable --py qiime2 --sys-prefix

# add Bash kernel
RUN pip install bash_kernel && python3 -m bash_kernel.install 

# Add the qiime2 user so the container doesn't run as root
RUN useradd -d /home/qiime2 -u 1001 qiime2 \
    && chown -R qiime2:qiime2 /home/qiime2
ENV SHELL=bash
# RUN adduser qiime2 sudo
USER qiime2
WORKDIR /home/qiime2

EXPOSE 8888

COPY entry.sh /bin
RUN mkdir -p /home/qiime2/.irods
CMD ehco $(getent passwd | awk -F: '{ print $1}')
ENTRYPOINT ["bash", "/bin/entry.sh"]
