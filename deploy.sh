#!/bin/bash

echo " Deploying Liferay workspace plugins ..."

destination=./runtime/liferay/deploy

widget_home=./liferay-workspace/build

IFS=$'\n'
for i in $(find $widget_home/* -name 'liferay-*.zip' -not -path '*node_modules*'  );
do
    echo "Copying $i to $destination"		
    cp -f $i $destination

done
unset IFS

IFS=$'\n'
for i in $(find $widget_home/* -name 'liferay-*.jar' -not -path '*node_modules*'  );
do
    echo "Copying $i to $destination"		
    cp -f $i $destination

done
unset IFS

chmod -R 777 $destination/*





