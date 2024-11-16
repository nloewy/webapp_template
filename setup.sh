#!/bin/bash

# ======= Configuration Section =======
# Change these values to suit your application
# ====================================

# Check if we're in a virtual environment
if [[ "$VIRTUAL_ENV" == "" ]]; then
    echo "Please activate your virtual environment before running setup.sh"
    exit 1
fi

# Directory where the script resides
BASE_DIR=$(dirname "$0")

echo "Initializing the database..."
psql -U $DBUSER -h localhost -d postgres -c "DROP DATABASE IF EXISTS $DBNAME;"
psql -U $DBUSER -h localhost -d postgres -c "CREATE DATABASE $DBNAME;"
psql -U $DBUSER -h localhost -d $DBNAME -f "$BASE_DIR/db/create.sql"

echo "Setup complete!"
