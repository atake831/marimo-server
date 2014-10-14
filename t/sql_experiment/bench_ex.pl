#!/usr/bin/perl -w

use strict;
use DBI;
use Time::HiRes;
use QueryBench;

my $file_name = $ARGV[0];
my $loop = $ARGV[1];

unless(defined($file_name) && -e $file_name){
    print "not found\n";
    die;
}

open my $fh ,"<", $file_name;

my $sql = "";
map {$sql .= $_} <$fh>;

my $qb = QueryBench->new();

print $sql . "\n";

#my $num = 2000000;
for (1..$loop){
    my $tmp = $sql;
    my $num = int(rand(2000000)) + 1;
    #$num++;
    $tmp =~ s/\?/$num/g;
    # print "$tmp\n";
    $qb->bench_query($tmp);
}

$qb->print_result;

close $fh;


