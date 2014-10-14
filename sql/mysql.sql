CREATE TABLE IF NOT EXISTS sessions (
    id                      char(72)    NOT NULL, # ID
    session_data            TEXT        NOT NULL, # セッションID
    PRIMARY KEY                         (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

CREATE TABLE IF NOT EXISTS recipe  (
    id                      int         unsigned NOT NULL, # レシピID
    user_id                 int         unsigned NOT NULL, # ユーザID
    title                   varchar(25)          NOT NULL, # レシピのタイトル
    materials               varchar(100)         NOT NULL, # 材料
    cooking_time_m          tinyint              NOT NULL, # (逆順)調理時間
    num_washing_m           tinyint              NOT NULL, # (逆順)洗い物の数
    how_to_cook             varchar(500)         NOT NULL, # 調理方法
    rakuteku                varchar(100)                 , # らくテク(任意)
    rakuuma_point           int         unsigned NOT NULL, # らくうま！ポイント
    created_at              int         unsigned NOT NULL, # レシピ作成日時
    updated_rakuuma_at      int         unsigned NOT NULL, # らくうま数の更新日時

    PRIMARY KEY                         (id),
    UNIQUE                              (title),
    KEY u_r_idx                         (user_id,rakuuma_point),
    KEY u_c_idx                         (user_id,created_at),
    KEY c_idx                           (created_at),
    KEY ura_idx                         (updated_rakuuma_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS short_recipe  (
    id                      int         unsigned NOT NULL, # らくらく投稿ID(recipe.idと同じ採番)
    user_id                 int         unsigned NOT NULL, # ユーザID
    title                   varchar(25)          NOT NULL, # らくらく投稿のタイトル
    cooking_time_m          tinyint              NOT NULL, # (逆順)調理時間
    kininaru_point          int         unsigned NOT NULL, # 気になる！ポイント
    created_at              int         unsigned NOT NULL, # 投稿日時
    updated_kininaru_at     int         unsigned NOT NULL, # 気になる数の更新日時
    flag_made_recipe        tinyint     unsigned NOT NULL, # 1 = レシピ化された
    flag_already_notice     tinyint     unsigned NOT NULL, # 1 = 500気になるを超えたときの
                                                           # お知らせをしたかどうか
    PRIMARY KEY                         (id),
    UNIQUE                              (title),
    KEY u_c_idx                         (user_id,created_at),
    KEY u_k_idx                         (user_id,kininaru_point),
    KEY u_f_k_idx                       (user_id,flag_made_recipe,kininaru_point),
    KEY c_idx                           (created_at),
    KEY k_idx                           (kininaru_point)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS user  (
    id                      int         unsigned NOT NULL, # ユーザID
    login_id                varchar(15)          NOT NULL, # ログインID UNIQUE
    surname_kanji           varchar(10)          NOT NULL, # 名字：漢字
    name_kanji              varchar(15)          NOT NULL, # 名前：漢字
    surname_hiragana        varchar(20)          NOT NULL, # 名字：ひらがな
    name_hiragana           varchar(20)          NOT NULL, # 名前：ひらがな
    mail_address            varchar(254)         NOT NULL, # メールアドレス UNIQUE
    password                char(50)             NOT NULL, # パスワード
    created_at              int         unsigned NOT NULL, # 会員登録日時
    updated_at              int         unsigned NOT NULL, # 更新日時
    flag_deleted            tinyint     unsigned NOT NULL, # 論理削除のフラグ

    PRIMARY KEY                         (id),
    UNIQUE                              (login_id),
    UNIQUE                              (mail_address)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS tag  (
    id                      int         unsigned NOT NULL, # タグID
    tag_name                varchar(10)          NOT NULL, # タグ名 UNIQUE 
    count_tagged_recipes    int         unsigned NOT NULL, # レシピに関連付けされた数
    PRIMARY KEY                         (id),
    UNIQUE KEY                          (tag_name),
    KEY count_tagged_recipes_idx        (count_tagged_recipes)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

/* ------------------------------------------------- */
/* N:N */

CREATE TABLE IF NOT EXISTS notice (
    user_id                 int         unsigned NOT NULL, # ユーザID 
    notice_type             tinyint     unsigned NOT NULL, # 1: kininaru_point > 500
                                                           # 2: clicked short_recipe -> recipe
    trigger_id              int         unsigned NOT NULL, # 対象のらくらく投稿ID
                                                           # お知らせの原因となるID
    flag_checked            tinyint     unsigned NOT NULL, # お知らせが確認されたら1となる
    created_at              int         unsigned NOT NULL, # お知らせが作成された日時

    PRIMARY KEY                         (user_id, trigger_id),
    KEY created_at_idx                  (created_at),
    KEY trigger_id_idx                  (trigger_id)       # 削除用

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS user_recipe (
    user_id                 int         unsigned NOT NULL, # ユーザID
    recipe_id               int         unsigned NOT NULL, # レシピID
    created_at              int         unsigned NOT NULL, # らくうま！を押した日時
    PRIMARY KEY                         (recipe_id, user_id),
    KEY user_id_created_at_idx          (user_id, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS user_short_recipe  (
    user_id                 int         unsigned NOT NULL, # ユーザID
    short_recipe_id         int         unsigned NOT NULL, # らくらく投稿ID
    created_at              int         unsigned NOT NULL, # 気になる！を押した日時
    flag_already_notice     tinyint     unsigned NOT NULL, # 1=気になる！したらくらく投稿のレシピ化お知らせをした
    PRIMARY KEY                         (short_recipe_id, user_id),
    KEY user_id_created_at_idx          (user_id, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS recipe_tag  (
    recipe_id               int         unsigned NOT NULL, # レシピID
    tag_id                  int         unsigned NOT NULL, # タグID
    # summaryテーブルを使用しない場合 
    rakuuma_point           int         unsigned NOT NULL, # らくうまポイント

    PRIMARY KEY                         (recipe_id, tag_id),
    # KEY tag_id_idx                      (tag_id)
    # summaryテーブルを使用しない場合 
    KEY tag_id_rakuuma_idx              (tag_id, rakuuma_point)

) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS short_recipe_tag  (
    short_recipe_id         int         unsigned NOT NULL, # らくらく投稿ID
    tag_id                  int         unsigned NOT NULL, # タグID
    # summaryテーブルを使用しない場合 
    kininaru_point          int         unsigned NOT NULL, # 気になるポイント

    PRIMARY KEY                         (short_recipe_id, tag_id),
    # KEY tag_id_idx                      (tag_id)
    # summaryテーブルを使用しない場合 
    KEY tag_id_kininaru_idx              (tag_id, kininaru_point)

) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

/* ------------------------------------------------- */
/* rank */
CREATE TABLE IF NOT EXISTS map_for_daily_ranking_recipe (
    newest_date             int         unsigned NOT NULL, # 最新ランキングの日付をunix_timeで保持
    table_map               tinyint     unsigned NOT NULL, # 参照テーブルのマッピング
    PRIMARY KEY                         (newest_date, table_map)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
truncate table map_for_daily_ranking_recipe;

CREATE TABLE IF NOT EXISTS daily_ranking_recipe_1 (
    day                     tinyint     unsigned NOT NULL, # 1~31:対象のランキングの日
                                                           # ランキングは1ヶ月保持のため使い回す
    rank                    tinyint     unsigned NOT NULL, # 1~200:ランク
    recipe_id               int         unsigned NOT NULL, # レシピID
    daily_rakuuma_point     int         unsigned NOT NULL, # デイリーらくうまポイント
    PRIMARY KEY                         (day, rank)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS daily_ranking_recipe_2 (
    day                     tinyint     unsigned NOT NULL, # 1~31:対象のランキングの日
                                                           # ランキングは1ヶ月保持のため使い回す
    rank                    tinyint     unsigned NOT NULL, # 1~200:ランク
    recipe_id               int         unsigned NOT NULL, # レシピID
    daily_rakuuma_point     int         unsigned NOT NULL, # デイリーらくうまポイント
    PRIMARY KEY                         (day, rank)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

/* ------------------------------------------------- */
/* sequence table */

CREATE TABLE IF NOT EXISTS sequence_recipe_and_short_recipe_id  (
        id           int         unsigned NOT NULL,
        PRIMARY KEY                     (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS sequence_user_id  (
        id             int         unsigned NOT NULL,
        PRIMARY KEY                     (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS sequence_tag_id  (
        id              int         unsigned NOT NULL,
        PRIMARY KEY                     (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8; 



