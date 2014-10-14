use strict;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use Plack::Builder;

use RakuMeshi::Web;
use RakuMeshi;
use Plack::Session::Store::DBI;
use Plack::Session::State::Cookie;
use DBI;

use Plack::Middleware::Log::Minimal;
use RakuMeshi::Model::DbhDispatcher;

use RakuMeshi::Constants;

{
    my $c = RakuMeshi->new();
    $c->setup_schema();
}

builder {
    enable 'Plack::Middleware::Log::Minimal', autodump => 1;

    enable 'Plack::Middleware::Static',
        path => qr{^(?:/static/)},
        root => File::Spec->catdir(dirname(__FILE__));
    enable 'Plack::Middleware::Static',
        path => qr{^(?:/robots\.txt|/favicon\.ico)$},
        root => File::Spec->catdir(dirname(__FILE__), 'static');
    enable 'Plack::Middleware::ReverseProxy';
    enable 'Plack::Middleware::Session',
        store => Plack::Session::Store::DBI->new(
            get_dbh => \&RakuMeshi::Model::DbhDispatcher::get_dbh_for_autocommit 
        ),
        state => Plack::Session::State::Cookie->new(
            httponly => 1,
            # 一週間
            expires => 7 * 24 * 60 * 60, 
            # fastCGI + httpsの場合1にする
            #secure => 1,
        );

    RakuMeshi::Web->to_app();
};

