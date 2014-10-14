use strict;
use warnings;
use Test::More;

use_ok $_ for qw(
    RakuMeshi
    RakuMeshi::Web
    RakuMeshi::Web::View
    RakuMeshi::Web::ViewFunctions
    RakuMeshi::Web::Dispatcher

    RakuMeshi::Web::C::Account
    RakuMeshi::Web::C::My
    RakuMeshi::Web::C::Recipe
    RakuMeshi::Web::C::Root
    RakuMeshi::Web::C::ShortRecipe

    RakuMeshi::Model
    RakuMeshi::Model::DbhDispatcher
    RakuMeshi::Model::Validation
    RakuMeshi::Model::DB
    RakuMeshi::Model::DB::Recipe
    RakuMeshi::Model::DB::ShortRecipe
    RakuMeshi::Model::DB::User

);

done_testing;
