#!/bin/sh

cat ./extensions | while read line
do
  echo 0 | code --install-extension $line # When newer version exsists, inputing '0' is installing that
done