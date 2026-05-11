# tpcds-data
Precomputed TPC-DS data at different scale factors

You almost certainly want check out this repo using `--depth 1`  to avoid downloading the full history of the data files.

# Scale Factor 1
```shell
git clone --single-branch -b sf1  --depth 1 https://github.com/alamb/tpcds-data.git 
cd tpcds-data
cat data.tar.bz2.* | bzip2 -d | tar x
```

# Data
The Pre-computed data for TPC-DS lives on branches:

Scale Factor 1:  https://github.com/alamb/tpcds-data/tree/sf1

# Introduction

This repository is part of the [`tpchgen-rs`] project, and provides pre-computed data for TPC-DS for
use in testing conformance. The data in this repo is generated using the TPC-DS generator provided by the
TPC organization and is available in multiple scale factors.

[`tpchgen-rs`]: https://github.com/clflushopt/tpchgen-rs

As anyone who has needed to generate TPC-DS data knows, creating the dataset is
a laborious and time consuming process due to the bespoke tools provided by the
TPC organization and the size of the resulting datasets. [`tpchgen-rs`] 
is on a mission to make it easy to generate TPC-DS data. 


# Steps to (re) generate the data:

Note many of these steps are originally from https://github.com/apache/datafusion-benchmarks/blob/main/tpcds/README.md

## Download Generator Code

Download the TPC-DS data generator (tpc-ds-tool.zip) from here
https://www.tpc.org/tpc_documents_current_versions/current_specifications5.asp

Unzip the file you get emailed (yes I know) into a directory like this
```bash
unzip YOUR-UUID-TPC-DS-Tool.zip
ls -l
```

Results in
```shell 
drwxr-xr-x@ 131 andrewlamb  staff   4.1K Apr 15  2022 answer_sets/
-rw-r--r--@   1 andrewlamb  staff    17K Apr 15  2022 EULA.txt
drwxr-xr-x@ 108 andrewlamb  staff   3.4K Apr 15  2022 query_templates/
drwxr-xr-x@  17 andrewlamb  staff   544B Apr 15  2022 query_variants/
drwxr-xr-x@   3 andrewlamb  staff    96B Mar 14  2025 specification/
drwxr-xr-x@  70 andrewlamb  staff   2.2K Apr 15  2022 tests/
drwxr-xr-x@ 252 andrewlamb  staff   7.9K May 11 10:03 tools/
```

## Copy Tools Directory

Copy the tools directory to `tools` as the Docker build needs the
`DSGen-software-code-4.0.0/tools` directory in its build context.

```shell
cd tpcds-dsdgen
cp -R ../DSGen-software-code-4.0.0/tools .
```


## Create Generator Container

The TPC-DS data generator no longer compiles on modern `gcc` versions so we need
to use a Docker container to get the right tools

```shell
$ docker build -t tpcdsgen .
```

## Create the dataset into the `data` directory

Run the container 
```shell
mkdir -p data
docker run  -v ./data:/data  -it tpcdsgen 
```
And within the container
```shell
$ gen.sh 1 # Scale Factor 1
```

Then exit the container and zip into multiple smaller files using

```shell
tar c data | pbzip2 | split -b 20m - data.tar.bz2.
```

Extract via

```asm
cat data.tar.bz2.* | pbzip2 -d | tar x
```
