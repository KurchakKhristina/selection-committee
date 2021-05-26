USE selection_committee;
DROP table if exists Mark;
DROP table if exists application;
DROP TABLE IF EXISTS USERS;
DROP table if exists subject_on_faculty;
drop table if exists subject;
drop table if exists faculty;


CREATE TABLE USERS
(
    ID          INT NOT NULL AUTO_INCREMENT,
    LastName    varchar(100),
    FirstName   varchar(100),
    Surname     VARCHAR(100),
    Email       varchar(100),
    City        varchar(100),
    Region      varchar(100),
    Study_Place varchar(100),
    Password    VARCHAR(30),
    Role        varchar(30) default 'User',
    Blocked     boolean     default false,
    UNIQUE KEY EMAIL (Email),
    PRIMARY KEY id (ID)
)
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;
;

USE selection_committee;
CREATE table Faculty
(
    ID                    int not null auto_increment primary key,
    Name                  VARCHAR(100),
    Count_of_place        int,
    Count_of_public_place int,
    Count_of_paid_place   int,
    Description           varchar(3500),
    ImgLogo               varchar(500)
)
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


USE selection_committee;
CREATE table Subject
(
    ID   int not null auto_increment primary key,
    Name varchar(30)
)
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

USE selection_committee;

CREATE table examMark
(
    ID         int not null auto_increment primary key,
    Subject_id int,
    User_id    int,
    Exam_mark  int
);
CREATE table certificateMark
(
    ID               int not null auto_increment primary key,
    Subject_id       int,
    User_id          int,
    Certificate_mark int
);



Use selection_committee;
Create table subject_on_faculty
(
    ID         int not null primary key auto_increment,
    Faculty_id int,
    Subject_id int
);

USE selection_committee;
CREATE TABLE application
(
    ID         int not null auto_increment primary key,
    Faculty_id int,
    User_id    int
);

USE selection_committee;

ALTER TABLE subject_on_faculty
    ADD foreign key (Faculty_id) references Faculty (ID);
ALTER TABLE subject_on_faculty
    ADD foreign key (Subject_id) references Subject (ID);
ALTER TABLE examMark
    ADD foreign key (User_id) references USERS (ID);
ALTER TABLE examMark
    ADD foreign key (Subject_id) references Subject (Id);
ALTER TABLE certificateMark
    ADD foreign key (User_id) references USERS (ID);
ALTER TABLE certificateMark
    ADD foreign key (Subject_id) references Subject (Id);
ALTER TABLE application
    ADD foreign key (Faculty_id) references faculty (ID);
ALTER TABLE application
    ADD foreign key (User_id) references users (ID);

insert into USERS value (default, "Курчак", "Христина", "Михайлівна", "kurchakkristina@gmail.com", "Львів", "Львівська",
                         "ЛНУ", "12345678K", "Admin", default);

insert into faculty value (default, "Факультет управління фінансами та бізнесу", 8, 3, 5,
                           "Якщо ти хоч коли-небудь мріяв стати кваліфікованим фінансистом, чи менеджером, бухгалтером-ревізором, аудитором, працівником фіскальних органів і при цьому володіти комп’ютером, іноземною мовою та сучасними технологіями – то перед тобою відчиняються двері факультету управління фінансами та бізнесу. ",
                           "https://upload.wikimedia.org/wikipedia/uk/thumb/7/74/Logo-lnu-financial.jpg/250px-Logo-lnu-financial.jpg");
insert into faculty value (default, "Хімічний факультет", 8, 3, 5,
                           "Нас оточують мільйони хімічних сполук, органічних і неорганічних, створених Природою і синтезованих Людиною. Завдання хімії – вивчати ці речовини та їхні перетворення, виявляти зв’язки між їхніми складом, структурою та властивостями.“Хімія наше життя – хімія наше майбутнє”.",
                           "https://upload.wikimedia.org/wikipedia/commons/1/1b/Logo-lnu-faculty-chem.jpeg");
insert into faculty value (default, "Економічний факультет", 8, 3, 5,
                           "Економіст – одна з найпрестижніших професій. Випускники нашого факультету є відомі в Україні та далеко за її межами вчені, політики, підприємці, педагоги. Нинішні студенти, засвоюючи знання з економіки, математики, іноземних мов та інформаційних технологій, творитимуть вітчизняну економічну та наукову еліту, якій буде під силу забезпечити гідне місце нашої держави у світовій економіці та протистояти складним викликам третього тисячоліття.",
                           "https://admission.lnu.edu.ua/wp-content/uploads/2015/01/logo-faculty-economy.png");
insert into faculty value (default, "Факультет міжнародних відносин", 8, 3, 5,
                           "На нашому факультеті ви отримаєте грунтовну підготовку з одного з напрямків міжнародних відносин (дипломатичної служби, міжнародного права, міжнародних економічних відносин, країнознавства, міжнародної інформації та міжнародного бізнесу), а також мовну підготовку принаймні з трьох іноземних мов. Вас чекає також інтенсивне та цікаве студентське життя: участь в студентських організаціях, можливість навчання закордоном, професійні практики, студентська наукова робота, спортивні секції.",
                           "https://upload.wikimedia.org/wikipedia/uk/0/06/Logo-lnu-intrel.png");
insert into faculty value (default, "Факультет культури та мистецтв", 8, 3, 5,
                           "Свій науковий, мистецько-науковий та науково-методичний доробок викладачі факультету публікують у міжнародних та українських наукових журналах, а також у монографіях, підручниках та навчальних посібниках. Щорічно на факультеті проводять наукові та студентські наукові конференції, де обговорюють сучасні проблеми відповідних галузей наук про культуру, мистецтво, бібліотечну та інформаційну справу.",
                           "https://upload.wikimedia.org/wikipedia/commons/0/06/%D0%9A%D1%83%D0%BB%D1%8C%D1%82%D1%83%D1%80%D0%B0%D0%9B%D0%9C%D0%A3.jpg");
insert into faculty value (default, "Географічний факультет", 8, 3, 5,
                           "Географічний факультет Львівського національного університету імені Івана Франка є провідним в Україні науковим і навчально-методичним центром підготовки спеціалістів високого рівня кваліфікації. Офіційно географічна освіта в Університеті започаткована у 1883 р. зі створення Інституту географії, який очолював відомий географ і геоботанік Антоній Реман. У 1945 р. на базі Інституту географії утворений географічний факультет.",
                           "https://upload.wikimedia.org/wikipedia/uk/thumb/c/cd/LNU_GEOGR.png/640px-LNU_GEOGR.png");
insert into faculty value (default, "Юридичний факультет", 8, 3, 5,
                           "Юридичний факультет Львівського національного університету імені Івана Франка – це не тільки місце підготовки нових кадрів – висококваліфікованих правників, а й установа, де формується еліта нації, а також твориться сучасна юридична наука. Поважаючи багатовікову історію та традиції, враховуючи виклики сьогодення, ми формуємо майбутнє!",
                           "https://upload.wikimedia.org/wikipedia/uk/thumb/e/e5/LNU_JURID.png/640px-LNU_JURID.png");
insert into faculty value (default, "Факультет прикладної математики та інформатики", 8, 3, 5,
                           "Студенти факультету мають можливість отримати знання з усіх фундаментальних дисциплін, які складають основу комп’ютерних технологій, вив­чити основні мови програмування та ознайомитись із найсучаснішими IT-технологіями. Уже неодноразово команди студентів університету ставали призерами світових олімпіад з програмування.",
                           "https://upload.wikimedia.org/wikipedia/uk/thumb/2/29/Logo-lnu-ami.jpeg/250px-Logo-lnu-ami.jpeg");
insert into faculty value (default, "Історичний факультет", 8, 3, 5,
                           "Події, дати, особи становлять основу історичних знань, але не вичерпують їх. Кожен, хто стане студентом історичного факультету, навчиться характеризувати явища минулого в тих системах цінностей, у яких вони виникли, а тоді зіставляти їх із сучасними поглядами, моральними категоріями, визначати власне ставлення до подій. Іншими словами, навчиться розуміти історію, людей минулого, їхні турботи, потреби, радощі, надії, розчарування. А відтак навчиться розуміти себе й людей, котрі його оточують, будувати життєві плани і втілювати мрії в життя.",
                           "https://upload.wikimedia.org/wikipedia/commons/8/81/%D0%86%D1%81%D1%82%D0%BE%D1%80%D0%B8%D1%87%D0%BD%D0%B8%D0%B9%D0%9B%D0%9D%D0%A32.gif");
insert into faculty value (default, "Біологічний факультет", 8, 3, 5,
                           "Випускники біологічного факультету можуть працювати у науковій, екологічній, санітарно-епідеміологічній, сільськогосподарській сферах, харчовій та мікробіологічній промисловостях, рибництві, заповідній справі та природоохоронній діяльності, озелененні територій та парковому господарствах, в установах екологічної безпеки та надзвичайних ситуацій, у лабораторіях медико-діагностичного профілю і судово-медичної експертизи та закладах освіти всіх рівнів як в Україні, так і за кордоном",
                           "https://admission.lnu.edu.ua/wp-content/uploads/2015/01/logo-faculty-biology.png");


insert into subject value (default, "Математика");
insert into subject value (default, "Історія України");
insert into subject value (default, "Українська мова та література");
insert into subject value (default, "Хімія");
insert into subject value (default, "Фізика");
insert into subject value (default, "Біологія");
insert into subject value (default, "Німецька мова");
insert into subject value (default, "Англійська мова");

insert into subject_on_faculty value (default, 1, 1);
insert into subject_on_faculty value (default, 1, 3);
insert into subject_on_faculty value (default, 1, 6);
insert into subject_on_faculty value (default, 2, 2);
insert into subject_on_faculty value (default, 2, 3);
insert into subject_on_faculty value (default, 2, 8);
insert into subject_on_faculty value (default, 3, 2);
insert into subject_on_faculty value (default, 3, 3);
insert into subject_on_faculty value (default, 4, 1);
insert into subject_on_faculty value (default, 4, 3);
insert into subject_on_faculty value (default, 4, 8);
insert into subject_on_faculty value (default, 5, 1);
insert into subject_on_faculty value (default, 5, 3);
insert into subject_on_faculty value (default, 5, 4);
insert into subject_on_faculty value (default, 7, 1);
insert into subject_on_faculty value (default, 7, 3);
insert into subject_on_faculty value (default, 7, 8);
insert into subject_on_faculty value (default, 8, 1);
insert into subject_on_faculty value (default, 8, 3);
insert into subject_on_faculty value (default, 8, 8);
insert into subject_on_faculty value (default, 9, 1);
insert into subject_on_faculty value (default, 9, 3);
insert into subject_on_faculty value (default, 9, 8);
