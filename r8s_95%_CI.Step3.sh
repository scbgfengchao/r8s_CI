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
###prepare: 	1. replace the original topology in the line 37 of check_topology.pl into your known topology;
###		2. replace the original rooted tree in the line 39 of unrooted2root.pl into your final rooted tree;
###		3. replace the original r8s input files in generate_r8s_input.pl into your r8s input files


## Step 3. check topology and prepare the input file for r8s

cd iqtree
rm -rf ../2k.contre

for i in {1..2000}
do
cat 0Seq.$i.GT.contree >>../2k.contre
done

cd ..

perl script/check_topolog.pl      ##put candicate topology in the line 37 of check_topology.py

files=`cat iqtree.filter.id`
for file in $files
do
perl script/unroot2root.pl iqtree/${file}
cat iqtree/${file}.rooted.tree >>tree
head -2 iqtree/${file} | tail -1 | wc -c >>len
done

paste tree len >r8s.pre.input
rm -rf len tree iqtree.filter.id
cd iqtree
rm -rf *.nex *.mldist *.treefile *.bionj *.iqtree *.tree *.gz
cd ..

perl script/generate_r8s_input.pl



