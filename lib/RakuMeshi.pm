package RakuMeshi;
use strict;
use warnings;
use parent qw/Amon2/;
our $VERSION='3.87';
use 5.008001;

use RakuMeshi::Model::DbhDispatcher;

# initialize database
sub setup_schema {
    my $self = shift;

    my $dbh = RakuMeshi::Model::DbhDispatcher->get_dbh_for_autocommit;
    my $fname = "sql/mysql.sql";
    open my $fh1, '<:encoding(UTF-8)', $fname or die "$fname: $!";
    my $source = do { local $/; <$fh1> };
    for my $stmt (split /;/, $source) {
        next unless $stmt =~ /\S/;
        $dbh->do($stmt) or die $dbh->errstr();
    }

    # for debug
    # testデータのsetup 
    $fname = "sql/test_data.sql";
    open my $fh2, '<:encoding(UTF-8)', $fname or die "$fname: $!";
    $source = do { local $/; <$fh2> };
    for my $stmt (split /;/, $source) {
        next unless $stmt =~ /\S/;
        $dbh->do($stmt) or die $dbh->errstr();
    }
}


1;
