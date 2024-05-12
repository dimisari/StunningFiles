#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Use: script toBeReplaced withThis"
else
  find . -type f -exec sed -i -e "s/$1/$2/g" {} \;
fi
