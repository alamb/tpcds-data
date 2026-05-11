# tpcds-data
Precomputed TPC-DS data at different scale factors

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

[`tpchgen-rs`]: https://github.com/clflushopt/tpchgen-rs

## MD5 Checksums

Here are the MD5 checksums for the data files in this repository, created using the `md5sum` command:

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

### Scale Factor 2
```
bef1a10fc927e16686340cdfbfd8888f  call_center.dat
0bbac1b8bdcf8ce2d5f0034980ee0196  catalog_page.dat
db82d8a648f185542a199460456cfc19  catalog_returns.dat
e6f8ae62af240b74610de425ff9672a2  catalog_sales.dat
7d48270ba8a9c2b80b0e4a2235340749  customer_address.dat
8831872c6d56ea9d4f24701f2feaef48  customer_demographics.dat
e7aa6bb3749c63217fc78ba542c97b3e  customer.dat
f3e77714328dcc57302777e72fd7747c  date_dim.dat
9a397524c5ac9efa4f41c89ed94bb3d2  dbgen_version.dat
dccf2ff17c5e420021fbf92bf9a0a5ec  household_demographics.dat
db8e8012be51ef81cf215774bec95533  income_band.dat
7946b67c1088f2dd686b9a5438bda5eb  inventory.dat
4c4b2282d888d1a6c342091ab4937adc  item.dat
427f683a237d4785bc26569c406cd394  promotion.dat
6348c26c002726e0fec79bcb2dd6e7aa  reason.dat
791d16af982a67ad170a6b6527e25a35  ship_mode.dat
187610bc6ead0f903d7e6a4528fae935  store_returns.dat
1e236e974690712200e6a0d5d1580528  store_sales.dat
a0cb7c50dad7c8af169709af37e97ff8  store.dat
a68339c5720d25380b53f6e0f2f72333  time_dim.dat
f56789e8b724b989d74e213e0686052f  warehouse.dat
5af09e941be37b6422879f9530be1c57  web_page.dat
3734ca5e96b0ef8dcf1130a35abce898  web_returns.dat
4ae58b7f7f0b77e4aa780506a342332e  web_sales.dat
de5fb00a80673cb44b4b508da75d4bcf  web_site.dat
```

### Scale Factor 5
```
9dc867ca9a5eafb648364f97daf5413a  call_center.dat
0bbac1b8bdcf8ce2d5f0034980ee0196  catalog_page.dat
7595e1cf463462d6a0ac2b506d6ed334  catalog_returns.dat
5c470ef9ee066f08cca88eb2cd5301b1  catalog_sales.dat
0b0cf1f590a517d337c5427f8fcb9709  customer_address.dat
8831872c6d56ea9d4f24701f2feaef48  customer_demographics.dat
2dd8524e852611c2dfc3fbed583f69eb  customer.dat
f3e77714328dcc57302777e72fd7747c  date_dim.dat
5c59f534b6798b3f67abbfa2aa08e843  dbgen_version.dat
dccf2ff17c5e420021fbf92bf9a0a5ec  household_demographics.dat
db8e8012be51ef81cf215774bec95533  income_band.dat
85f184fc5e7fb8b5ea35e3fa075ac64d  inventory.dat
8062fcb75490a4a7271ec8c1d53273dc  item.dat
69486ca6d06c5e870f033fd68f24fa51  promotion.dat
6348c26c002726e0fec79bcb2dd6e7aa  reason.dat
791d16af982a67ad170a6b6527e25a35  ship_mode.dat
41b2c8f0f7f0ebdfcf0670efbdefbb74  store_returns.dat
8fff967ba3b22ff70fe9af415fea5ed5  store_sales.dat
e143989584ef5ed3543247a84413fc66  store.dat
a68339c5720d25380b53f6e0f2f72333  time_dim.dat
33d55e78a95d1b00f185683faa2ad5e3  warehouse.dat
f1dd90bf021a9eb35c148eab24b753fe  web_page.dat
2053a293df0d9b0dbbe56a1af406d143  web_returns.dat
1edb176aea071bbefc0b4bd82553c305  web_sales.dat
25da541de4a7c1c26e7d06bff05d09b9  web_site.dat
```


### Scale Factor 10
```
235909679f4d125e769aa38eb16e9098  call_center.dat
a5daa0d93ecde8bd9f6ed79cd3b63916  catalog_page.dat
80edc08ff51fc5cff5af0a1aa688502b  catalog_returns.dat
97d5351b430d6c15e3906518315f0787  catalog_sales.dat
860602fea368111009ef08b167e1e299  customer_address.dat
8831872c6d56ea9d4f24701f2feaef48  customer_demographics.dat
7842d4e8c9fc489c8c9ad7cf6d6064af  customer.dat
f3e77714328dcc57302777e72fd7747c  date_dim.dat
487d9d0ee4131eed4e28149cd566fde2  dbgen_version.dat
dccf2ff17c5e420021fbf92bf9a0a5ec  household_demographics.dat
db8e8012be51ef81cf215774bec95533  income_band.dat
4ad3640917c6567038f081bbe2cf0e3e  inventory.dat
bff29691c74ae66eb2dcc3af686fb2ba  item.dat
b8e8a7741f64edc5d09fdb0453c86705  promotion.dat
6348c26c002726e0fec79bcb2dd6e7aa  reason.dat
791d16af982a67ad170a6b6527e25a35  ship_mode.dat
69cff9a87e4609cc819d795547588992  store_returns.dat
ecff92350fa0466e9b9407a1b5ad4020  store_sales.dat
430a01467a2d55d0e9a1bebad4f1c44b  store.dat
a68339c5720d25380b53f6e0f2f72333  time_dim.dat
e0c56fe622774d09c9dec42029881ad5  warehouse.dat
e55695fdb2b86f96cf46e2a55b6f3748  web_page.dat
247dc93969b021f02b9909cc75140ec9  web_returns.dat
4da375300bcb0ce8785e1f100fb72efe  web_sales.dat
4669d52e36cd112af10e137e5d8d7697  web_site.dat
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
cd tpcds-dsdgen
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
