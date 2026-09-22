# tpcds-data
Precomputed TPC-DS data and MD5 sums at different scale factors

You almost certainly want check out this repo using `--depth 1`  to avoid downloading the full history of the data files.

# Scale Factor 1
```shell
# use `sf1` for Scale Factor 1
git clone --single-branch -b sf1  --depth 1 https://github.com/alamb/tpcds-data.git 
cd tpcds-data
# Extract to data directory
cat data.tar.bz2.* | bzip2 -d | tar x
```

# Data
Available branches:

* Scale Factor 1:  https://github.com/alamb/tpcds-data/tree/sf1
* Scale Factor 2:  https://github.com/alamb/tpcds-data/tree/sf2
* Scale Factor 5:  https://github.com/alamb/tpcds-data/tree/sf5

# Introduction
As anyone who has needed to generate TPC-DS data knows, creating the dataset is
a laborious and time consuming process due to the bespoke tools provided by the
TPC organization and the size of the resulting datasets. [`tpchgen-rs`]
is on a mission to make it easy to generate TPC-DS data.

This repository is part of the [`tpchgen-rs`] project, and contains pre-computed
data for testing TPC-DS conformance.  The data in this repo is generated using
the `TPC-DS_Tools_v4.0.0.zip` generator provided by the TPC organization and is
available in multiple scale factors.

[`tpchgen-rs`]: https://github.com/datafusion-contrib/tpcgen-rs

## MD5 Checksums

[MD5SUMS.md] contains checksums for TPC-DS data at various scale factors,
including the data files in this repository, created using the `md5sum` command. 

For example:

### Scale Factor 1
```
cc9aabc63eb8603bd7330b6735ed0961  call_center.dat
0bbac1b8bdcf8ce2d5f0034980ee0196  catalog_page.dat
f7cc7c90d74f59cbf73c36383eaf62cc  catalog_returns.dat
51a0bc401b4b64d94736634b54068240  catalog_sales.dat
abac2e3925ab9bf66cec3b527a0468ed  customer_address.dat
8831872c6d56ea9d4f24701f2feaef48  customer_demographics.dat
a08066ed04041d3370f923a9a3969900  customer.dat
f3e77714328dcc57302777e72fd7747c  date_dim.dat
f922248ed0b69bd426a414fa098da89e  dbgen_version.dat
dccf2ff17c5e420021fbf92bf9a0a5ec  household_demographics.dat
db8e8012be51ef81cf215774bec95533  income_band.dat
cfefc8724693ec9149f1d5b345fcecc2  inventory.dat
bebbcfd1acecdea16a5a3feb5e4deb96  item.dat
acb42558d0dc5e0ab6df5a664c1629cf  promotion.dat
6348c26c002726e0fec79bcb2dd6e7aa  reason.dat
791d16af982a67ad170a6b6527e25a35  ship_mode.dat
0bd723c027e3ff03b457546190537889  store_returns.dat
f003b3810e042d6dd47f48506616d88d  store_sales.dat
80082d03e1b01340e19db3187d8edbd6  store.dat
a68339c5720d25380b53f6e0f2f72333  time_dim.dat
f56789e8b724b989d74e213e0686052f  warehouse.dat
6feef91675c336d6f25e55ebbdf8c13c  web_page.dat
4c413aabff1f06cc23a0d61db4a1df3c  web_returns.dat
15f9d835727f3a39a096c346f56e51f7  web_sales.dat
de5fb00a80673cb44b4b508da75d4bcf  web_site.dat
```

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
cd tpcds-dsdata
cp -R ../DSGen-software-code-4.0.0/tools .
```

## Create Generator Container

The TPC-DS data generator no longer compiles on modern `gcc` versions so we need
to use a Docker container to get the right tools

```shell
docker build -t tpcdsgen .
```

## Create the dataset into the `data` directory

Run the container 
```shell
mkdir -p data
docker run  -v ./data:/data  -it tpcdsgen 
```
And within the container
```shell
gen.sh 1 # Scale Factor 1
```

That takes several minutes. When complete, exit the container

You can also run the container directly, without an interactive terminal, and
generate the data in the background. For example, to create the dataset for
Scale Factor 10, run

```shell
mkdir -p tpcds_data_sf10 && docker run  -v ./tpcds_data_sf10:/data tpcdsgen -- gen.sh 10 &
```

## Split into smaller files

Git and Github does not handle single large files well, so we need to split the
data into multiple smaller files.

Then exit the container and zip the contents of `data` into into multiple
smaller files using

```shell
tar c data | pbzip2 | split -b 20m - data.tar.bz2.
```

Note you can extract the data using this command

```shell
cat data.tar.bz2.* | pbzip2 -d | tar x
```
