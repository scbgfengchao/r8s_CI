#!/usr/bin/perl
use strict;
use warnings;

my (@arr, $len);

open(FH, "r8s.pre.input") || die($!);
open(OUT, ">r8s.input") || die($!);

while (<FH>){
	chomp;
	@arr=split("\t");
print OUT "#NEXUS\n\n";
print OUT "Begin trees;\n";
print OUT "tree PAUP_1 = "."$arr[0]\n";
print OUT "End;\n\n";
print OUT "begin r8s;\n";
$len=$arr[1]-1;
print OUT "blformat nsites=".$len." lengths=persite;\n";
print OUT "collapse;\n\n";
print OUT "fixage taxon=mono_eudicots age=177.1;\n";
print OUT "constrain taxon=crown_FO min_age=44.3;\n";
print OUT "constrain taxon=stem_Brassicales min_age=89.8;\n\n";
print OUT "set seed=3 num_time_guesses=3 num_restarts=3 maxiter=3000 verbose=0;\n";
print OUT "set smoothing=1;\n\n";
print OUT "set ftol=1e-5;\n";
print OUT "divtime method=PL algorithm=TN;\n";
print OUT "describe plot=phylogram;\n";
print OUT "describe plot=chronogram;\n";
print OUT "describe plot=tree_description;\n";
print OUT "describe plot=chrono_description;\n";
print OUT "describe plot=phylo_description;\n";
print OUT "describe plot=rato_description;\n";
print OUT "showage;\n\n";
print OUT "end;\n\n\n";
}

close FH;
close OUT;