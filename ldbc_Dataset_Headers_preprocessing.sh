#!/bin/bash

echo "starting preprocessing"

export DATA_DIR=../ldbc_snb_datagen/social_network/dynamic
export POSTFIX=_0_0.csv

# replace headers (dynamic data) this could be improved to change just the first line to improve speed, it takes a few min and should be instantaneous...
while read line; do
  IFS=' ' read -r -a array <<< $line
  filename=${array[0]}
  header=${array[1]}
  echo "Starting to process file ${filename} using header ${header}"
  sed -i.bkp "1s/.*/$header/" "${DATA_DIR}/${filename}${POSTFIX}"
  echo "Finished processing file ${filename}"
done < headers_dynamic.txt

# replace headers (static data) this could be improved to change just the first line to improve speed...
export DATA_DIR=../ldbc_snb_datagen/social_network/static
while read line; do
  IFS=' ' read -r -a array <<< $line
  filename=${array[0]}
  header=${array[1]}
  echo "Starting to process file ${filename} using header ${header}"
  sed -i.bkp "1s/.*/$header/" "${DATA_DIR}/${filename}${POSTFIX}"
  echo "Finished processing file ${filename}"
done < headers_static.txt

# replace labels with one starting with an uppercase letter
sed -i.bkp "s/|city$/|City/" "${DATA_DIR}/place${POSTFIX}"
sed -i.bkp "s/|country$/|Country/" "${DATA_DIR}/place${POSTFIX}"
sed -i.bkp "s/|continent$/|Continent/" "${DATA_DIR}/place${POSTFIX}"
sed -i.bkp "s/|company|/|Company|/" "${DATA_DIR}/organisation${POSTFIX}"
sed -i.bkp "s/|university|/|University|/" "${DATA_DIR}/organisation${POSTFIX}"

# convert each date of format yyyy-mm-dd to a number of format yyyymmddd
# sed -i.bkp "s#|\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]\)|#|\1\2\3|#g" "${DATA_DIR}/person${POSTFIX}"

# convert each datetime of format yyyy-mm-ddThh:mm:ss.mmm+0000
# to a number of format yyyymmddhhmmssmmm
# sed -i.bkp "s#|\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]\)T\([0-9][0-9]\):\([0-9][0-9]\):\([0-9][0-9]\)\.\([0-9][0-9][0-9]\)+0000#|\1\2\3\4\5\6\7#g" ${DATA_DIR}/*${POSTFIX}

# removing .bkp files
rm ${DATA_DIR}/*.bkp

echo "preprocessing finished"
