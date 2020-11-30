CREATE TABLE users (
    user_id            serial , -- ユーザID
    username            varchar(30), -- ユーザ名
    password            varchar(30), -- パスワード
    mailaddress            varchar(80), -- メールアドレス
    primary key(user_id) 
);

CREATE TABLE material (
    material_id            serial, -- 材料ID
    material_name            varchar(30), --材料名
    material_calorie    numeric, --1gあたりのカロリー数
    primary key(material_id) 
);

CREATE TABLE cuisine (
    cuisine_id            serial , -- 料理ID
    cuisine_name            varchar(30), -- 料理ID
    cuisine_calorie    numeric, --1食あたりのカロリー数
    primary key(cuisine_id) 
);

CREATE TABLE  aerobic (
    aerobic_id            serial , -- 有酸素運動ID
    aerobic_name            varchar(30), -- 有酸素運動名
    aerobic_calorie    numeric, -- 一分あたりの消費カロリー数
    primary key(aerobic_id) 
);

CREATE TABLE  muscle(
    muscle_id            serial , -- 筋肉トレーニングID
    muscle_name            varchar(30), -- 筋肉トレーニング名
    muscle_calorie      numeric, -- 一回あたりの消費カロリー数
    primary key(muscle_id) 
);

CREATE TABLE calorie_material(
    material_mng_id          serial, -- 材料カロリー管理ID
    user_id                 int, -- ユーザID
    day             date, -- 日付
    material_id            int , -- 材料ID
    volume              numeric, -- 摂取量(g)
    primary key(material_mng_id),
    foreign key (user_id) references users(user_id),
    foreign key (material_id) references material(material_id)
);

CREATE TABLE calorie_cuisine(
    cuisine_mng_id          serial, -- 料理カロリー管理ID
    user_id                 int, -- ユーザID
    day             date, -- 日付
    cuisine_id            int , -- 料理ID
    eclipse              int, -- 食数
    primary key(cuisine_mng_id),
    foreign key (user_id) references users(user_id),
    foreign key (cuisine_id) references cuisine(cuisine_id)
);

CREATE TABLE calorie_aerobic(
    aerobic_mng_id          serial, -- 有酸素運動カロリー管理ID
    user_id                 int, -- ユーザID
    day             date, -- 日付
    aerobic_id            int , -- 有酸素ID
    time              numeric, -- 運動時間(分)
    primary key(aerobic_mng_id),
    foreign key (user_id) references users(user_id),
    foreign key (aerobic_id) references aerobic(aerobic_id)
);

CREATE TABLE calorie_muscle(
    muscle_mng_id          serial, -- 筋肉トレーニングカロリー管理ID
    user_id                 int, -- ユーザID
    day             date, -- 日付
    muscle_id            int , -- 筋肉トレーニングID
    weight              int, -- 回数
    primary key(muscle_mng_id),
    foreign key (user_id) references users(user_id),
    foreign key (muscle_id) references muscle(muscle_id)
);