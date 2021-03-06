truncate table user;
insert into user values(
    1, 'root', '竹口', '輝', 'たけぐち', 'あきら', 'example@test.com', 
    'lJx/t9aHF85wThRZ7lSdvOHdVpY', '1402096725', '0', 0

),
(
    2, 'test', '田中', '太郎', 'たなか', 'たろう', 'tanaka@test.com', 
    'X8WAmRxG5ekFfzEBx61M+6RafnA', '1402196725', '0', 0
),
(
    3, 'master', '森', '健太', 'もり', 'けんた', 'kennta@test.com', 
    'KwRSU1Ig5SCsMcg9+VL6+aZsuPM', '1402197725', '0', 0
),
(
    4, 'none', '無', '無', 'ぬる', 'ぬる', 'null@test.com', 
    'bkbMEulvxZZjTcJgH3Q7+U0o24A', '1402197725', '0', 0
);

truncate table recipe;
insert into recipe values(
    1, 1, '4分で簡単ハムエッグ', '卵x1、ハムx1', -4, -1, 
    'レンジ調理鍋に卵を割り入れて、
    ハム、キャベツ(オススメです^^)を入れて、
    レンジで4分チンするだけで、油なしな
    ヘルシーハムエッグができちゃいます！
    後片付けは紙タオルで拭けばOKです。
    私はこの4分の間に朝の支度を進めます！
    朝弱い方にオススメです(笑)',
    '朝食もレンジ調理鍋で素早く料理しましょう！',
    100, '1402176825', 0
),
(
    2, 1, 'テストタイトル2', 'テスト材料2', -5, -5,
    'テスト調理方法2', 'テストらくテク2', 1000, 1402197825, 0
),
(
    3, 1, 'テストタイトル3', 'テスト材料3', -5, -5,
    'テスト調理方法3', 'テストらくテク3', 50, 1402199825, 0
),
(
    4, 1, 'テストタイトル4', 'テスト材料4', -5, -5,
    'テスト調理方法4', 'テストらくテク4', 100, 1402206825, 0
),
(
    5, 1, 'テストタイトル5', 'テスト材料5', -5, -5,
    'テスト調理方法5', 'テストらくテク5', 10, 1402306825, 0
),
(
    6, 2, '田中タイトル1', '田中材料1', -5, -5,
    '田中調理方法1', '田中らくテク1', 1000, 1402206825, 0
),
(
    7, 2, '田中タイトル2', '田中材料2', -5, -5,
    '田中調理方法2', '田中らくテク2', 1000, 1402216825, 0
),
(
    8, 2, '田中タイトル3', '田中材料3', -5, -5,
    '田中調理方法3', '田中らくテク3', 1000, 1402226825, 0
),
(
    9, 2, '田中タイトル4', '田中材料4', -5, -5,
    '田中調理方法4', '田中らくテク4', 1000, 1402256825, 0
),
(
    21, 1, '竹口レシピ化投稿', 'レシピ材料', -3, -2, 
    'すんごい調理方法', 'すんごいテクニック', 120, '1402405825', 0
),
(
    23, 3, '森レシピ1', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    24, 3, '森レシピ2', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    25, 3, '森レシピ3', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    26, 3, '森レシピ4', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    27, 3, '森レシピ5', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    28, 3, '森レシピ6', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    29, 3, '森レシピ7', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    30, 3, '森レシピ8', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    31, 3, '森レシピ9', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    32, 3, '森レシピ10', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    33, 3, '森レシピ11', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    34, 3, '森レシピ12', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    35, 3, '森レシピ13', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    36, 3, '森レシピ14', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    37, 3, '森レシピ15', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    38, 3, '森レシピ16', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    39, 3, '森レシピ17', 'レシピ材料', -3, -2, 
    '森調理方法', '森らくテク', 121, '1302415825', 0
),
(
    17, 2, 'らくらく田中4', '材料！！', -9, -3, 
    '調理方法は教えない', 'らくテク', 1500, '1402487825', 0
);

truncate table short_recipe;
insert into short_recipe values(
    10, 1, 'らくらく竹口1', '-4', 100, '1402197825', 0, 0, 0
),
(
    11, 1, 'らくらく竹口2', '-2', 300, '1402207825', 0, 0, 0
),
(
    12, 1, 'らくらく竹口3', '-6', 200, '1402237825', 0, 0, 0
),
(
    13, 1, 'らくらく竹口4', '-9', 50, '1402257825', 0, 0, 0
),
(
    14, 2, 'らくらく田中1', '-4', 200, '1402297825', 0, 0, 0
),
(
    15, 2, 'らくらく田中2', '-2', 100, '1402307825', 0, 0, 0
),
(
    16, 2, 'らくらく田中3', '-6', 120, '1402377825', 0, 0, 0
),
(
    17, 2, 'らくらく田中4', '-9', 1000, '1402387825', 0, 1, 0
),
(
    18, 1, 'らくらく竹口5', '-7', 499, '1402397825', 0, 0, 0
),
(
    19, 1, 'らくらく竹口6', '-8', 1000, '1402401825', 0, 0, 0
),
(
    20, 2, 'らくらく田中5', '-3', 30, '1402404825', 0, 0, 0
),
(
    21, 1, '竹口レシピ化投稿', '-3', 501, '1402404825', 0, 1, 1
),
(
    40, 2, 'over30日', '-3', 101, '1202404825', 0, 0, 0
);

truncate table user_recipe;
insert into user_recipe values(1,6,'1402404825');
insert into user_recipe values(2,1,'1402404825');

truncate table user_short_recipe;
insert into user_short_recipe values(1,17,'1402404825',0);

truncate table tag;
insert into tag values(1, '早い', '1');
insert into tag values(2, '安い', '3');

truncate table recipe_tag;
insert into recipe_tag values(1,1,100);
insert into recipe_tag values(1,2,100);
insert into recipe_tag values(21,2,120);

truncate table short_recipe_tag;
insert into short_recipe_tag values(21,2,501);

truncate table notice;

truncate table sequence_recipe_and_short_recipe_id;
truncate table sequence_user_id;
truncate table sequence_tag_id;
insert into sequence_recipe_and_short_recipe_id values(40);
insert into sequence_user_id values(4);
insert into sequence_tag_id values(2);

insert into map_for_daily_ranking_recipe values(1405350000, 1);
