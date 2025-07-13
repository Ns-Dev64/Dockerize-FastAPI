#!/bin/sh

echo "⏳ Waiting for db:5432..."
./wait-for-it.sh db 5432 -- \
    uvicorn main:app --host 0.0.0.0 --port 5002 --reload
