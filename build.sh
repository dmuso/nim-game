#!/bin/bash

echo removing existing binary...
rm -f helpzero

echo building...
nim c -d:release helpzero.nim
