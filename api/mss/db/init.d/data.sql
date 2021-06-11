CREATE TABLE m_a_la_carte (
    id VARCHAR(20) BINARY NOT NULL,
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    type VARCHAR(20) BINARY NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE m_cource (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) BINARY NOT NULL,
	price INT NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_cource_content (
	id VARCHAR(20) BINARY NOT NULL,
	cource_id VARCHAR(20) BINARY NOT NULL,
	a_la_carte_id VARCHAR(20) BINARY NOT NULL,
	no INT NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_foodstuff (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) NOT NULL,
	amount_unit VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_recipe (
	id VARCHAR(20) BINARY NOT NULL,
	a_la_carte_id VARCHAR(20) BINARY NOT NULL,
	foodstuff_id VARCHAR(20) NOT NULL,
	amount FLOAT NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_a_la_carte_type (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_settlement (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_country (
        code VARCHAR(2) NOT NULL,
        name VARCHAR(255) BINARY NOT NULL UNIQUE,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL,
        PRIMARY KEY (code)
);

CREATE TABLE m_wholesaler (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	postal_code VARCHAR(255) NOT NULL,
	representative_name VARCHAR(255) NOT NULL,
	phone_number VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_industry (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) BINARY NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_position (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) BINARY NOT NULL,
	rank VARCHAR(255),
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE m_inflow_route (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE t_reserve (
	id VARCHAR(20) BINARY NOT NULL,
	visit_id VARCHAR(20) NOT NULL,
	dish_id VARCHAR(20) NOT NULL,
	is_a_la_carte BOOLEAN NOT NULL,
	count INT NOT NULL,
	reserved_dt DATETIME NOT NULL,
	remarks VARCHAR(255),
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE t_visit (
	id VARCHAR(20) BINARY NOT NULL,
	representative_user_id VARCHAR(20) BINARY NOT NULL,
	visited_dt DATETIME NOT NULL,
	vistor_count INT NOT NULL,
	settlement_type_id VARCHAR(20) BINARY NOT NULL,
	remarks VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE t_order (
	id VARCHAR(20) BINARY NOT NULL,
	visit_id VARCHAR(20) NOT NULL,
	course_id VARCHAR(20) NOT NULL,
	count INT NOT NULL,
	remarks VARCHAR(255),
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE t_stock (
	id VARCHAR(20) BINARY NOT NULL,
	foodstuff_id VARCHAR(20) BINARY NOT NULL,
	amount FLOAT NOT NULL,
	order_dt DATETIME,
	settlement_type_id VARCHAR(20) BINARY NOT NULL,
	wholesaler_id VARCHAR(20) BINARY NOT NULL,
	remarks VARCHAR(255),
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE t_user (
	id VARCHAR(20) BINARY NOT NULL,
	name VARCHAR(255) NOT NULL,
	ruby VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	birth_day VARCHAR(255) NOT NULL,
	age INT NOT NULL,
	phone_number VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	work_place VARCHAR(255),
	industry_id VARCHAR(20) BINARY,
	position_id VARCHAR(20) BINARY,
	job_description VARCHAR(255),
	register_dt DATETIME NOT NULL,
	introducer_id VARCHAR(20) BINARY,
	inflow_route_id VARCHAR(20) BINARY NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO m_a_la_carte (id, name, price, type, created_at, updated_at)
VALUES ('alacarte000000000001', '海の幸とフルーツ 新鮮野菜のサラダ仕立て 野菜のエスプーマと共に', 1200, 'alacartetype00000001',NOW(), NOW()),
('alacarte000000000002', 'お魚のカルパッチョ 季節の野菜添え',  1000, 'alacartetype00000002',NOW(), NOW()),
('alacarte000000000003', '生ハムとフルーツ＆野菜のサラダ バルサミコソース', 1200, 'alacartetype00000003',NOW(), NOW()),
('alacarte000000000004', 'ぎんぎん風 野菜いっぱいサラダ 自家製ドレッシング', 600, 'alacartetype00000003',NOW(), NOW()),
('alacarte000000000005', '魚介と野菜のスープ ブイヤベース仕立て', 1500, 'alacartetype00000004',NOW(), NOW()),
('alacarte000000000006', 'コーンクリームスープ', 500, 'alacartetype00000004',NOW(), NOW()),
('alacarte000000000007', '本日のお魚2種のポワレ 3種のソース プロヴァンス風', 1500, 'alacartetype00000005',NOW(), NOW()),
('alacarte000000000008', '活オマール海老のロースト ソースアメリケーヌ&トマト(1尾)', 5000, 'alacartetype00000005',NOW(), NOW()),
('alacarte000000000009', '牛フィレ肉のステーキ　ぎんぎん風　温野菜添え', 2000, 'alacartetype00000006',NOW(), NOW()),
('alacarte000000000010', 'フォアグラのソテー 大根と温野菜添え マデラソース', 4000, 'alacartetype00000006',NOW(), NOW()),
('alacarte000000000011', 'フランス産チーズの盛り合わせ(3種)', 1000, 'alacartetype00000011',NOW(), NOW()),
('alacarte000000000012', 'お漬物盛り合わせ', 300, 'alacartetype00000011',NOW(), NOW()),
('alacarte000000000013', '自家製デザートの盛り合わせ', 800, 'alacartetype00000012',NOW(), NOW()),
('alacarte000000000014', 'シャーベット&アイスとフルーツの盛り合わせ', 600, 'alacartetype00000012',NOW(), NOW()),
('alacarte000000000015', 'コーヒー(お茶菓子付き)', 600, 'alacartetype00000013',NOW(), NOW());

INSERT INTO m_a_la_carte_type (id, name, created_at, updated_at)
VALUES ('alacartetype00000001', '前菜', NOW(), NOW()),
('alacartetype00000002', 'オードブル', NOW(), NOW()),
('alacartetype00000003', 'サラダ', NOW(), NOW()),
('alacartetype00000004', 'スープ', NOW(), NOW()),
('alacartetype00000005', '魚料理', NOW(), NOW()),
('alacartetype00000006', '肉料理', NOW(), NOW()),
('alacartetype00000007', 'パスタ', NOW(), NOW()),
('alacartetype00000008', 'グラタン', NOW(), NOW()),
('alacartetype00000009', 'リゾット', NOW(), NOW()),
('alacartetype00000010', 'アヒージョ', NOW(), NOW()),
('alacartetype00000011', 'e.t.c.', NOW(), NOW()),
('alacartetype00000012', 'デザート', NOW(), NOW()),
('alacartetype00000013', 'ドリンク', NOW(), NOW());

INSERT INTO m_country (code, name, created_at, updated_at)
VALUES ('jp', '日本', NOW(), NOW()),
('us', 'アメリカ合衆国', NOW(), NOW()),
('it', 'イタリア', NOW(), NOW()),
('fr', 'フランス', NOW(), NOW()),
('be', 'ベルギー', NOW(), NOW()),
('de', 'ドイツ', NOW(), NOW()),
('gb', 'イギリス', NOW(), NOW()),
('es', 'スペイン', NOW(), NOW());

INSERT INTO m_cource (id, name, price, created_at, updated_at)
VALUES ('cource00000000000001',  'Aコース', 5000, NOW(), NOW()),
('cource00000000000002',  'Bコース', 10000, NOW(), NOW()),
('cource00000000000003',  'Cコース', 20000, NOW(), NOW());

INSERT INTO m_cource_content (id, cource_id, a_la_carte_id, no, created_at, updated_at)
VALUES ('courcecontent0000001', 'cource00000000000001', 'alacarte000000000002', 1, NOW(), NOW()),
('courcecontent0000002', 'cource00000000000001', 'alacarte000000000009', 2, NOW(), NOW()),
('courcecontent0000003', 'cource00000000000001', 'alacarte000000000013', 3, NOW(), NOW()),
('courcecontent0000004', 'cource00000000000002', 'alacarte000000000001', 1, NOW(), NOW()),
('courcecontent0000005', 'cource00000000000002', 'alacarte000000000004', 2, NOW(), NOW()),
('courcecontent0000006', 'cource00000000000002', 'alacarte000000000006', 3, NOW(), NOW()),
('courcecontent0000007', 'cource00000000000002', 'alacarte000000000007', 4, NOW(), NOW()),
('courcecontent0000008', 'cource00000000000002', 'alacarte000000000014', 5, NOW(), NOW()),
('courcecontent0000009', 'cource00000000000002', 'alacarte000000000009', 6, NOW(), NOW()),
('courcecontent0000010', 'cource00000000000002', 'alacarte000000000013', 7, NOW(), NOW()),
('courcecontent0000011', 'cource00000000000002', 'alacarte000000000015', 8, NOW(), NOW()),
('courcecontent0000012', 'cource00000000000003', 'alacarte000000000001', 1, NOW(), NOW()),
('courcecontent0000013', 'cource00000000000003', 'alacarte000000000003', 2, NOW(), NOW()),
('courcecontent0000014', 'cource00000000000003', 'alacarte000000000005', 3, NOW(), NOW()),
('courcecontent0000015', 'cource00000000000003', 'alacarte000000000008', 4, NOW(), NOW()),
('courcecontent0000016', 'cource00000000000003', 'alacarte000000000014', 5, NOW(), NOW()),
('courcecontent0000017', 'cource00000000000003', 'alacarte000000000010', 6, NOW(), NOW()),
('courcecontent0000018', 'cource00000000000003', 'alacarte000000000013', 7, NOW(), NOW()),
('courcecontent0000019', 'cource00000000000003', 'alacarte000000000015', 8, NOW(), NOW());

INSERT INTO m_foodstuff (id, name, amount_unit, created_at, updated_at)
VALUES ('foodstuff00000000001', 'オレンジ', '玉', NOW(), NOW()),
('foodstuff00000000002', '海老', '尾', NOW(), NOW()),
('foodstuff00000000003', 'レタス', '玉', NOW(), NOW()),
('foodstuff00000000004', '紫キャベツ', '玉', NOW(), NOW()),
('foodstuff00000000005', 'トマト', '個', NOW(), NOW()),
('foodstuff00000000006', 'モモ', '個', NOW(), NOW()),
('foodstuff00000000007', 'カキ', '個', NOW(), NOW()),
('foodstuff00000000008', 'スズキ', '切', NOW(), NOW()),
('foodstuff00000000009', 'オリーブオイル', 'ml', NOW(), NOW()),
('foodstuff00000000010', 'バルサミコ酢', 'ml', NOW(), NOW()),
('foodstuff00000000011', 'エスカルゴ', 'ヶ', NOW(), NOW()),
('foodstuff00000000012', 'ニンジン', '本', NOW(), NOW()),
('foodstuff00000000013', '料理用赤ワイン', 'ml', NOW(), NOW()),
('foodstuff00000000014', 'ソルト', 'g', NOW(), NOW()),
('foodstuff00000000015', 'コショウ', 'g', NOW(), NOW()),
('foodstuff00000000016', 'ローズマリー', '枚', NOW(), NOW()),
('foodstuff00000000017', '生ハム', 'g', NOW(), NOW()),
('foodstuff00000000018', 'リンゴ', '玉', NOW(), NOW()),
('foodstuff00000000019', 'ドレッシング', 'ml', NOW(), NOW()),
('foodstuff00000000020', '帆立', '個', NOW(), NOW()),
('foodstuff00000000021', 'ムール貝', '個', NOW(), NOW()),
('foodstuff00000000022', 'ジャガイモ', '個', NOW(), NOW()),
('foodstuff00000000023', 'コーン', '本', NOW(), NOW()),
('foodstuff00000000024', '牛乳', 'ml', NOW(), NOW()),
('foodstuff00000000025', 'タラ', '切', NOW(), NOW()),
('foodstuff00000000026', '牛フィレ肉', 'g', NOW(), NOW()),
('foodstuff00000000027', 'フォアグラ', 'g', NOW(), NOW()),
('foodstuff00000000028', 'パスタ', 'g', NOW(), NOW()),
('foodstuff00000000029', 'たらこ', 'g', NOW(), NOW()),
('foodstuff00000000030', 'ブルーチーズ', 'g', NOW(), NOW()),
('foodstuff00000000031', 'カッテージチーズ', 'g', NOW(), NOW()),
('foodstuff00000000032', 'モッツァレラチーズ', 'g', NOW(), NOW()),
('foodstuff00000000033', 'しめじ', 'g', NOW(), NOW()),
('foodstuff00000000034', 'エリンギ', '本', NOW(), NOW()),
('foodstuff00000000035', 'しいたけ', '個', NOW(), NOW()),
('foodstuff00000000036', '砂糖', 'g', NOW(), NOW()),
('foodstuff00000000037', '小麦粉', 'g', NOW(), NOW()),
('foodstuff00000000038', 'オマール海老', '尾', NOW(), NOW()),
('foodstuff00000000039', 'コーヒー粉', 'g', NOW(), NOW()),
('foodstuff00000000040', 'チョコ', '個', NOW(), NOW());

INSERT INTO m_industry (id, name, created_at, updated_at)
VALUES ('industry000000000001', 'IT', NOW(), NOW()),
('industry000000000002', 'コンサルティング', NOW(), NOW()),
('industry000000000003', '芸能', NOW(), NOW()),
('industry000000000004', '政界', NOW(), NOW()),
('industry000000000005', '製造業', NOW(), NOW());

INSERT INTO m_inflow_route (id, name, created_at, updated_at)
VALUES ('inflowroute000000001', '既存の知人', NOW(), NOW()),
('inflowroute000000002', '通常の紹介', NOW(), NOW()),
('inflowroute000000003', 'ビジネスパートナー', NOW(), NOW()),
('inflowroute000000004', 'イベント', NOW(), NOW()),
('inflowroute000000005', 'HP', NOW(), NOW()),
('inflowroute000000006', 'SNS', NOW(), NOW()),
('inflowroute000000007', 'チラシ', NOW(), NOW());

INSERT INTO m_position (id, name, rank, created_at, updated_at)
VALUES ('position000000000001', '会社員', '代表', NOW(), NOW()),
('position000000000002', '会社員', '部長', NOW(), NOW()),
('position000000000003', '会社員', '課長', NOW(), NOW()),
('position000000000004', '会社員', '係長', NOW(), NOW()),
('position000000000005', '会社員', '主任', NOW(), NOW()),
('position000000000006', '会社員', null, NOW(), NOW()),
('position000000000007', 'フリーランス', null, NOW(), NOW());

INSERT INTO m_recipe (id, a_la_carte_id, foodstuff_id, amount, created_at, updated_at)
VALUES ('recipe00000000000001', 'alacarte000000000001', 'foodstuff00000000002', 3, NOW(), NOW()),
('recipe00000000000002', 'alacarte000000000001', 'foodstuff00000000007', 3, NOW(), NOW()),
('recipe00000000000003', 'alacarte000000000001', 'foodstuff00000000001', 0.25, NOW(), NOW()),
('recipe00000000000004', 'alacarte000000000001', 'foodstuff00000000006', 0.25, NOW(), NOW()),
('recipe00000000000005', 'alacarte000000000002', 'foodstuff00000000008', 0.5, NOW(), NOW()),
('recipe00000000000006', 'alacarte000000000002', 'foodstuff00000000003', 0.25, NOW(), NOW()),
('recipe00000000000007', 'alacarte000000000002', 'foodstuff00000000005', 0.5, NOW(), NOW()),
('recipe00000000000008', 'alacarte000000000002', 'foodstuff00000000009', 30, NOW(), NOW()),
('recipe00000000000009', 'alacarte000000000002', 'foodstuff00000000010', 10, NOW(), NOW()),
('recipe00000000000010', 'alacarte000000000002', 'foodstuff00000000015', 3, NOW(), NOW()),
('recipe00000000000011', 'alacarte000000000003', 'foodstuff00000000017', 30, NOW(), NOW()),
('recipe00000000000012', 'alacarte000000000003', 'foodstuff00000000006', 0.25, NOW(), NOW()),
('recipe00000000000013', 'alacarte000000000003', 'foodstuff00000000003', 0.25, NOW(), NOW()),
('recipe00000000000014', 'alacarte000000000003', 'foodstuff00000000004', 0.25, NOW(), NOW()),
('recipe00000000000015', 'alacarte000000000003', 'foodstuff00000000005', 0.5, NOW(), NOW()),
('recipe00000000000016', 'alacarte000000000003', 'foodstuff00000000010', 30, NOW(), NOW()),
('recipe00000000000017', 'alacarte000000000004', 'foodstuff00000000002', 5, NOW(), NOW()),
('recipe00000000000018', 'alacarte000000000004', 'foodstuff00000000003', 0.5, NOW(), NOW()),
('recipe00000000000019', 'alacarte000000000004', 'foodstuff00000000004', 0.25, NOW(), NOW()),
('recipe00000000000020', 'alacarte000000000004', 'foodstuff00000000019', 30, NOW(), NOW()),
('recipe00000000000021', 'alacarte000000000004', 'foodstuff00000000005', 0.5, NOW(), NOW()),
('recipe00000000000022', 'alacarte000000000005', 'foodstuff00000000004', 0.5, NOW(), NOW()),
('recipe00000000000023', 'alacarte000000000005', 'foodstuff00000000005', 2, NOW(), NOW()),
('recipe00000000000024', 'alacarte000000000005', 'foodstuff00000000002', 3, NOW(), NOW()),
('recipe00000000000025', 'alacarte000000000005', 'foodstuff00000000020', 3, NOW(), NOW()),
('recipe00000000000026', 'alacarte000000000005', 'foodstuff00000000021', 3, NOW(), NOW()),
('recipe00000000000027', 'alacarte000000000006', 'foodstuff00000000023', 1, NOW(), NOW()),
('recipe00000000000028', 'alacarte000000000006', 'foodstuff00000000024', 300, NOW(), NOW()),
('recipe00000000000029', 'alacarte000000000007', 'foodstuff00000000008', 1, NOW(), NOW()),
('recipe00000000000030', 'alacarte000000000007', 'foodstuff00000000025', 1, NOW(), NOW()),
('recipe00000000000031', 'alacarte000000000007', 'foodstuff00000000010', 30, NOW(), NOW()),
('recipe00000000000032', 'alacarte000000000007', 'foodstuff00000000005', 1, NOW(), NOW()),
('recipe00000000000033', 'alacarte000000000008', 'foodstuff00000000038', 1, NOW(), NOW()),
('recipe00000000000034', 'alacarte000000000008', 'foodstuff00000000005', 3, NOW(), NOW()),
('recipe00000000000035', 'alacarte000000000009', 'foodstuff00000000026', 100, NOW(), NOW()),
('recipe00000000000036', 'alacarte000000000009', 'foodstuff00000000012', 0.5, NOW(), NOW()),
('recipe00000000000037', 'alacarte000000000010', 'foodstuff00000000027', 100, NOW(), NOW()),
('recipe00000000000038', 'alacarte000000000010', 'foodstuff00000000012', 0.5, NOW(), NOW()),
('recipe00000000000039', 'alacarte000000000011', 'foodstuff00000000030', 50, NOW(), NOW()),
('recipe00000000000040', 'alacarte000000000011', 'foodstuff00000000031', 50, NOW(), NOW()),
('recipe00000000000041', 'alacarte000000000011', 'foodstuff00000000032', 50, NOW(), NOW()),
('recipe00000000000042', 'alacarte000000000012', 'foodstuff00000000003', 0.25, NOW(), NOW()),
('recipe00000000000043', 'alacarte000000000012', 'foodstuff00000000005', 0.25, NOW(), NOW()),
('recipe00000000000044', 'alacarte000000000012', 'foodstuff00000000012', 0.25, NOW(), NOW()),
('recipe00000000000045', 'alacarte000000000013', 'foodstuff00000000037', 100, NOW(), NOW()),
('recipe00000000000046', 'alacarte000000000013', 'foodstuff00000000036', 100, NOW(), NOW()),
('recipe00000000000047', 'alacarte000000000013', 'foodstuff00000000006', 0.25, NOW(), NOW()),
('recipe00000000000048', 'alacarte000000000013', 'foodstuff00000000001', 0.25, NOW(), NOW()),
('recipe00000000000049', 'alacarte000000000013', 'foodstuff00000000032', 50, NOW(), NOW()),
('recipe00000000000050', 'alacarte000000000014', 'foodstuff00000000032', 50, NOW(), NOW()),
('recipe00000000000051', 'alacarte000000000014', 'foodstuff00000000024', 500, NOW(), NOW()),
('recipe00000000000052', 'alacarte000000000014', 'foodstuff00000000036', 300, NOW(), NOW()),
('recipe00000000000053', 'alacarte000000000014', 'foodstuff00000000006', 0.25, NOW(), NOW()),
('recipe00000000000054', 'alacarte000000000014', 'foodstuff00000000001', 0.25, NOW(), NOW()),
('recipe00000000000055', 'alacarte000000000015', 'foodstuff00000000039', 50, NOW(), NOW()),
('recipe00000000000056', 'alacarte000000000015', 'foodstuff00000000040', 3, NOW(), NOW());

INSERT INTO m_settlement (id, name, created_at, updated_at)
VALUES ('settlement0000000001', '現金', NOW(), NOW()),
('settlement0000000002', 'クレジットカード', NOW(), NOW());

INSERT INTO m_wholesaler (id, name, address, postal_code, representative_name, phone_number, created_at, updated_at)
VALUES ('wholesaler0000000001', 'Amazon', '東京都目黒区下目黒一丁目8-1', '153-0064', 'ジャスパー・チャン', '0120-999-373', NOW(), NOW());
