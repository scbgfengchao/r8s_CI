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
###prepare: 	1. make sure software iqtree has been installed;

## Step 2. run iqtree    We recommend to run this step in several nodes at the same times.

outgroup=Atr	##set Outgroup

cd iqtree
for i in {1..2000}
do
iqtree -s 0Seq.$i --prefix 0Seq.$i.GT -bb 1000 -nt AUTO -o $outgroup
done
cd ..