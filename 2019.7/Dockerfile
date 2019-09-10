FROM cyversevice/jupyterlab-base:1.0.5

USER jovyan

####INSTALL QIIME2 AND CREATE CONDA ENVIRONMENT####

RUN wget https://data.qiime2.org/distro/core/qiime2-2019.7-py36-linux-conda.yml
RUN conda env create -n qiime2-2019.7 --file qiime2-2019.7-py36-linux-conda.yml

###DISABLE TOKEN PROMPT####

USER root

RUN apt-get update \
        && apt-get install -y jq \
        && cd /opt/conda/etc/jupyter \
        && mv jupyter_notebook_config.json jupyter_notebook_config.json.bak \
        && jq '.NotebookApp = .NotebookApp + {"token":"","password":""}' jupyter_notebook_config.json.bak \
            > jupyter_notebook_config.json \
        && rm jupyter_notebook_config.json.bak

###CHANGE ENVIRONMENT PATH###

ENV PATH /opt/conda/envs/qiime2-2019.7/bin/:$PATH

USER jovyan


####RUN QIIME2 W/ IPYKERNEL####

RUN ["/bin/bash", "-c", "source activate qiime2-2019.7 && exec jupyter serverextension enable --py qiime2 --sys-prefix"]

RUN ["/bin/bash", "-c", "source activate qiime2-2019.7 && exec conda install ipykernel"]

RUN ["/bin/bash", "-c", "source activate qiime2-2019.7 && exec ipython kernel install --user --name=qiime2-2019.7"]

####MORE TOKEN STUFF####

USER root

RUN cd /opt/conda/envs/qiime2-2019.7/etc/jupyter/ \
        && mv jupyter_notebook_config.json jupyter_notebook_config.json.bak \
        && jq '.NotebookApp = .NotebookApp + {"token":"","password":""}' jupyter_notebook_config.json.bak \
            > jupyter_notebook_config.json \
        && rm jupyter_notebook_config.json.bak

USER jovyan

ENTRYPOINT [ "/bin/bash", "-c" ]

####OPEN IN JUPYTER NOTEBOOK - DOES NOT WORK IN JUPYTER LAB FOR SOME REASON ####

CMD ["jupyter notebook --allow-root --ip=0.0.0.0 --no-browser"]

