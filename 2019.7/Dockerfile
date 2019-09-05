FROM qiime2/core:2019.7
#USER root
SHELL ["/bin/bash", "-c"]
#RUN source activate qiime2-2019.7

COPY jupyter_notebook_config.json /opt/conda/etc/jupyter/jupyter_notebook_config.json

USER root

RUN apt-get update \
    && apt-get install -y libpq-dev lsb wget gnupg apt-transport-https python3 python-requests curl \
    && apt-get clean \
    && rm -rf /usr/lib/apt/lists/* 

RUN pip install jupyterlab==1.0.5 

#ENTRYPOINT ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--no-browser"]
ENTRYPOINT ["jupyter"]
CMD ["lab", "--no-browser"]

#FROM cyversevice/jupyterlab-base:1.0.5
#USER jovyan
#WORKDIR /home/jovyan
#ENV PATH /opt/conda/envs/qiime2-2019.7/bin/:$PATH
#ENTRYPOINT ["jupyter"]
#CMD ["lab", "--no-browser"] 