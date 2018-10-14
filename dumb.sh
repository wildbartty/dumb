#!/usr/bin/bash

start=`date "+%s"`
for ((i = 0; i < (2**32); i++))
do
    if [ $((i % 1000000)) == 0 ]
    then
	echo $i
    fi
done
end=`date "+%s"`

echo "Took $((end-start))"
