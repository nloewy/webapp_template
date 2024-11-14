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

# Generate a random secret key
SECRET=$(tr -dc 'a-z0-9-_' < /dev/urandom | head -c50)


echo "Initializing the database..."
psql -U $DBUSER -d $DBNAME -h localhost -f "$BASE_DIR/db/create.sql"

echo "Setup complete!"
