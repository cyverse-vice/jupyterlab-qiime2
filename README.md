[![Project Supported by CyVerse](https://img.shields.io/badge/Supported%20by-CyVerse-blue.svg)](https://learning.cyverse.org/projects/vice/en/latest/) [![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3246932.svg)](https://doi.org/10.5281/zenodo.3246932) [![license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://opensource.org/licenses/GPL-3.0) 

# jupyterlab-qiime2

QIIME 2™ is a next-generation microbiome bioinformatics platform that is extensible, free, open source, and community developed.
Automatically track your analyses with decentralized data provenance — no more guesswork on what commands were run!
Interactively explore your data with beautiful visualizations that provide new perspectives.
Easily share results with your team, even those members without QIIME 2 installed.
Plugin-based system — your favorite microbiome methods all in one place.
There are multiple versions of this app with the latest version being 2019.7.
You can access this app on the cyverse website. 

[![CircleCI](https://circleci.com/gh/cyverse-vice/jupyterlab-qiime2.svg?style=svg)](https://circleci.com/gh/cyversevice/jupyterlab-qiime2) [![DockerHub](https://img.shields.io/badge/DockerHub-brightgreen.svg?style=popout&logo=Docker)](https://hub.docker.com/r/cyversevice/jupyterlab-qiime2)


quick launch | tag | size | metrics | build | status |  
------------ | --- | ---- | ------- | ------|--------|
<a href="https://de.cyverse.org/de/?type=quick-launch&quick-launch-id=a02c1fa2-648b-4cb4-ae40-d5ca5c8cdbb6&app-id=2035c1ce-d031-11e9-a43f-008cfa5ae621" target="_blank"><img src="https://de.cyverse.org/Powered-By-CyVerse-blue.svg"></a> | [![TAG](https://images.microbadger.com/badges/version/cyversevice/jupyterlab-qiime2.svg)](https://microbadger.com/images/cyversevice/jupyterlab-qiime2) | [![SIZE](https://images.microbadger.com/badges/image/cyversevice/jupyterlab-qiime2.svg)](https://microbadger.com/images/cyversevice/jupyterlab-qiime2?color=blue&logo=docker&logoColor=white) | [![Docker Pulls](https://img.shields.io/docker/pulls/cyversevice/jupyterlab-qiime2?color=blue&logo=docker&logoColor=white)](https://hub.docker.com/r/cyversevice/jupyterlab-qiime2) | [![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/cyversevice/jupyterlab-qiime2?color=blue&logo=docker&logoColor=white)](https://hub.docker.com/r/cyversevice/jupyterlab-qiime2) | [![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/cyversevice/jupyterlab-qiime2?color=blue&logo=docker&logoColor=white)](https://hub.docker.com/r/cyversevice/jupyterlab-qiime2)
[![VICE](https://img.shields.io/badge/CyVerse-VICE-blue.svg?style=popout&logo=Docker&color=#1488C6)]() |[![TAG](https://images.microbadger.com/badges/version/cyversevice/jupyterlab-qiime2:2.0.svg)](https://microbadger.com/images/cyversevice/jupyterlab-qiime2:2.0) | [![SIZE](https://images.microbadger.com/badges/image/cyversevice/jupyterlab-qiime2:2.0.svg)](https://microbadger.com/images/cyversevice/jupyterlab-qiime2:2.0) | [![Docker Pulls](https://img.shields.io/docker/pulls/cyversevice/jupyterlab-qiime2?color=blue&logo=docker&logoColor=white)](https://hub.docker.com/r/cyversevice/jupyterlab-qiime2) | [![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/cyversevice/jupyterlab-qiime2?color=blue&logo=docker&logoColor=white)](https://hub.docker.com/r/cyversevice/jupyterlab-qiime2) | [![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/cyversevice/jupyterlab-qiime2?color=blue&logo=docker&logoColor=white)](https://hub.docker.com/r/cyversevice/jupyterlab-qiime2)


# Instructions


## Run Docker locally or on a Virtual Machine

To run the container, you must first pull them from DockerHub, or activate a [CyVerse Account](https://user.cyverse.org/services/mine).

A Docker container hosted on DockerHub.

```
docker pull cyversevice/Jupyterlab-qiime2:2019.7
```

```
docker run -it --rm -d cyversevice/Jupyterlab-qiime2:2019.7
```

## Run Docker container in CyVerse VICE

Unless you plan on making changes to this container, you should just use the existing launch button above.

You can build a new Docker container with additional dependencies from this Docker Hub image by using the `FROM cyversevice/Jupyterlab-qiime2:2019.7` at the beginning of your own Dockerfile.

###### Developer notes

To test the container locally:

```
docker run -it --rm -v /$HOME:/app --workdir /app -p 8888:8888 -e REDIRECT_URL=http://localhost:8888 cyversevice/<CONTAINER-NAME-HERE>:<TAG>
```
