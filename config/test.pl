use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
my $dbpath = File::Spec->catfile($basedir, 'db', 'test.db');
+{
    'DBI'=> [
        "dbi:mysql:t", 'root', 'root',
        +{
            PrintError => 0,
            RaiseError => 1,
        }
    ],

    'master' => [
        "dbi:mysql:t", 'root', 'root',
        +{
            AutoCommit => 0,
            PrintError => 0,
            RaiseError => 1,
        }
    ],

    'slave' => [
        "dbi:mysql:t", 'root', 'root',
        +{
            AutoCommit => 0,
            PrintError => 0,
            RaiseError => 1,
        }
    ],
};
