package t::UtilModel;
use strict; 
use warnings;
use utf8;
use Test::More;

sub check_order {
    my $class = shift;
    my $rows = shift;
    my $col_name = shift;
    for (my $n = 1 ; $n < @$rows ; $n++) {
        ok($rows->[$n-1]->{$col_name} >= $rows->[$n]->{$col_name});
    }
}

sub check_user_id {
    my $class = shift;
    my $rows = shift;
    my $user_id = shift;
    for (my $n = 0 ; $n < @$rows ; $n++) {
        ok($rows->[$n]->{user_id} == $user_id);
    }
}

1;
