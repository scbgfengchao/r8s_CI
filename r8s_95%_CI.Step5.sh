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
###prepare: 	1. exchange the '937' in line 29 as the lines of r8s.pre.input

## Step 5. pick r8s divergence

Num4=42  ### replace this number according to the result of r8s
Num5=30  ### replacee this number according to the result of r8s

j=0
for i in {1..937}       
do
	tail -$Num4 r8s/00Seq.$i.r8s.result |head -$Num5 | sed 's/ //g' | sed 's/----/--\t--/' |awk '{print $5}' >r8s/00Seq.$i.r8s.divergence
done

paste r8s/*.divergence >00Divergence

## We calculated final 95%_CI using excel.

