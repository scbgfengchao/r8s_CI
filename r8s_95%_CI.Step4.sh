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
###prepare: 	1. make sure software r8s has been installed;
###		2. replace the '937' in line 29 to the lines of r8s.pre.input

## Step 4. run r8s

Num3=30  ### set as the lines of units of r8s.input (from #NEXUS to #NEXUS)

rm -rf r8s
mkdir r8s

j=0
for i in {1..937}       
do
 	let "j+=$Num3";
	head -$j r8s.input | tail -$Num3 >r8s/00Seq.$i.r8s.nex
	r8s -b -f r8s/00Seq.$i.r8s.nex >r8s/00Seq.$i.r8s.result
done

