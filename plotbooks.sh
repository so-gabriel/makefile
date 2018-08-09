for file in books/*.txt;
do
  base=${file%.*}
  python wordcount.py $file $base.csv;
done

for file in books/*.csv;
do
  base=${file%.*}
  python plot.py $file $base.png;
done

filelist=''

for file in books/*.csv;
do
  filelist=$filelist' '$file
done

python plotfigs.py$filelist
