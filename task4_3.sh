#!/bin/bash
dir=$1
kol=$2
backup="/tmp/backups/"
nam=`echo ${dir}| cut -c 2- | tr '/' '-'`
echo $nam
if [ $# -ne 2 ]
then
{
echo "Something wrong. Please enter two parameters."
}
exit
fi

if  ! [ -e "$dir" ] && ! [ "$kol" -gt 0 ]
then
echo "Something wrong. please enter full path directory and quantity of backups"
exit
fi


if ! [ -d "$backup" ]
then
mkdir -p $backup
echo $backup "has been created"
fi

tar -cvvzf  $backup$nam"_"`date +%d-%m-%Y_%H_%M_%S`".tgz" $dir


x=1

filemask=$nam"_*.*"

for i in `ls -t $backup$filemask`
        do
          if [ $x -le $kol ]
                then
                ((x++))
                continue
          fi
        rm $i
done

