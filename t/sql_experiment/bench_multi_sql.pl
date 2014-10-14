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

my @sql = ();
@sql = <$fh>;

my $qb = QueryBench->new();

my $num = 2_000_000;
for (1..$loop){
    $num++;
    for my $sql_tmp (@sql){
        my $tmp = $sql_tmp;
        $tmp =~ s/\?/$num/g;
        print "$tmp\n";
        $qb->bench_query($tmp);
    }
}

$qb->print_result;

close $fh;


