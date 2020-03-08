#!/bin/bash

#!/bin/bash

###___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________ 
### 
###Program name:	r8s_95%_CI.sh
###
###Function:	calculate 95% CI of r8s software
###
###Author:	Chao Feng (chaofeng@scbg.ac.cn)
###
###Release date:	Mar. 7th, 2020
###
###Version:	version 1.0
###
###prepare: 	1. put aligned single-copy gene (cds sequences) in format of examples (## deleat this example before your work) in the fold named aligned_cds;

### Step 1. generate 2000 replicates of [$Num1] non repated random number from [0 to $Num2].

Num2=582	##set Num2 as the number of aligned sequences - 1
Num1=29		##recommend as 5-10% of the aligned sequences

rm -rf Random.2K

for i in {1..2000}		 ##bootstrap: 2000
do
	perl script/random.pl $Num1 $Num2 >>Random.2K    ##generate 2000 replicates of [$Num1] non repated random number from [0 to $Num2].
done

rm -rf iqtree
mkdir iqtree

cd aligned_cds
find * >../CDS.list
cd ..
perl script/generate_combine_sh.pl CDS.list Random.2K
cd aligned_cds
sh combine.sh
rm -rf combine.sh
cd ../iqtree
sed -i 's/\t//g' *
sed -i 's/>/\t>/g' *
for i in {1..2000}		##bootstrap: 2000
do
	awk '{print $1}' Seq$i >0Seq.$i
	rm -rf Seq$i
done

