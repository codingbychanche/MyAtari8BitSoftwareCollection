# Gets all *.png files from the current directory and replaces the
# sewuence TURTEL with TURTLE in the filename

num=1
for out in $(cat SChset.asm )
do

# This is the command sequence with replaces the disiered caracter sequence with
# the new one.
#
# command: ${string/old/new}

echo $out ${out/*/;}

let "num=num+1"
done