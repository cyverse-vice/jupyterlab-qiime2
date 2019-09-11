FROM qiime2/core:2019.7

SHELL ["/bin/bash", "-c"]

USER root

# Install and configure jupyter lab.
RUN pip install jupyterlab
COPY jupyter_notebook_config.json /opt/conda/envs/qiime2-2019.7/etc/jupyter/
RUN jupyter serverextension enable --py qiime2 --sys-prefix

ENTRYPOINT ["jupyter"]

CMD ["lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
