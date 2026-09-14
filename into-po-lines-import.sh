#!/usr/bin/env bash
set -e
xan select "$CSV_SKU_COLUMN,$CSV_Q_COLUMN,$CSV_ADDITIONAL_COLUMNS" < "$1" > sku-qs.csv
xan select "$CSV_SKU_COLUMN" < "$1" | (echo "PK" && tail -n+2 | xargs -I'{}' ./sku-to-pk.sh '{}') > sku-pks.csv
xan cat columns sku-pks.csv sku-qs.csv > po-lines-import.csv
rm -f sku-pks.csv sku-qs.csv
