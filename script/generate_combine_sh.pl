#!/usr/bin/perl
use strict;
use warnings;

my (%hash, @arr, $n, $j);

open(FH, "$ARGV[0]") || die($!);
open(FH1, "$ARGV[1]") || die($!);
open(OUT, ">aligned_cds/combine.sh") || die($!);

my $i=0;
while (<FH>) {
	chomp;
	$hash{$i}=$_;
	$i++;
}

$i=0;
while (<FH1>){
	chomp;
	$i++;
	print OUT "paste ";
	@arr=split(" ");
	$n=@arr;
	for ($j=0; $j<$n; $j++){
		print OUT $hash{$arr[$j]}." ";
	}
	print OUT ">../iqtree/Seq".$i."\n";
}

close FH;
close FH1;
close OUT;
