#!/usr/bin/env bash
set -e
curl "$INVENTREE_URL/api/company/part/" --url-query "SKU=$1" -H "authorization: $INVENTREE_AUTH" | jq '.[0].pk'
