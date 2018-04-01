#!/bin/bash
dir=$1
kol=$2
date=`date +%d-%m-%Y_%H_%M`
name=`$dir | cut -c 2- | sed 'y/\//\-/'`.`$date`.tar.gz

if [ $# -ne 2 ]
then 
{
echo "Something wrong. Please enter two parameters."
}
exit 1
fi

if  [ -e "$dir" ] && [ "$kol" -gt 0 ]
then 
exit 0
else
echo "Something wrong. please enter full path directory and quantity of backups"
exit 1

fi

if [ -d /tmp/backups ]
then
exit 0
else
mkdir -p /tmp/backups

backup=/tmp/backups

echo $backup "has been created"
#fi







#tar -czvf $dir -C $backup $name



#x=1

#for i in `ls -t $dir/$name`
#	do
#if [ "$x" -le "$kol" ]
#	then
#	((x++))
#	continue
#	fi 
#		rm $i
#done

