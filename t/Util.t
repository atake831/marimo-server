use strict;
use warnings;
use t::Util;
use Plack::Test;
use Plack::Util;
use Test::More;

use RakuMeshi::Model::Util;

my @test_cases = (
    ['1,2', '1,2,3', '1,2,3'],


);

foreach my $case ( @test_cases ) {
    is(RakuMeshi::Model::Util->merge_tags_text($case->[0], $case->[1]), $case->[2]);
}


done_testing;
