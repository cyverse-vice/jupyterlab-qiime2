[![Project Supported by CyVerse](https://img.shields.io/badge/Supported%20by-CyVerse-blue.svg)](https://learning.cyverse.org/projects/vice/en/latest/) [![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip) [![license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://opensource.org/licenses/GPL-3.0) 

# JupyterLab QIIME 2

![qiime2](https://qiime2.org/assets/img/qiime2.svg)

[QIIME 2™](https://qiime2.org/) is a next-generation microbiome bioinformatics platform that is extensible, free, open source, and community developed.

Automatically track your analyses with decentralized data provenance — no more guesswork on what commands were run! Interactively explore your data with beautiful visualizations that provide new perspectives.
Easily share results with your team, even those members without QIIME 2 installed.
Plugin-based system — your favorite microbiome methods all in one place.

There are multiple versions of this app with the latest version being 2022.8.

[![!Harbor](https://github.com/cyverse-vice/jupyterlab-qiime2/actions/workflows/harbor.yml/badge.svg)](https://github.com/cyverse-vice/jupyterlab-qiime2/actions) ![GitHub commits since tagged version](https://img.shields.io/github/commits-since/cyverse-vice/jupyterlab-qiime2/latest/main?style=flat-square) 

| quick launch | 
| ------------ | 
| <a href="https://de.cyverse.org/apps/de/cc77b788-bc45-11eb-9934-008cfa5ae621/launch" target="_blank"><img src="https://img.shields.io/badge/QIIME 2-2022.8-orange?style=plastic&logo=jupyter"></a> |

## Run Docker Image locally or on a Virtual Machine

```
docker pull harbor.cyverse.org/vice/jupyter/qiime2:2022.8
```

```
docker run -it --rm -p 8888:8888 harbor.cyverse.org/vice/jupyter/qiime2:2022.8
```

To test the container locally:

```
docker run -it --rm -p 8888:8888 -e REDIRECT_URL=http://localhost:8888 harbor.cyverse.org/vice/jupyter/qiime2:2022.8
```

## Run Docker container in CyVerse VICE

Unless you plan on making changes to this container, you should just use the existing launch button above.

You can build a new Docker container with additional dependencies from this Docker Hub image by using the `FROM harbor.cyverse.org/vice/jupyter/qiime2:2022.8` at the beginning of your own Dockerfile.
