#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Use: script dir toBeReplaced withThis"
else
  find $1 -type f -exec sed -i -e "s/$2/$3/g" {} \;
fi
