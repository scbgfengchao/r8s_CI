#!/usr/bin/perl
# 
use strict;
use warnings;
 
my %sns;
for (1 .. $ARGV[0]) {
    my $range = $ARGV[1];
    my $no;
    do {
       $no = int rand($range);
    } while (exists $sns{$no});
    $sns{$no} = 1;
}
 
print join(" ", keys %sns), "\n";