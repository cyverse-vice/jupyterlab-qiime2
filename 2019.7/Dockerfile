FROM qiime2/core:2019.7
SHELL ["/bin/bash", "-c"]
USER root

RUN apt-get update
RUN apt-get install -y sudo nodejs

# Install and configure jupyter lab.
RUN pip install jupyterlab
COPY jupyter_notebook_config.json /opt/conda/envs/qiime2-2019.7/etc/jupyter/
RUN jupyter serverextension enable --py qiime2 --sys-prefix

# Add the qiime2 user so the container doesn't run as root
RUN useradd -d /home/qiime2 -u 1000 qiime2
RUN chown -R qiime2:qiime2 /home/qiime2
RUN adduser qiime2 sudo
USER qiime2
WORKDIR /home/qiime2

EXPOSE 8888
ENTRYPOINT ["jupyter"]
CMD ["lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
