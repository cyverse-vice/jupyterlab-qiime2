FROM cyversevice/jupyterlab-base:1.0.5
USER jovyan
RUN wget https://data.qiime2.org/distro/core/qiime2-2019.7-py36-linux-conda.yml
RUN conda env create -n qiime2-2019.7 --file qiime2-2019.7-py36-linux-conda.yml
RUN ["/bin/bash", "-c", "source activate qiime2-2019.7 && exec conda install ipykernel"]
RUN ["/bin/bash", "-c", "source activate qiime2-2019.7 && exec ipython kernel install --user --name=qiime2-2019.7"]
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD ["jupyter lab --allow-root --ip=0.0.0.0 --no-browser"]