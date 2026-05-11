#!/bin/bash
# Originally from https://github.com/apache/datafusion-benchmarks/blob/cb12c981e6608e0f2dcf919956ada8f1f1622d72/tpcds/gen.sh
# Usage
# gen.sh [scale factor]
scale=$1
if [ -z "$scale" ]; then
  echo "Usage: $0 [scale factor]"
  exit 1
fi
cd /opt/tools
for i in $(seq 1 12); do
  echo "Generating data for part $i in /data/part_$i"
  mkdir -p /data/part_$i
  ./dsdgen -scale $scale \
           -dir /data/part_$i \
           -parallel 12 \
           -child $i \
           -terminate n &
done
wait