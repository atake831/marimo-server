#!/usr/bin/perl -w

use strict;
use DBI;
use Time::HiRes;

my $file_name = $ARGV[0];
my $loop = $ARGV[1];

unless(defined($file_name) && -e $file_name){
    print "not found\n";
    die;
}

open my $fh ,"<", $file_name;

my $sql = "";
map {$sql .= $_} <$fh>;

my $dbi = DBI->connect(
    "dbi:mysql:test_RakuMeshi:localhost","root","root",
    +{
        PrintError => 0,
        RaiseError => 1,
    }
);

my $dbh = $dbi->prepare($sql);

print $sql . "\n";

my $start_time = Time::HiRes::time;
for (1..$loop){
    $dbh->execute;
}

my $spent_time = Time::HiRes::time - $start_time;
printf "time: %.4f sec\n", $spent_time; 
printf "qps: %.4f query\n", ($loop / $spent_time); 

$dbh->finish;
close $fh;


