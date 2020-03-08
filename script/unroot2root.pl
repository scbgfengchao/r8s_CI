#!/usr/bin/perl
use strict;
use warnings;

my (@arr, $n, $i, $Atr);

open(FH, "$ARGV[0].GT.contree") || die($!);
open(OUT, ">$ARGV[0].tmp1") || die($!);

while (<FH>) {
	chomp;
	s/\)/\t\)\t/g;
	s/:/\t:/g;
	@arr=split ("\t");
	$n=@arr;
	for ($i=0;$i<$n;$i++){
		if ($arr[$i] =~ /^\d+$/){
		}else{
			print OUT "$arr[$i]";
		}
	}	
	print OUT "\n";
}

close FH;
close OUT;

open(FH1, "$ARGV[0].tmp1") || die($!);
open(OUT1, ">$ARGV[0].rooted.tree") || die($!);

while (<FH1>) {
	chomp;
	s/\):/\)\t:/g;
	s/,Atr:/\t/;
	s/,\(Mac/\t,\(Mac/;
	s/;//;
	@arr=split("\t");
	$Atr=$arr[14]/2;
	print OUT1 "\(".$arr[0].$arr[1].$arr[2].$arr[3].$arr[4].$arr[5]."crown_FO".$arr[6].$arr[7].$arr[8].$arr[9]."stem_Brassicales".$arr[10].$arr[11].$arr[12].$arr[13].$arr[15].$arr[16]."mono_eudicots:".$Atr.",Atr:".$Atr."\);\n";
}
close FH1;
close OUT1;