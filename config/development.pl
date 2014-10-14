use RakuMeshi::Constants qw/CONST_M/;
+{
    # sequence, sessionsのアクセスのみ
    CONST_M('REPLI_ST_AUTO')=> [
        'dbi:mysql:development', 'root', 'root',
        +{
            PrintError => 0,
            RaiseError => 1,
        }
    ],

    CONST_M('REPLI_ST_MASTER')=> [
        'dbi:mysql:development', 'root', 'root',
        +{
            AutoCommit => 0,
            PrintError => 0,
            RaiseError => 1,
        }
    ],

    CONST_M('REPLI_ST_SLAVE')=> [
        'dbi:mysql:development', 'root', 'root',
        +{
            # slaveで更新系クエリは走らせない
            AutoCommit => 1,
            PrintError => 0,
            RaiseError => 1,
        }
    ],
};
