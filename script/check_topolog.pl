#!/usr/bin/perl
use strict;
use warnings;

my (@arr, $n, $i, $Atr);

open(FH, "2k.contre") || die($!);
open(OUT, ">2k.contre.clean") || die($!);

while (<FH>) {
	chomp;
	s/:/\t/g;
	s/,/\t,\t/g;
	s/\(/\t\(\t/g;
	s/\)/\t\)\t/g;
	@arr=split("\t");
	$n=@arr;
	for ($i=0;$i<$n;$i++){
		if ($arr[$i] =~ /\d$/){
		}else{
			print OUT "$arr[$i]";
		}
	}
	print OUT "\n";
}
close FH;
close OUT;

open(FH1, "2k.contre.clean") || die($!);
open(OUT1, ">iqtree.filter.id") || die($!);

my $j=0;

while (<FH1>){
	chomp;
	$j++;
	if (/\(\(\(\(\(\(Ama,\(\(Him,Tgr\),Sin\)\),\(Bhy,Phu\)\),\(Fex,Oeu\)\),\(Sly,Stu\)\),\(\(\(Ath,Tca\),Ptr\),Vvi\)\),Atr,\(Mac,Osa\)\);/){
		print OUT1 "0Seq.$j\n";
	}
}

close FH1;
close OUT1;