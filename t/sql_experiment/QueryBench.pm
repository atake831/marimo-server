#!/usr/bin/perl -w

package QueryBench;

use strict;
use DBI;
use Time::HiRes;

sub new {
    my $class = shift; 
    my $self = {};
    $self->{dbi} = DBI->connect(
        "dbi:mysql:test_RakuMeshi:localhost","root","root",
        +{
            PrintError => 0,
            RaiseError => 1,
        }
    );
    bless $self, $class; 
}

sub DESTROY {
    my $self = shift;
    $self->{dbi}->disconnect;
}

sub init {
    my $self = shift;
    $self->{total_time} = 0;
    $self->{total_query} = 0;
}

sub bench_query {
    my $self = shift;
    my $query = shift;
    my $dbh = $self->{dbi}->prepare($query);

    eval{
        my $start_time = Time::HiRes::time;
        $dbh->execute;
        $self->{total_time} += Time::HiRes::time - $start_time;
        $self->{total_query}++;
    };
    print "$@\n" if $@;

    $dbh->finish;
}

sub print_result {
    my $self = shift;
    printf "time: %.4f sec\n", $self->{total_time}; 
    printf "qps: %.4f query\n", ($self->{total_query} / $self->{total_time}); 
}


1;


