#!/usr/bin/env bash
set -e
CSV_MPN_COLUMN="7"
xan select "$CSV_MPN_COLUMN" < "$1" | xan behead > parts.csv
xargs -a parts.csv -I'{}' inventree-part-import '{}'
rm -f parts.csv
