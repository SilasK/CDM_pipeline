# /usr/bin/env bash

# snakemake --version

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


snakefile="$SCRIPT_DIR/workflow/Snakefile"

CONFIG_FILE="./config.yaml"

if [ ! -f "$CONFIG_FILE" ]; then
  # File does not exist, copy the source file to the destination
  cat "Copy config file, change parameters you want."

  cp "$SCRIPT_DIR/config/template_config.yaml" "$CONFIG_FILE"

  exit 0

  
fi


snakemake -s $snakefile --configfile config.yaml \
--rerun-triggers mtime \
--profile slurm \
--jobs 16 \
profile qc \
--use-conda \
$@


