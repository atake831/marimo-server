requires 'perl', '5.008001';
requires 'Amon2', '';
requires 'Amon2::Plugin::Web::CSRFDefender', '';
requires 'Text::Xslate', '1.6001';
requires 'Amon2::DBI'                     , '0.30';
requires 'DBD::SQLite'                    , '1.33';
requires 'HTML::FillInForm::Lite'         , '1.11';
requires 'JSON'                           , '2.50';
requires 'Module::Functions'              , '2';
requires 'Module::Find'                   , '0';
requires 'Plack::Middleware::ReverseProxy', '0.09';
requires 'Plack::Middleware::Session'     , '0';
requires 'Plack::Session'                 , '0.14';
requires 'String::CamelCase'              , '0.02';
requires 'Test::WWW::Mechanize::PSGI'     , '0';
requires 'Time::Piece'                    , '1.20';
requires 'Amon2::Web::Dispatcher::RouterSimple::Extended';

### add Module
requires 'FormValidator::Lite'            , '0.37';
requires 'Plack::Middleware::Log::Minimal', '0.06';
requires 'Amon2::Plugin::Web::JSON'       , '';
requires 'Exporter::Constants'            , '0.03';
requires 'YAML::XS'                       , '0.41';

on 'configure' => sub {
   requires 'Module::Build', '0.38';
   requires 'Module::CPANfile', '0.9010';
};

on 'test' => sub {
   requires 'Test::More', '0.98';
};
