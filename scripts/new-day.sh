#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 xxx \"Day xx: <Title>\""
  exit 1
fi

# echo "Day is: $1"
# echo "Title is: $2"

cp -r ../day-xxx ../day-$1
sed -i '' "s/TITLE/$2/" ../day-$1/README.md
