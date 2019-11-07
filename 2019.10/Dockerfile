FROM qiime2/core:2019.10
SHELL ["/bin/bash", "-c"]
USER root

RUN apt-get update \
    && apt-get install -y nodejs less vim htop libpq-dev lsb wget gnupg apt-transport-https python3.6 python-requests curl \
    && apt-get clean \
    && rm -rf /usr/lib/apt/lists/* \
    && fix-permissions $CONDA_DIR

RUN wget -qO - https://packages.irods.org/irods-signing-key.asc | apt-key add - \
    && echo "deb [arch=amd64] https://packages.irods.org/apt/ xenial main" > /etc/apt/sources.list.d/renci-irods.list \
    && apt-get update \
    && apt-get install -y irods-icommands \
    && apt-get clean \
    && rm -rf /usr/lib/apt/lists/* \
    && fix-permissions $CONDA_DIR

RUN pip install ipython-sql jupyterlab==1.0.9 jupyterlab_sql psycopg2 \
    && conda update -n base conda \
    && conda install -c conda-forge nodejs \
    && jupyter serverextension enable jupyterlab_sql --py --sys-prefix \
    && jupyter lab build

# install the irods plugin for jupyter lab
RUN pip install jupyterlab_irods \
    && jupyter serverextension enable --py jupyterlab_irods \
    && jupyter labextension install ijab

# install jupyterlab hub-extension, lab-manager, bokeh, google-drive
RUN jupyter lab --version \
    && jupyter labextension install @jupyterlab/hub-extension \
                                    @jupyter-widgets/jupyterlab-manager \
                                    jupyterlab_bokeh 
             

# Install and configure jupyter lab.
#RUN pip install jupyterlab
COPY jupyter_notebook_config.json /opt/conda/envs/qiime2-2019.10/etc/jupyter/
RUN jupyter serverextension enable --py qiime2 --sys-prefix

# Add the qiime2 user so the container doesn't run as root
RUN useradd -d /home/qiime2 -u 1000 qiime2
RUN chown -R qiime2:qiime2 /home/qiime2
# RUN adduser qiime2 sudo
USER qiime2
WORKDIR /home/qiime2

EXPOSE 8888
#ENTRYPOINT ["jupyter"]
#CMD ["lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]

COPY entry.sh /bin
RUN mkdir -p /home/qiime2/.irods

ENTRYPOINT ["bash", "/bin/entry.sh"]