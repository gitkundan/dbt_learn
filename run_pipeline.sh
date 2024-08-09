#!/bin/bash
# run_pipeline.sh

# Run ingestion
cd ingestion
poetry run python src/main.py

# Run transformation
# Load environment variables
set -a
source .env
set +a

# Run dbt
cd transformation
dbt run

cd ../transformation
dbt run