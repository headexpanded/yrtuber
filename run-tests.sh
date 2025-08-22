#!/bin/bash

# Script to run Laravel tests in isolated testing environment
# Usage: ./run-tests.sh [test-filter]

set -e

echo "Starting testing environment..."

# Start the testing service
docker compose --profile testing up -d testing

# Wait for the testing service to be ready
echo "Waiting for testing service to be ready..."
sleep 5

# Run migrations and seed the test database
echo "Setting up test database..."
docker compose exec testing php artisan migrate:fresh --seed

# Run tests (with optional filter)
if [ $# -eq 0 ]; then
    echo "Running all tests..."
    docker compose exec testing php artisan test
else
    echo "Running tests with filter: $1"
    docker compose exec testing php artisan test --filter="$1"
fi

# Stop the testing service
echo "Stopping testing environment..."
docker compose --profile testing stop testing

echo "Testing completed!"
