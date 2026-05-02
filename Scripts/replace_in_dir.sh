#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Use: script toBeReplaced withThis"
else
  find . -type f -exec sed -i -E "s/$1/$2/g" {} \;
fi
