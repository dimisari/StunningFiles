#!/bin/bash

tmpFile=/tmp/commandOutput.txt
$@ > $tmpFile
vim $tmpFile
rm $tmpFile
