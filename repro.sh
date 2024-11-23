#!/usr/bin/env bash

rm -rf .devbox
rm -rf .sub-project/.devbox

(
  echo STARTING SUB-PROJECT DEVBOXES
  for n in {1..12}; do
    (
      devbox -c ./sub-project run hello
      echo "subproject $n done"
    ) &
  done
) &

echo STARTING ROOT DEVBOXES
for n in {1..6}; do
  (
    devbox run hello
    echo "done ($n)"
  ) &
done

for n in {1..18}; do
  wait
done
