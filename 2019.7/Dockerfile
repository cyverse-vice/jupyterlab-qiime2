FROM cyversevice/jupyterlab-base:1.0.5

USER root



# Download qiime2 yml file
RUN wget https://data.qiime2.org/distro/core/qiime2-2019.7-py36-linux-conda.yml

# create conda environment for qiime2
RUN conda env create -n qiime2-2019.7 --file qiime2-2019.7-py36-linux-conda.yml \
    && rm qiime2-2019.7-py36-linux-conda.yml

USER jovyan

WORKDIR /home/jovyan

ENV PATH /opt/conda/envs/qiime2-2019.7/bin/:$PATH

ENTRYPOINT ["jupyter"]

CMD ["lab", "--no-browser"] 
