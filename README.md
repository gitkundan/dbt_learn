Let's break down each component:

1. dbt_project.yml: This is the main configuration file for your dbt project.

2. analyses/: Contains SQL files for ad-hoc analyses that don't need to be materialized.

3. macros/: Stores reusable Jinja macros for your project.

4. models/: This is where most of your data transformation logic resides.

    a) staging/: Contains models that clean and standardize raw data.
    b) intermediate/: Houses models that combine and transform staged data.
    c) marts/: Stores final, business-ready data models.
    d) seeds/: Holds CSV files that can be loaded as tables in your data warehouse.

5. snapshots/: Contains configurations for slowly changing dimension (SCD) tables.

6. tests/: Stores custom data tests to ensure data quality.

To set up this structure, you can use the dbt init command, which creates a basic project structure. You can then customize it by adding the subdirectories within the models/ folder.

#!/bin/bash

# Load environment variables
set -a
source .env
set +a

# Run dbt
cd transformation
dbt run
