# Inventree Order Import
A set of scripts for importing purchase orders into Inventree based on supplier's order exports. No supplier APIs, just CSV manipulation and good vibes.

## Installation
These scripts require [`xan`](https://github.com/medialab/xan) to be installed. Otherwise, just clone the repo and use the scripts inside:

```sh
git clone https://github.com/mmalecki/inventree-order-import.git
cd inventree-order-import
cp .env.example .env
# edit and source .env according to your shell
```

## Usage

### From XLS export
I use [`xlsx2csv`](https://github.com/dilshod/xlsx2csv) for converting XLS exports (such as Mouser's) into CSVs consumed by this project.

### Parts import
Parts need to be imported before being imported. My preferred way of doing this is using `inventree-part-import`,
which `import-parts.sh` automates, for example:

```sh
./import-parts.sh <order>.csv # will launch a series of inventree-part-import with all parts in order
```

### Purchase order line items import
Line items import into purchase order is supported, but only for files containing supplier part's primary key.
This is handled by the `into-po-lines-import.sh` script:

```sh
`./into-po-lines-import.sh <order>.csv # will output importable line items
```
