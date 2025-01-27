/*
  2025.1.26 rev.0
  예제 데이터(examdb, 2-7장)
*/

DROP VIEW IF EXISTS 과목별인원수목록;
DROP VIEW IF EXISTS list01;
DROP VIEW IF EXISTS list02;
DROP TABLE IF EXISTS exams;
DROP TABLE IF EXISTS exams_with_serial;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS branch_course_master;
DROP TABLE IF EXISTS branch_master;
DROP TABLE IF EXISTS course_master;

/*
# branch_master, students
*/
CREATE TABLE branch_master ( 
    branch VARCHAR(255) NOT NULL, 
    PRIMARY KEY (branch)
);
INSERT INTO branch_master VALUES ('강남구'), ('서초구'), ('송파구'), ('종로구');

CREATE TABLE students (
    student_id CHAR(5) NOT NULL PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    student_engname VARCHAR(255) NOT NULL,
    home_phone VARCHAR(255) NOT NULL,
    mobile_phone VARCHAR(255),
    school VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    FOREIGN KEY (branch) REFERENCES branch_master (branch)
);

INSERT INTO students (student_id,student_name,student_engname,home_phone,mobile_phone,school,branch) VALUES
('C0001','이철순','Lee Chulson','026570242X','0105297314X','신사중학교','강남구'),
('C0002','김기리','Kim Giri','023629229X',NULL,'중앙중학교','종로구'),
('C0003','홍명동','Hong Myungdong','029214134X','0103400789X','서초중학교','서초구'),
('C0004','김주용','Kim Juyong','022318452X','0107548352X','방배중학교','서초구'),
('C0005','강주일','Kang Juil','025132617X','0103982902X','중앙중학교','종로구'),
('C0006','왕가후','Wang gahoo','024148958X','0101711375X','대명중학교','강남구'),
('C0007','이가람','Lee Garam','025825045X','0101082373X','반포중학교','서초구'),
('C0008','오그리','Oh Gree','025457533X','0102543580X','영동중학교','서초구'),
('C0009','강길','Kang gil','025060556X','0101204514X','언주중학교','강남구'),
('C0010','오나나','Oh Nana','027076225X',NULL,'반포중학교','서초구'),
('C0011','김재우','Kim Jaewoo','025618611X',NULL,'서일중학교','서초구'),
('C0012','김영일','Kim Youngil','026994565X','0109526963X','신사중학교','강남구'),
('C0013','공남','Kong Nam','028939932X',NULL,'경신중학교','종로구'),
('C0014','이노을','Lee Noul','022834531X','0102678222X','언남중학교','서초구'),
('C0015','홍나오','Hong Nao','025768326X','0104885043X','청운중학교','종로구'),
('C0016','이누리','Lee Nuri','024123974X','0101436324X','배화여자중학교','종로구'),
('C0017','김난새','Kim Nanse','024249385X',NULL,'신천중학교','송파구'),
('C0018','강빛나','Kang Bibna','022084838X','0106040038X','가락중학교','송파구'),
('C0019','이순신','Lee Soonshin','025845177X','0108645073X','내곡중학교','서초구'),
('C0020','이이','Lee Lee','027899078X','0108190664X','언남중학교','서초구'),
('C0021','고누림','Go Nurim','023552104X','0102013593X','휘문중학교','강남구'),
('C0022','여남','Yeo Nam','021041914X','0105697810X','서일중학교','서초구'),
('C0023','공남새','Kong Namsae','025095761X','0107893397X','개포중학교','강남구'),
('C0024','길다가','Kil daga','025013375X',NULL,'송파중학교','송파구'),
('C0025','금다와','Kim Dawa','022273930X','0105599339X','대신중학교','종로구'),
('C0026','기다이','Ki Dai','021720972X','0105872104X','경원중학교','서초구'),
('C0027','여다온','Yeo Daon','023342905X','0101594667X','서문여자중학교','서초구'),
('C0028','김다빈','Kim Dabin','025421238X','0109122312X','신동중학교','서초구'),
('C0029','이두나','Lee Duna','029316031X',NULL,'도곡중학교','강남구'),
('C0030','신도도','Shin Dodo','028037173X','0106535123X','개원중학교','강남구'),
('C0031','이다힘','Lee Dahim','027907322X','0104466312X','원촌중학교','서초구'),
('C0032','한도란','Han Doran','022768917X','0104218922X','인왕중학교','종로구'),
('C0033','민두루','Min Dooroo','025008522X','0101097782X','송파중학교','송파구'),
('C0034','양동이','Yang Dongee','027583712X','0103378357X','상명대부속여자중학교','종로구'),
('C0035','김도래','Kim Dorae','025257234X','0108812638X','휘문중학교','강남구'),
('C0036','한두힘','Han Doohim','021658637X',NULL,'역삼중학교','송파구'),
('C0037','김라라','Kim Lala','026906532X','0103594293X','송파중학교','송파구'),
('C0038','김미라','Kim Miraa','020624150X','0103794040X','동성중학교','강남구'),
('C0039','안창호','Ahn Changho','025774631X','0109238625X','서운중학교','서초구'),
('C0040','김구','Kim Gu','025892018X',NULL,'잠실중학교','송파구'),
('C0041','문재인','Mun Jaein','027700269X','0103075953X','서울대부설여자중학교','종로구'),
('C0042','노무현','Noo Muhyun','027490673X',NULL,'도곡중학교','강남구'),
('C0043','김대중','Kim Daejung','023069922X','0104947240X','덕성여자중학교','종로구'),
('C0044','이재명','Lee Jaemyung','026137556X','0108412787X','신동중학교','서초구'),
('C0045','이루다','Lee Ruda','022351624X','0101513555X','신동중학교','서초구'),
('C0046','고로다','GO Roda','027873475X','0109887434X','청담중학교','강남구'),
('C0047','이라미','Lee Rami','022652215X','0106195248X','압구정중학교','강남구'),
('C0048','김명','Kim Myung','026703744X','0107209877X','청운중학교','종로구'),
('C0049','고마루','Go Maru','020887519X',NULL,'개포중학교','강남구'),
('C0050','전마리','Jeon Mari','025015719X',NULL,'이수중학교','서초구'),
('C0051','고바람','Go Baram','020209597X',NULL,'서울대부설여자중학교','종로구'),
('C0052','공모아','Kong Moa','025520913X','0101764195X','잠실중학교','송파구'),
('C0053','기모이','Ki Moi','022499165X','0106997308X','잠실중학교','송파구'),
('C0054','이미나','Lee Mina','028630649X','0103113814X','석촌중학교','송파구'),
('C0055','김바다','Kim Bada','026869526X','0108535683X','신동중학교','서초구'),
('C0056','이바른','Lee Barun','028661710X',NULL,'대왕중학교','강남구'),
('C0057','고별','Go Beol','022502181X','0106709442X','수서중학교','강남구'),
('C0058','이보나','Lee Bona','024410898X','0104367847X','도곡중학교','강남구'),
('C0059','김보담','Kim Bodam','026939408X','0105034076X','신구중학교','강남구'),
('C0060','이보람','Lee Boram','027996919X',NULL,'역삼중학교','서초구'),
('C0061','고부루','Go Buru','024314655X','0102813381X','아주중학교','송파구'),
('C0062','길길','Gil Gil','023606846X','0107503150X','수서중학교','강남구'),
('C0063','김비치','Kim Bichi','029050515X','0105873898X','수서중학교','강남구'),
('C0064','김봄','Kim Bom','028767949X','0106799260X','신구중학교','강남구'),
('C0065','전세나','Jeon Sena','022047027X','0107862712X','역삼중학교','강남구'),
('C0066','고소미','Go Somi','026890069X','0106068526X','동적여자중학교','서초구'),
('C0067','정소라','Jeong Sora','021213312X','0105918541X','동적여자중학교','서초구'),
('C0068','김소아','Kim Soa','021169045X','0105093203X','동적여자중학교','서초구'),
('C0069','김슬기','Kim Sulgi','029991311X','0106477814X','언북중학교','강남구'),
('C0070','이수리','Lee Soori','024802369X','0103611429X','서운중학교','서초구'),
('C0071','박세리','Park Seri','028498905X','0109895897X','대신중학교','서초구'),
('C0072','박슬기','Park Sulgi','025954788X','0104559655X','신동중학교','서초구'),
('C0073','전시내','Jeon Sinae','026330028X','0107418387X','신반포중학교','서초구'),
('C0074','고아라','Go Ara','027314983X','0104851270X','잠실중학교','송파구'),
('C0075','김아란','Kim Aran','029953316X','0104924707X','신구중학교','강남구'),
('C0076','김얼','Kim Ul','025486011X','0109887946X','신반포중학교','서초구'),
('C0077','고엄지','Go Umji','026497643X','0108213323X','서운중학교','서초구'),
('C0078','박이솔','Park EeSol','024098862X',NULL,'서운중학교','서초구'),
('C0079','이루리','Lee Roori','028771950X','0105715241X','내곡중학교','종로구'),
('C0080','이특','Lee Teul','024927260X','0103875793X','도곡중학교','강남구'),
('C0081','김잔디','Kim Jandi','023470050X','0109481435X','무학중학교','종로구'),
('C0082','이제나','Lee Jeana','020650682X','0106446802X','무학중학교','종로구'),
('C0083','김주리','Kim Juri','023000043X','0107061607X','대청중학교','강남구'),
('C0084','전주미','Jeon Jumi','027258108X','0107287082X','경원중학교','서초구'),
('C0085','박지니','Park Jini','024160178X','0106816790X','상명대부속여자중학교','종로구'),
('C0086','김진나','Kim Jinna','025587159X','0102242326X','봉은중학교','강남구'),
('C0087','김진샘','Kim Jinsaem','029630446X','0106115411X','배명중학교','송파구'),
('C0088','고찬미','Go Chanmi','027114827X','0101091624X','세곡중학교','강남구'),
('C0089','김찬','Kim Chan','024724522X','0102274693X','대신중학교','종로구'),
('C0090','박차미','Park Chami','028890583X','0102314868X','봉은중학교','강남구'),
('C0091','강치리','Kang Chiri','023987685X',NULL,'압구정중학교','강남구'),
('C0092','김크나','Kim Kuna','027528840X','0102440524X','신동중학교','서초구'),
('C0093','전나래','Jeon Narae','024002093X','0106737885X','역삼중학교','강남구'),
('C0094','박말','Park Mal','027343073X','0106960810X','송파중학교','송파구'),
('C0095','이티나','Lee Teena','024677964X',NULL,'아주중학교','송파구'),
('C0096','고토리','Go Toree','029926695X','0104089427X','숭곡중학교','종로구'),
('C0097','전파라','Jeon Para','021501074X','0104877453X','숭곡중학교','종로구'),
('C0098','김파란','Kim Paran','022971498X','0104528995X','신반포중학교','서초구'),
('C0099','박퍼리','Park Peri','023306223X','0106369797X','청담중학교','강남구'),
('C0100','고피라','Go Pira','022785766X','0103095662X','신동중학교','서초구'),
('C0101','김피리','Kim Piri','020170625X','0106808360X','수서중학교','강남구'),
('C0102','김하나','Kim Hana','021317109X','0103063037X','수서중학교','강남구'),
('C0103','박하람','Park Haram','024740674X','0106243824X','영동중학교','서초구'),
('C0104','이한','Lee Han','023270087X','0103629418X','내곡중학교','서초구'),
('C0105','한누리','Han Noori','025196421X','0104270202X','신반포중학교','서초구'),
('C0106','이해나','Lee Haena','024269324X',NULL,'송파중학교','송파구'),
('C0107','김힘찬','Kim Himchan','026431367X','0104220380X','신반포중학교','서초구'),
('C0108','김주원','Kim Juwon','027098193X','0108763120X','내곡중학교','서초구'),
('C0109','이시우','Lee Siwoo','026604370X','0106492030X','동성중학교','종로구'),
('C0110','김하준','Kim Hanjun','020897925X','0106860097X','신동중학교','서초구'),
('C0111','김지호','Kim Jiho','022557846X','0103338494X','원촌중학교','서초구'),
('C0112','고지우','Go Jiwoo','024971541X','0109247414X','신반포중학교','서초구'),
('C0113','김지호','Kim Jiho','026507460X','0102669179X','경원중학교','서초구'),
('C0114','박민준','Park MinJun','027808169X','0101793519X','신동중학교','서초구'),
('C0115','전준우','Jeon Junwoo','023251584X',NULL,'신동중학교','서초구'),
('C0116','김하린','Kim Harin','026141929X','0104516986X','서운중학교','서초구'),
('C0117','이민서','Lee Minseo','023149550X','0103449301X','역삼중학교','송파구'),
('C0118','이수아','Lee Sooa','028931130X','0103794205X','배화여자중학교','종로구'),
('C0119','강지민','Kang Jimin','024014851X','0102667836X','수서중학교','강남구'),
('C0120','고지호','Go Jiho','022121536X','0108769315X','청담중학교','서초구');


/*
# course_master, courses
  course는 선택과목, 국어,영어,수학만 있지만, 국어R, 국어N, 국어S와 같은 난이도별 3개 코스로 나뉘어짐
  학생들은 국어R, 영어N과 같이 각 과목별로 조합하여 수항
  단, 영어N과 영어S는 같이 수강 불가 
*/


CREATE TABLE course_master ( 
    course VARCHAR(255) NOT NULL, 
    PRIMARY KEY (course)
);

INSERT INTO course_master VALUES('국어'), ('영어'), ('수학');

CREATE TABLE courses ( 
    student_id CHAR(5) NOT NULL, 
    course VARCHAR(255) NOT NULL, 
    PRIMARY KEY (student_id, course),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course) REFERENCES course_master(course)
);


INSERT INTO courses (student_id, course) VALUES ('C0001','국어'),('C0001','영어'),('C0001','수학');
INSERT INTO courses (student_id, course) VALUES ('C0002','영어'),('C0002','수학');
INSERT INTO courses (student_id, course) VALUES ('C0003','국어'),('C0003','영어'),('C0003','수학');
INSERT INTO courses (student_id, course) VALUES ('C0004','국어'),('C0004','영어'),('C0004','수학');
INSERT INTO courses (student_id, course) VALUES ('C0005','수학');
INSERT INTO courses (student_id, course) VALUES ('C0006','영어'),('C0006','수학');
INSERT INTO courses (student_id, course) VALUES ('C0007','국어'),('C0007','영어');
INSERT INTO courses (student_id, course) VALUES ('C0008','수학');
INSERT INTO courses (student_id, course) VALUES ('C0009','국어'),('C0009','영어'),('C0009','수학');
INSERT INTO courses (student_id, course) VALUES ('C0010','영어'),('C0010','수학');
INSERT INTO courses (student_id, course) VALUES ('C0011','국어'),('C0011','영어'),('C0011','수학');
INSERT INTO courses (student_id, course) VALUES ('C0012','국어'),('C0012','영어');
INSERT INTO courses (student_id, course) VALUES ('C0013','수학');
INSERT INTO courses (student_id, course) VALUES ('C0014','국어'),('C0014','영어'),('C0014','수학');
INSERT INTO courses (student_id, course) VALUES ('C0015','국어'),('C0015','영어'),('C0015','수학');
INSERT INTO courses (student_id, course) VALUES ('C0016','국어'),('C0016','영어'),('C0016','수학');
INSERT INTO courses (student_id, course) VALUES ('C0017','수학');
INSERT INTO courses (student_id, course) VALUES ('C0018','영어');
INSERT INTO courses (student_id, course) VALUES ('C0019','국어'),('C0019','영어');
INSERT INTO courses (student_id, course) VALUES ('C0020','국어'),('C0020','영어'),('C0020','수학');
INSERT INTO courses (student_id, course) VALUES ('C0021','국어'),('C0021','영어'),('C0021','수학');
INSERT INTO courses (student_id, course) VALUES ('C0022','영어'),('C0022','수학');
INSERT INTO courses (student_id, course) VALUES ('C0023','국어'),('C0023','영어'),('C0023','수학');
INSERT INTO courses (student_id, course) VALUES ('C0024','수학');
INSERT INTO courses (student_id, course) VALUES ('C0025','국어'),('C0025','영어'),('C0025','수학');
INSERT INTO courses (student_id, course) VALUES ('C0026','국어'),('C0026','영어'),('C0026','수학');
INSERT INTO courses (student_id, course) VALUES ('C0027','국어'),('C0027','영어'),('C0027','수학');
INSERT INTO courses (student_id, course) VALUES ('C0028','영어'),('C0028','수학');
INSERT INTO courses (student_id, course) VALUES ('C0029','영어'),('C0029','수학');
INSERT INTO courses (student_id, course) VALUES ('C0030','국어'),('C0030','영어'),('C0030','수학');
INSERT INTO courses (student_id, course) VALUES ('C0031','국어'),('C0031','수학');
INSERT INTO courses (student_id, course) VALUES ('C0032','국어'),('C0032','수학');
INSERT INTO courses (student_id, course) VALUES ('C0033','영어'),('C0033','수학');
INSERT INTO courses (student_id, course) VALUES ('C0034','국어'),('C0034','영어'),('C0034','수학');
INSERT INTO courses (student_id, course) VALUES ('C0035','국어'),('C0035','영어'),('C0035','수학');
INSERT INTO courses (student_id, course) VALUES ('C0036','영어'),('C0036','수학');
INSERT INTO courses (student_id, course) VALUES ('C0037','영어'),('C0037','수학');
INSERT INTO courses (student_id, course) VALUES ('C0038','수학');
INSERT INTO courses (student_id, course) VALUES ('C0039','영어');
INSERT INTO courses (student_id, course) VALUES ('C0040','영어'),('C0040','수학');
INSERT INTO courses (student_id, course) VALUES ('C0041','영어'),('C0041','수학');
INSERT INTO courses (student_id, course) VALUES ('C0042','국어'),('C0042','영어'),('C0042','수학');
INSERT INTO courses (student_id, course) VALUES ('C0043','영어'),('C0043','수학');
INSERT INTO courses (student_id, course) VALUES ('C0044','국어'),('C0044','영어'),('C0044','수학');
INSERT INTO courses (student_id, course) VALUES ('C0045','국어'),('C0045','수학');
INSERT INTO courses (student_id, course) VALUES ('C0046','국어'),('C0046','영어'),('C0046','수학');
INSERT INTO courses (student_id, course) VALUES ('C0047','국어'),('C0047','영어'),('C0047','수학');
INSERT INTO courses (student_id, course) VALUES ('C0048','수학');
INSERT INTO courses (student_id, course) VALUES ('C0049','국어'),('C0049','영어'),('C0049','수학');
INSERT INTO courses (student_id, course) VALUES ('C0050','국어'),('C0050','영어'),('C0050','수학');
INSERT INTO courses (student_id, course) VALUES ('C0051','영어'),('C0051','수학');
INSERT INTO courses (student_id, course) VALUES ('C0052','영어'),('C0052','수학');
INSERT INTO courses (student_id, course) VALUES ('C0053','영어'),('C0053','수학');
INSERT INTO courses (student_id, course) VALUES ('C0054','영어'),('C0054','수학');
INSERT INTO courses (student_id, course) VALUES ('C0055','국어'),('C0055','영어'),('C0055','수학');
INSERT INTO courses (student_id, course) VALUES ('C0056','국어'),('C0056','영어'),('C0056','수학');
INSERT INTO courses (student_id, course) VALUES ('C0057','국어'),('C0057','영어'),('C0057','수학');
INSERT INTO courses (student_id, course) VALUES ('C0058','영어'),('C0058','수학');
INSERT INTO courses (student_id, course) VALUES ('C0059','영어'),('C0059','수학');
INSERT INTO courses (student_id, course) VALUES ('C0060','국어'),('C0060','영어'),('C0060','수학');
INSERT INTO courses (student_id, course) VALUES ('C0061','영어'),('C0061','수학');
INSERT INTO courses (student_id, course) VALUES ('C0062','영어');
INSERT INTO courses (student_id, course) VALUES ('C0063','영어'),('C0063','수학');
INSERT INTO courses (student_id, course) VALUES ('C0064','국어'),('C0064','영어');
INSERT INTO courses (student_id, course) VALUES ('C0065','국어'),('C0065','영어'),('C0065','수학');
INSERT INTO courses (student_id, course) VALUES ('C0066','영어'),('C0066','수학');
INSERT INTO courses (student_id, course) VALUES ('C0067','국어'),('C0067','영어'),('C0067','수학');
INSERT INTO courses (student_id, course) VALUES ('C0068','국어'),('C0068','영어');
INSERT INTO courses (student_id, course) VALUES ('C0069','국어'),('C0069','영어'),('C0069','수학');
INSERT INTO courses (student_id, course) VALUES ('C0070','국어'),('C0070','영어');
INSERT INTO courses (student_id, course) VALUES ('C0071','국어'),('C0071','영어'),('C0071','수학');
INSERT INTO courses (student_id, course) VALUES ('C0072','국어'),('C0072','영어'),('C0072','수학');
INSERT INTO courses (student_id, course) VALUES ('C0073','국어'),('C0073','영어'),('C0073','수학');
INSERT INTO courses (student_id, course) VALUES ('C0074','영어'),('C0074','수학');
INSERT INTO courses (student_id, course) VALUES ('C0075','국어'),('C0075','영어');
INSERT INTO courses (student_id, course) VALUES ('C0076','국어'),('C0076','수학');
INSERT INTO courses (student_id, course) VALUES ('C0077','국어'),('C0077','영어'),('C0077','수학');
INSERT INTO courses (student_id, course) VALUES ('C0078','국어'),('C0078','영어'),('C0078','수학');
INSERT INTO courses (student_id, course) VALUES ('C0079','국어'),('C0079','영어'),('C0079','수학');
INSERT INTO courses (student_id, course) VALUES ('C0010','국어'),('C0010','영어'),('C0010','수학');
INSERT INTO courses (student_id, course) VALUES ('C0081','영어'),('C0081','수학');
INSERT INTO courses (student_id, course) VALUES ('C0082','영어'),('C0082','수학');
INSERT INTO courses (student_id, course) VALUES ('C0083','국어'),('C0083','영어'),('C0083','수학');
INSERT INTO courses (student_id, course) VALUES ('C0084','국어'),('C0084','영어'),('C0084','수학');
INSERT INTO courses (student_id, course) VALUES ('C0085','국어'),('C0085','영어'),('C0085','수학');
INSERT INTO courses (student_id, course) VALUES ('C0086','영어'),('C0086','수학');
INSERT INTO courses (student_id, course) VALUES ('C0087','영어'),('C0087','수학');
INSERT INTO courses (student_id, course) VALUES ('C0088','국어'),('C0088','영어'),('C0088','수학');
INSERT INTO courses (student_id, course) VALUES ('C0089','국어'),('C0089','영어'),('C0089','수학');
INSERT INTO courses (student_id, course) VALUES ('C0010','영어'),('C0010','수학');
INSERT INTO courses (student_id, course) VALUES ('C0091','국어'),('C0091','영어'),('C0091','수학');
INSERT INTO courses (student_id, course) VALUES ('C0092','국어'),('C0092','영어'),('C0092','수학');
INSERT INTO courses (student_id, course) VALUES ('C0093','국어'),('C0093','영어'),('C0093','수학');
INSERT INTO courses (student_id, course) VALUES ('C0094','영어'),('C0094','수학');
INSERT INTO courses (student_id, course) VALUES ('C0095','영어'),('C0095','수학');
INSERT INTO courses (student_id, course) VALUES ('C0096','영어'),('C0096','수학');
INSERT INTO courses (student_id, course) VALUES ('C0097','국어'),('C0097','영어'),('C0097','수학');
INSERT INTO courses (student_id, course) VALUES ('C0098','국어'),('C0098','영어');
INSERT INTO courses (student_id, course) VALUES ('C0099','국어'),('C0099','영어');
INSERT INTO courses (student_id, course) VALUES ('C0100','영어'),('C0100','수학');
INSERT INTO courses (student_id, course) VALUES ('C0101','영어');
INSERT INTO courses (student_id, course) VALUES ('C0102','국어'),('C0102','영어'),('C0102','수학');
INSERT INTO courses (student_id, course) VALUES ('C0103','국어'),('C0103','영어');
INSERT INTO courses (student_id, course) VALUES ('C0104','영어'),('C0104','수학');
INSERT INTO courses (student_id, course) VALUES ('C0105','영어'),('C0105','수학');
INSERT INTO courses (student_id, course) VALUES ('C0106','수학');
INSERT INTO courses (student_id, course) VALUES ('C0107','영어'),('C0107','수학');
INSERT INTO courses (student_id, course) VALUES ('C0108','국어'),('C0108','영어'),('C0108','수학');
INSERT INTO courses (student_id, course) VALUES ('C0109','영어');
INSERT INTO courses (student_id, course) VALUES ('C0110','국어'),('C0110','영어'),('C0110','수학');
INSERT INTO courses (student_id, course) VALUES ('C0111','국어'),('C0111','영어'),('C0111','수학');
INSERT INTO courses (student_id, course) VALUES ('C0112','국어'),('C0112','영어'),('C0112','수학');
INSERT INTO courses (student_id, course) VALUES ('C0113','국어'),('C0113','영어'),('C0113','수학');
INSERT INTO courses (student_id, course) VALUES ('C0114','국어'),('C0114','영어'),('C0114','수학');
INSERT INTO courses (student_id, course) VALUES ('C0115','국어'),('C0115','영어'),('C0115','수학');
INSERT INTO courses (student_id, course) VALUES ('C0116','국어'),('C0116','영어');
INSERT INTO courses (student_id, course) VALUES ('C0117','영어'),('C0117','수학');
INSERT INTO courses (student_id, course) VALUES ('C0118','영어'),('C0118','수학');
INSERT INTO courses (student_id, course) VALUES ('C0119','국어'),('C0119','영어'),('C0119','수학');
INSERT INTO courses (student_id, course) VALUES ('C0120','국어'),('C0120','영어'),('C0120','수학');

/*
# exams
subject는 시험과목, 선택과목(코스)를 선택하지 않아도 공통 모의고사를 볼 수 있ㅁ음
응시여부는 임의이며, 응시하지 못한 경우 희망자에 한해 다음날 같은 문제로 실시, 실시율이 상당히 높음
같은 날 3과목을 실시하나 44회는 날씨가 좋지 않아 멀리서 온 학생은 결석하거나 1,2과목만 응시함 
*/

CREATE TABLE exams ( 
    student_id CHAR(5) NOT NULL, 
    exam_no integer NOT NULL,
    subject VARCHAR(255) NOT NULL CHECK (subject='국어'
                        OR subject='수학' OR subject='영어'),
    score INTEGER NOT NULL, CONSTRAINT score_limit CHECK(0 <= score and score <= 100),
    PRIMARY KEY (student_id, exam_no, subject),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- SQL Server의 경우 ON DELETE RESTRICT 대신 ON DELETE NO ACTION 으로 함
-- (DELETE에서 외부키 제약조건 위반이 발생하면 트랜잭션을 롤백하므로 RESTRICT와 동일한 동작) 

/*
## no 41
*/
-- DELETE FROM exams WHERE exam_no=41;
INSERT INTO exams VALUES ('C0001',41,'국어',90),('C0001',41,'영어',86),('C0001',41,'수학',93);
INSERT INTO exams VALUES ('C0002',41,'국어',95),('C0002',41,'영어',80),('C0002',41,'수학',92);
INSERT INTO exams VALUES ('C0003',41,'국어',84),('C0003',41,'영어',61),('C0003',41,'수학',82);
INSERT INTO exams VALUES ('C0004',41,'국어',59),('C0004',41,'영어',49),('C0004',41,'수학',41);
INSERT INTO exams VALUES ('C0005',41,'국어',80),('C0005',41,'영어',65),('C0005',41,'수학',75);
INSERT INTO exams VALUES ('C0006',41,'국어',36),('C0006',41,'영어',47),('C0006',41,'수학',43);
INSERT INTO exams VALUES ('C0007',41,'국어',75),('C0007',41,'영어',72),('C0007',41,'수학',69);
INSERT INTO exams VALUES ('C0008',41,'국어',94),('C0008',41,'영어',100),('C0008',41,'수학',93);
INSERT INTO exams VALUES ('C0009',41,'국어',64),('C0009',41,'영어',66),('C0009',41,'수학',74);
INSERT INTO exams VALUES ('C0010',41,'국어',83),('C0010',41,'영어',75),('C0010',41,'수학',83);
INSERT INTO exams VALUES ('C0011',41,'국어',79),('C0011',41,'영어',90),('C0011',41,'수학',80);
INSERT INTO exams VALUES ('C0012',41,'국어',87),('C0012',41,'영어',62),('C0012',41,'수학',77);
INSERT INTO exams VALUES ('C0013',41,'국어',65),('C0013',41,'영어',67),('C0013',41,'수학',78);
INSERT INTO exams VALUES ('C0014',41,'국어',94),('C0014',41,'영어',80),('C0014',41,'수학',80);
INSERT INTO exams VALUES ('C0015',41,'국어',93),('C0015',41,'영어',65),('C0015',41,'수학',80);
INSERT INTO exams VALUES ('C0016',41,'국어',81),('C0016',41,'영어',89),('C0016',41,'수학',84);
INSERT INTO exams VALUES ('C0017',41,'국어',90),('C0017',41,'영어',79),('C0017',41,'수학',80);
INSERT INTO exams VALUES ('C0018',41,'국어',81),('C0018',41,'영어',78),('C0018',41,'수학',85);
INSERT INTO exams VALUES ('C0019',41,'국어',60),('C0019',41,'영어',61),('C0019',41,'수학',38);
INSERT INTO exams VALUES ('C0020',41,'국어',96),('C0020',41,'영어',97),('C0020',41,'수학',78);
INSERT INTO exams VALUES ('C0021',41,'국어',74),('C0021',41,'영어',68),('C0021',41,'수학',81);
INSERT INTO exams VALUES ('C0022',41,'국어',78),('C0022',41,'영어',65),('C0022',41,'수학',61);
INSERT INTO exams VALUES ('C0023',41,'국어',89),('C0023',41,'영어',92),('C0023',41,'수학',95);
INSERT INTO exams VALUES ('C0024',41,'국어',75),('C0024',41,'영어',86),('C0024',41,'수학',86);
INSERT INTO exams VALUES ('C0025',41,'국어',80),('C0025',41,'영어',61),('C0025',41,'수학',76);
INSERT INTO exams VALUES ('C0026',41,'국어',25),('C0026',41,'영어',63),('C0026',41,'수학',41);
INSERT INTO exams VALUES ('C0027',41,'국어',62),('C0027',41,'영어',76),('C0027',41,'수학',72);
INSERT INTO exams VALUES ('C0028',41,'국어',51),('C0028',41,'영어',62),('C0028',41,'수학',25);
INSERT INTO exams VALUES ('C0029',41,'국어',79),('C0029',41,'영어',96),('C0029',41,'수학',84);
INSERT INTO exams VALUES ('C0030',41,'국어',63),('C0030',41,'영어',61),('C0030',41,'수학',78);
INSERT INTO exams VALUES ('C0031',41,'국어',60),('C0031',41,'영어',81),('C0031',41,'수학',69);
INSERT INTO exams VALUES ('C0032',41,'국어',63),('C0032',41,'영어',70),('C0032',41,'수학',79);
INSERT INTO exams VALUES ('C0033',41,'국어',91),('C0033',41,'영어',84),('C0033',41,'수학',98);
INSERT INTO exams VALUES ('C0034',41,'국어',71),('C0034',41,'영어',74),('C0034',41,'수학',68);
INSERT INTO exams VALUES ('C0035',41,'국어',77),('C0035',41,'영어',63),('C0035',41,'수학',68);
INSERT INTO exams VALUES ('C0036',41,'국어',84),('C0036',41,'영어',91),('C0036',41,'수학',83);
INSERT INTO exams VALUES ('C0037',41,'국어',82),('C0037',41,'영어',80),('C0037',41,'수학',94);
INSERT INTO exams VALUES ('C0038',41,'국어',97),('C0038',41,'영어',95),('C0038',41,'수학',86);
INSERT INTO exams VALUES ('C0039',41,'국어',94),('C0039',41,'영어',97),('C0039',41,'수학',84);
INSERT INTO exams VALUES ('C0040',41,'국어',94),('C0040',41,'영어',89),('C0040',41,'수학',79);
INSERT INTO exams VALUES ('C0041',41,'국어',70),('C0041',41,'영어',75),('C0041',41,'수학',60);
INSERT INTO exams VALUES ('C0042',41,'국어',81),('C0042',41,'영어',60),('C0042',41,'수학',68);
INSERT INTO exams VALUES ('C0043',41,'국어',82),('C0043',41,'영어',64),('C0043',41,'수학',76);
INSERT INTO exams VALUES ('C0044',41,'국어',79),('C0044',41,'영어',100),('C0044',41,'수학',60);
INSERT INTO exams VALUES ('C0045',41,'국어',61),('C0045',41,'영어',64),('C0045',41,'수학',61);
INSERT INTO exams VALUES ('C0046',41,'국어',63),('C0046',41,'영어',65),('C0046',41,'수학',81);
INSERT INTO exams VALUES ('C0047',41,'국어',70),('C0047',41,'영어',76),('C0047',41,'수학',91);
INSERT INTO exams VALUES ('C0048',41,'국어',61),('C0048',41,'영어',83),('C0048',41,'수학',76);
INSERT INTO exams VALUES ('C0049',41,'국어',66),('C0049',41,'영어',85),('C0049',41,'수학',78);
INSERT INTO exams VALUES ('C0050',41,'국어',63),('C0050',41,'영어',65),('C0050',41,'수학',56);
INSERT INTO exams VALUES ('C0051',41,'국어',64),('C0051',41,'영어',77),('C0051',41,'수학',74);
INSERT INTO exams VALUES ('C0052',41,'국어',87),('C0052',41,'영어',83),('C0052',41,'수학',91);
INSERT INTO exams VALUES ('C0053',41,'국어',79),('C0053',41,'영어',90),('C0053',41,'수학',75);
INSERT INTO exams VALUES ('C0054',41,'국어',80),('C0054',41,'영어',81),('C0054',41,'수학',95);
INSERT INTO exams VALUES ('C0055',41,'국어',58),('C0055',41,'영어',34),('C0055',41,'수학',27);
INSERT INTO exams VALUES ('C0056',41,'국어',68),('C0056',41,'영어',75),('C0056',41,'수학',86);
INSERT INTO exams VALUES ('C0057',41,'국어',98),('C0057',41,'영어',78),('C0057',41,'수학',99);
INSERT INTO exams VALUES ('C0058',41,'국어',89),('C0058',41,'영어',98),('C0058',41,'수학',81);
INSERT INTO exams VALUES ('C0059',41,'국어',85),('C0059',41,'영어',72),('C0059',41,'수학',73);
INSERT INTO exams VALUES ('C0060',41,'국어',55),('C0060',41,'영어',67),('C0060',41,'수학',32);
INSERT INTO exams VALUES ('C0061',41,'국어',99),('C0061',41,'영어',79),('C0061',41,'수학',83);
INSERT INTO exams VALUES ('C0062',41,'국어',75),('C0062',41,'영어',84),('C0062',41,'수학',72);
INSERT INTO exams VALUES ('C0063',41,'국어',62),('C0063',41,'영어',84),('C0063',41,'수학',84);
INSERT INTO exams VALUES ('C0064',41,'국어',68),('C0064',41,'영어',62),('C0064',41,'수학',83);
INSERT INTO exams VALUES ('C0065',41,'국어',96),('C0065',41,'영어',83),('C0065',41,'수학',77);
INSERT INTO exams VALUES ('C0066',41,'국어',81),('C0066',41,'영어',81),('C0066',41,'수학',85);
INSERT INTO exams VALUES ('C0067',41,'국어',77),('C0067',41,'영어',69),('C0067',41,'수학',29);
INSERT INTO exams VALUES ('C0068',41,'국어',50),('C0068',41,'영어',46),('C0068',41,'수학',63);
INSERT INTO exams VALUES ('C0069',41,'국어',71),('C0069',41,'영어',75),('C0069',41,'수학',63);
INSERT INTO exams VALUES ('C0070',41,'국어',44),('C0070',41,'영어',55),('C0070',41,'수학',55);
INSERT INTO exams VALUES ('C0071',41,'국어',25),('C0071',41,'영어',81),('C0071',41,'수학',67);
INSERT INTO exams VALUES ('C0072',41,'국어',43),('C0072',41,'영어',36),('C0072',41,'수학',42);
INSERT INTO exams VALUES ('C0073',41,'국어',54),('C0073',41,'영어',41),('C0073',41,'수학',51);
INSERT INTO exams VALUES ('C0074',41,'국어',76),('C0074',41,'영어',82),('C0074',41,'수학',77);
INSERT INTO exams VALUES ('C0075',41,'국어',61),('C0075',41,'영어',62),('C0075',41,'수학',84);
INSERT INTO exams VALUES ('C0076',41,'국어',26),('C0076',41,'영어',50),('C0076',41,'수학',44);
INSERT INTO exams VALUES ('C0077',41,'국어',66),('C0077',41,'영어',36),('C0077',41,'수학',35);
INSERT INTO exams VALUES ('C0078',41,'국어',33),('C0078',41,'영어',55),('C0078',41,'수학',27);
INSERT INTO exams VALUES ('C0079',41,'국어',74),('C0079',41,'영어',69),('C0079',41,'수학',81);
INSERT INTO exams VALUES ('C0010',41,'국어',81),('C0010',41,'영어',61),('C0010',41,'수학',76);
INSERT INTO exams VALUES ('C0081',41,'국어',99),('C0081',41,'영어',82),('C0081',41,'수학',95);
INSERT INTO exams VALUES ('C0082',41,'국어',70),('C0082',41,'영어',83),('C0082',41,'수학',70);
INSERT INTO exams VALUES ('C0083',41,'국어',74),('C0083',41,'영어',74),('C0083',41,'수학',85);
INSERT INTO exams VALUES ('C0084',41,'국어',66),('C0084',41,'영어',69),('C0084',41,'수학',27);
INSERT INTO exams VALUES ('C0085',41,'국어',61),('C0085',41,'영어',64),('C0085',41,'수학',70);
INSERT INTO exams VALUES ('C0086',41,'국어',62),('C0086',41,'영어',42),('C0086',41,'수학',34);
INSERT INTO exams VALUES ('C0087',41,'국어',81),('C0087',41,'영어',96),('C0087',41,'수학',89);
INSERT INTO exams VALUES ('C0088',41,'국어',95),('C0088',41,'영어',70),('C0088',41,'수학',77);
INSERT INTO exams VALUES ('C0089',41,'국어',77),('C0089',41,'영어',88),('C0089',41,'수학',93);
INSERT INTO exams VALUES ('C0010',41,'국어',27),('C0010',41,'영어',60),('C0010',41,'수학',64);
INSERT INTO exams VALUES ('C0091',41,'국어',82),('C0091',41,'영어',81),('C0091',41,'수학',86);
INSERT INTO exams VALUES ('C0092',41,'국어',63),('C0092',41,'영어',69),('C0092',41,'수학',74);
INSERT INTO exams VALUES ('C0093',41,'국어',79),('C0093',41,'영어',84),('C0093',41,'수학',82);
INSERT INTO exams VALUES ('C0094',41,'국어',97),('C0094',41,'영어',85),('C0094',41,'수학',85);
INSERT INTO exams VALUES ('C0095',41,'국어',99),('C0095',41,'영어',76),('C0095',41,'수학',78);
INSERT INTO exams VALUES ('C0096',41,'국어',87),('C0096',41,'영어',77),('C0096',41,'수학',91);
INSERT INTO exams VALUES ('C0097',41,'국어',60),('C0097',41,'영어',62),('C0097',41,'수학',85);
INSERT INTO exams VALUES ('C0098',41,'국어',70),('C0098',41,'영어',74),('C0098',41,'수학',65);
INSERT INTO exams VALUES ('C0099',41,'국어',65),('C0099',41,'영어',60),('C0099',41,'수학',68);
INSERT INTO exams VALUES ('C0100',41,'국어',64),('C0100',41,'영어',69),('C0100',41,'수학',49);
INSERT INTO exams VALUES ('C0101',41,'국어',64),('C0101',41,'영어',81),('C0101',41,'수학',62);
INSERT INTO exams VALUES ('C0102',41,'국어',61),('C0102',41,'영어',62),('C0102',41,'수학',72);
INSERT INTO exams VALUES ('C0103',41,'국어',42),('C0103',41,'영어',35),('C0103',41,'수학',32);
INSERT INTO exams VALUES ('C0104',41,'국어',85),('C0104',41,'영어',69),('C0104',41,'수학',60);
INSERT INTO exams VALUES ('C0105',41,'국어',94),('C0105',41,'영어',42),('C0105',41,'수학',83);
INSERT INTO exams VALUES ('C0106',41,'국어',84),('C0106',41,'영어',89),('C0106',41,'수학',75);
INSERT INTO exams VALUES ('C0107',41,'국어',85),('C0107',41,'영어',100),('C0107',41,'수학',86);
INSERT INTO exams VALUES ('C0108',41,'국어',34),('C0108',41,'영어',50),('C0108',41,'수학',65);
INSERT INTO exams VALUES ('C0109',41,'국어',73),('C0109',41,'영어',77),('C0109',41,'수학',61);
INSERT INTO exams VALUES ('C0110',41,'국어',56),('C0110',41,'영어',61),('C0110',41,'수학',46);
INSERT INTO exams VALUES ('C0111',41,'국어',34),('C0111',41,'영어',36),('C0111',41,'수학',63);
INSERT INTO exams VALUES ('C0112',41,'국어',26),('C0112',41,'영어',68),('C0112',41,'수학',34);
INSERT INTO exams VALUES ('C0113',41,'국어',40),('C0113',41,'영어',57),('C0113',41,'수학',65);
INSERT INTO exams VALUES ('C0114',41,'국어',54),('C0114',41,'영어',55),('C0114',41,'수학',42);
INSERT INTO exams VALUES ('C0115',41,'국어',64),('C0115',41,'영어',84),('C0115',41,'수학',74);
INSERT INTO exams VALUES ('C0116',41,'국어',48),('C0116',41,'영어',41),('C0116',41,'수학',70);
INSERT INTO exams VALUES ('C0117',41,'국어',77),('C0117',41,'영어',78),('C0117',41,'수학',91);
INSERT INTO exams VALUES ('C0118',41,'국어',88),('C0118',41,'영어',100),('C0118',41,'수학',84);
INSERT INTO exams VALUES ('C0119',41,'국어',91),('C0119',41,'영어',98),('C0119',41,'수학',97);
INSERT INTO exams VALUES ('C0120',41,'국어',60),('C0120',41,'영어',34),('C0120',41,'수학',43);
/*
## no 42
*/
-- DELETE FROM exams WHERE exam_no=42;
INSERT INTO exams VALUES ('C0001',42,'국어',87),('C0001',42,'영어',99),('C0001',42,'수학',80);
INSERT INTO exams VALUES ('C0002',42,'국어',92),('C0002',42,'영어',92),('C0002',42,'수학',79);
INSERT INTO exams VALUES ('C0003',42,'국어',69),('C0003',42,'영어',68),('C0003',42,'수학',66);
INSERT INTO exams VALUES ('C0004',42,'국어',37),('C0004',42,'영어',68),('C0004',42,'수학',53);
INSERT INTO exams VALUES ('C0005',42,'국어',81),('C0005',42,'영어',81),('C0005',42,'수학',78);
INSERT INTO exams VALUES ('C0006',42,'국어',46),('C0006',42,'영어',43),('C0006',42,'수학',44);
INSERT INTO exams VALUES ('C0007',42,'국어',82),('C0007',42,'영어',61),('C0007',42,'수학',74);
INSERT INTO exams VALUES ('C0008',42,'국어',78),('C0008',42,'영어',87),('C0008',42,'수학',99);
INSERT INTO exams VALUES ('C0009',42,'국어',71),('C0009',42,'영어',73),('C0009',42,'수학',79);
INSERT INTO exams VALUES ('C0010',42,'국어',71),('C0010',42,'영어',93),('C0010',42,'수학',68);
INSERT INTO exams VALUES ('C0011',42,'국어',77),('C0011',42,'영어',87),('C0011',42,'수학',88);
INSERT INTO exams VALUES ('C0012',42,'국어',99),('C0012',42,'영어',72),('C0012',42,'수학',97);
INSERT INTO exams VALUES ('C0013',42,'국어',82),('C0013',42,'영어',66),('C0013',42,'수학',83);
INSERT INTO exams VALUES ('C0014',42,'국어',92),('C0014',42,'영어',62),('C0014',42,'수학',72);
INSERT INTO exams VALUES ('C0015',42,'국어',89),('C0015',42,'영어',80),('C0015',42,'수학',67);
INSERT INTO exams VALUES ('C0016',42,'국어',98),('C0016',42,'영어',96),('C0016',42,'수학',84);
INSERT INTO exams VALUES ('C0017',42,'국어',99),('C0017',42,'영어',93),('C0017',42,'수학',86);
INSERT INTO exams VALUES ('C0019',42,'국어',39),('C0019',42,'영어',61),('C0019',42,'수학',33);
INSERT INTO exams VALUES ('C0020',42,'국어',79),('C0020',42,'영어',85),('C0020',42,'수학',83);
INSERT INTO exams VALUES ('C0021',42,'국어',60),('C0021',42,'영어',74),('C0021',42,'수학',76);
INSERT INTO exams VALUES ('C0022',42,'국어',73),('C0022',42,'영어',65),('C0022',42,'수학',61);
INSERT INTO exams VALUES ('C0023',42,'국어',85),('C0023',42,'영어',97),('C0023',42,'수학',97);
INSERT INTO exams VALUES ('C0024',42,'국어',80),('C0024',42,'영어',87),('C0024',42,'수학',90);
INSERT INTO exams VALUES ('C0025',42,'국어',76),('C0025',42,'영어',81),('C0025',42,'수학',81);
INSERT INTO exams VALUES ('C0026',42,'국어',61),('C0026',42,'영어',52),('C0026',42,'수학',31);
INSERT INTO exams VALUES ('C0027',42,'국어',74),('C0027',42,'영어',81),('C0027',42,'수학',63);
INSERT INTO exams VALUES ('C0028',42,'국어',36),('C0028',42,'영어',44),('C0028',42,'수학',56);
INSERT INTO exams VALUES ('C0029',42,'국어',100),('C0029',42,'영어',92),('C0029',42,'수학',86);
INSERT INTO exams VALUES ('C0030',42,'국어',81),('C0030',42,'영어',62),('C0030',42,'수학',100);
INSERT INTO exams VALUES ('C0031',42,'국어',72),('C0031',42,'영어',73),('C0031',42,'수학',69);
INSERT INTO exams VALUES ('C0032',42,'국어',73),('C0032',42,'영어',70),('C0032',42,'수학',82);
INSERT INTO exams VALUES ('C0033',42,'국어',82),('C0033',42,'영어',90),('C0033',42,'수학',96);
INSERT INTO exams VALUES ('C0034',42,'국어',72),('C0034',42,'영어',78),('C0034',42,'수학',60);
INSERT INTO exams VALUES ('C0035',42,'국어',72),('C0035',42,'영어',75),('C0035',42,'수학',60);
INSERT INTO exams VALUES ('C0036',42,'국어',85),('C0036',42,'영어',94),('C0036',42,'수학',97);
INSERT INTO exams VALUES ('C0037',42,'국어',96),('C0037',42,'영어',85),('C0037',42,'수학',82);
INSERT INTO exams VALUES ('C0038',42,'국어',88),('C0038',42,'영어',93),('C0038',42,'수학',100);
INSERT INTO exams VALUES ('C0039',42,'국어',93),('C0039',42,'영어',92),('C0039',42,'수학',100);
INSERT INTO exams VALUES ('C0040',42,'국어',95),('C0040',42,'영어',84),('C0040',42,'수학',88);
INSERT INTO exams VALUES ('C0041',42,'국어',82),('C0041',42,'영어',61),('C0041',42,'수학',63);
INSERT INTO exams VALUES ('C0042',42,'국어',61),('C0042',42,'영어',77),('C0042',42,'수학',67);
INSERT INTO exams VALUES ('C0043',42,'국어',82),('C0043',42,'영어',85),('C0043',42,'수학',98);
INSERT INTO exams VALUES ('C0044',42,'국어',84),('C0044',42,'영어',86),('C0044',42,'수학',72);
INSERT INTO exams VALUES ('C0045',42,'국어',65),('C0045',42,'영어',59),('C0045',42,'수학',60);
INSERT INTO exams VALUES ('C0046',42,'국어',68),('C0046',42,'영어',85),('C0046',42,'수학',88);
INSERT INTO exams VALUES ('C0047',42,'국어',73),('C0047',42,'영어',61),('C0047',42,'수학',92);
INSERT INTO exams VALUES ('C0048',42,'국어',66),('C0048',42,'영어',75),('C0048',42,'수학',68);
INSERT INTO exams VALUES ('C0049',42,'국어',80),('C0049',42,'영어',83),('C0049',42,'수학',84);
INSERT INTO exams VALUES ('C0050',42,'국어',35),('C0050',42,'영어',54),('C0050',42,'수학',67);
INSERT INTO exams VALUES ('C0051',42,'국어',83),('C0051',42,'영어',82),('C0051',42,'수학',71);
INSERT INTO exams VALUES ('C0052',42,'국어',80),('C0052',42,'영어',85),('C0052',42,'수학',80);
INSERT INTO exams VALUES ('C0053',42,'국어',79),('C0053',42,'영어',89),('C0053',42,'수학',82);
INSERT INTO exams VALUES ('C0054',42,'국어',97),('C0054',42,'영어',90),('C0054',42,'수학',90);
INSERT INTO exams VALUES ('C0055',42,'국어',32),('C0055',42,'영어',31),('C0055',42,'수학',36);
INSERT INTO exams VALUES ('C0056',42,'국어',70),('C0056',42,'영어',82),('C0056',42,'수학',94);
INSERT INTO exams VALUES ('C0057',42,'국어',95),('C0057',42,'영어',85),('C0057',42,'수학',95);
INSERT INTO exams VALUES ('C0058',42,'국어',82),('C0058',42,'영어',90),('C0058',42,'수학',86);
INSERT INTO exams VALUES ('C0059',42,'국어',65),('C0059',42,'영어',69),('C0059',42,'수학',83);
INSERT INTO exams VALUES ('C0060',42,'국어',59),('C0060',42,'영어',53),('C0060',42,'수학',52);
INSERT INTO exams VALUES ('C0061',42,'국어',93),('C0061',42,'영어',96),('C0061',42,'수학',85);
INSERT INTO exams VALUES ('C0062',42,'국어',68),('C0062',42,'영어',63),('C0062',42,'수학',62);
INSERT INTO exams VALUES ('C0063',42,'국어',82),('C0063',42,'영어',63),('C0063',42,'수학',71);
INSERT INTO exams VALUES ('C0064',42,'국어',64),('C0064',42,'영어',65),('C0064',42,'수학',75);
INSERT INTO exams VALUES ('C0065',42,'국어',80),('C0065',42,'영어',88),('C0065',42,'수학',81);
INSERT INTO exams VALUES ('C0066',42,'국어',97),('C0066',42,'영어',81),('C0066',42,'수학',90);
INSERT INTO exams VALUES ('C0067',42,'국어',91),('C0067',42,'영어',43),('C0067',42,'수학',37);
INSERT INTO exams VALUES ('C0068',42,'국어',44),('C0068',42,'영어',42),('C0068',42,'수학',37);
INSERT INTO exams VALUES ('C0069',42,'국어',82),('C0069',42,'영어',78),('C0069',42,'수학',74);
INSERT INTO exams VALUES ('C0070',42,'국어',34),('C0070',42,'영어',49),('C0070',42,'수학',34);
INSERT INTO exams VALUES ('C0071',42,'국어',30),('C0071',42,'영어',83),('C0071',42,'수학',83);
INSERT INTO exams VALUES ('C0072',42,'국어',49),('C0072',42,'영어',55),('C0072',42,'수학',30);
INSERT INTO exams VALUES ('C0073',42,'국어',53),('C0073',42,'영어',48),('C0073',42,'수학',37);
INSERT INTO exams VALUES ('C0074',42,'국어',82),('C0074',42,'영어',92),('C0074',42,'수학',85);
INSERT INTO exams VALUES ('C0075',42,'국어',75),('C0075',42,'영어',81),('C0075',42,'수학',72);
INSERT INTO exams VALUES ('C0076',42,'국어',52),('C0076',42,'영어',52),('C0076',42,'수학',69);
INSERT INTO exams VALUES ('C0077',42,'국어',40),('C0077',42,'영어',34),('C0077',42,'수학',52);
INSERT INTO exams VALUES ('C0078',42,'국어',40),('C0078',42,'영어',51),('C0078',42,'수학',67);
INSERT INTO exams VALUES ('C0079',42,'국어',78),('C0079',42,'영어',73),('C0079',42,'수학',85);
INSERT INTO exams VALUES ('C0010',42,'국어',71),('C0010',42,'영어',67),('C0010',42,'수학',70);
INSERT INTO exams VALUES ('C0081',42,'국어',78),('C0081',42,'영어',95),('C0081',42,'수학',81);
INSERT INTO exams VALUES ('C0082',42,'국어',76),('C0082',42,'영어',85),('C0082',42,'수학',78);
INSERT INTO exams VALUES ('C0083',42,'국어',63),('C0083',42,'영어',78),('C0083',42,'수학',65);
INSERT INTO exams VALUES ('C0084',42,'국어',60),('C0084',42,'영어',37),('C0084',42,'수학',60);
INSERT INTO exams VALUES ('C0085',42,'국어',65),('C0085',42,'영어',62),('C0085',42,'수학',68);
INSERT INTO exams VALUES ('C0086',42,'국어',38),('C0086',42,'영어',69),('C0086',42,'수학',54);
INSERT INTO exams VALUES ('C0087',42,'국어',91),('C0087',42,'영어',97),('C0087',42,'수학',92);
INSERT INTO exams VALUES ('C0088',42,'국어',85),('C0088',42,'영어',84),('C0088',42,'수학',69);
INSERT INTO exams VALUES ('C0089',42,'국어',88),('C0089',42,'영어',85),('C0089',42,'수학',98);
INSERT INTO exams VALUES ('C0010',42,'국어',39),('C0010',42,'영어',53),('C0010',42,'수학',66);
INSERT INTO exams VALUES ('C0091',42,'국어',68),('C0091',42,'영어',85),('C0091',42,'수학',95);
INSERT INTO exams VALUES ('C0092',42,'국어',62),('C0092',42,'영어',62),('C0092',42,'수학',70);
INSERT INTO exams VALUES ('C0093',42,'국어',98),('C0093',42,'영어',94),('C0093',42,'수학',83);
INSERT INTO exams VALUES ('C0094',42,'국어',93),('C0094',42,'영어',86),('C0094',42,'수학',81);
INSERT INTO exams VALUES ('C0095',42,'국어',83),('C0095',42,'영어',86),('C0095',42,'수학',89);
INSERT INTO exams VALUES ('C0096',42,'국어',87),('C0096',42,'영어',83),('C0096',42,'수학',96);
INSERT INTO exams VALUES ('C0097',42,'국어',61),('C0097',42,'영어',60),('C0097',42,'수학',62);
INSERT INTO exams VALUES ('C0098',42,'국어',62),('C0098',42,'영어',74),('C0098',42,'수학',63);
INSERT INTO exams VALUES ('C0099',42,'국어',81),('C0099',42,'영어',78),('C0099',42,'수학',69);
INSERT INTO exams VALUES ('C0100',42,'국어',70),('C0100',42,'영어',41),('C0100',42,'수학',35);
INSERT INTO exams VALUES ('C0101',42,'국어',84),('C0101',42,'영어',62),('C0101',42,'수학',70);
INSERT INTO exams VALUES ('C0102',42,'국어',74),('C0102',42,'영어',78),('C0102',42,'수학',65);
INSERT INTO exams VALUES ('C0103',42,'국어',63),('C0103',42,'영어',56),('C0103',42,'수학',69);
INSERT INTO exams VALUES ('C0104',42,'국어',66),('C0104',42,'영어',72),('C0104',42,'수학',76);
INSERT INTO exams VALUES ('C0105',42,'국어',79),('C0105',42,'영어',63),('C0105',42,'수학',93);
INSERT INTO exams VALUES ('C0107',42,'국어',86),('C0107',42,'영어',82),('C0107',42,'수학',85);
INSERT INTO exams VALUES ('C0108',42,'국어',69),('C0108',42,'영어',64),('C0108',42,'수학',64);
INSERT INTO exams VALUES ('C0109',42,'국어',72),('C0109',42,'영어',65),('C0109',42,'수학',79);
INSERT INTO exams VALUES ('C0110',42,'국어',41),('C0110',42,'영어',34),('C0110',42,'수학',42);
INSERT INTO exams VALUES ('C0111',42,'국어',51),('C0111',42,'영어',59),('C0111',42,'수학',45);
INSERT INTO exams VALUES ('C0112',42,'국어',70),('C0112',42,'영어',42),('C0112',42,'수학',45);
INSERT INTO exams VALUES ('C0113',42,'국어',65),('C0113',42,'영어',67),('C0113',42,'수학',46);
INSERT INTO exams VALUES ('C0114',42,'국어',52),('C0114',42,'영어',66),('C0114',42,'수학',55);
INSERT INTO exams VALUES ('C0115',42,'국어',65),('C0115',42,'영어',78),('C0115',42,'수학',81);
INSERT INTO exams VALUES ('C0116',42,'국어',40),('C0116',42,'영어',58),('C0116',42,'수학',56);
INSERT INTO exams VALUES ('C0117',42,'국어',97),('C0117',42,'영어',86),('C0117',42,'수학',88);
INSERT INTO exams VALUES ('C0118',42,'국어',89),('C0118',42,'영어',98),('C0118',42,'수학',100);
INSERT INTO exams VALUES ('C0119',42,'국어',96),('C0119',42,'영어',97),('C0119',42,'수학',93);
INSERT INTO exams VALUES ('C0120',42,'국어',49),('C0120',42,'영어',56),('C0120',42,'수학',42);
/*
## no 43
*/
-- DELETE FROM exams WHERE exam_no=43;
INSERT INTO exams VALUES ('C0001',43,'국어',79),('C0001',43,'영어',95),('C0001',43,'수학',83);
INSERT INTO exams VALUES ('C0002',43,'국어',90),('C0002',43,'영어',87),('C0002',43,'수학',97);
INSERT INTO exams VALUES ('C0003',43,'국어',80),('C0003',43,'영어',68),('C0003',43,'수학',73);
INSERT INTO exams VALUES ('C0004',43,'국어',53),('C0004',43,'영어',54),('C0004',43,'수학',33);
INSERT INTO exams VALUES ('C0005',43,'국어',77),('C0005',43,'영어',79),('C0005',43,'수학',84);
INSERT INTO exams VALUES ('C0006',43,'국어',61),('C0006',43,'영어',49),('C0006',43,'수학',60);
INSERT INTO exams VALUES ('C0007',43,'국어',82),('C0007',43,'영어',77),('C0007',43,'수학',75);
INSERT INTO exams VALUES ('C0009',43,'국어',67),('C0009',43,'영어',77),('C0009',43,'수학',68);
INSERT INTO exams VALUES ('C0010',43,'국어',67),('C0010',43,'영어',99),('C0010',43,'수학',79);
INSERT INTO exams VALUES ('C0011',43,'국어',83),('C0011',43,'영어',99),('C0011',43,'수학',93);
INSERT INTO exams VALUES ('C0012',43,'국어',95),('C0012',43,'영어',84),('C0012',43,'수학',90);
INSERT INTO exams VALUES ('C0013',43,'국어',77),('C0013',43,'영어',76),('C0013',43,'수학',74);
INSERT INTO exams VALUES ('C0014',43,'국어',82),('C0014',43,'영어',69),('C0014',43,'수학',75);
INSERT INTO exams VALUES ('C0015',43,'국어',99),('C0015',43,'영어',70),('C0015',43,'수학',82);
INSERT INTO exams VALUES ('C0016',43,'국어',81),('C0016',43,'영어',100),('C0016',43,'수학',87);
INSERT INTO exams VALUES ('C0017',43,'국어',96),('C0017',43,'영어',100),('C0017',43,'수학',82);
INSERT INTO exams VALUES ('C0018',43,'국어',95),('C0018',43,'영어',90),('C0018',43,'수학',99);
INSERT INTO exams VALUES ('C0019',43,'국어',45),('C0019',43,'영어',36),('C0019',43,'수학',47);
INSERT INTO exams VALUES ('C0020',43,'국어',82),('C0020',43,'영어',83),('C0020',43,'수학',81);
INSERT INTO exams VALUES ('C0021',43,'국어',74),('C0021',43,'영어',68),('C0021',43,'수학',81);
INSERT INTO exams VALUES ('C0022',43,'국어',83),('C0022',43,'영어',85),('C0022',43,'수학',68);
INSERT INTO exams VALUES ('C0023',43,'국어',95),('C0023',43,'영어',88),('C0023',43,'수학',77);
INSERT INTO exams VALUES ('C0024',43,'국어',82),('C0024',43,'영어',92),('C0024',43,'수학',85);
INSERT INTO exams VALUES ('C0025',43,'국어',75),('C0025',43,'영어',74),('C0025',43,'수학',76);
INSERT INTO exams VALUES ('C0026',43,'국어',68),('C0026',43,'영어',32),('C0026',43,'수학',33);
INSERT INTO exams VALUES ('C0027',43,'국어',66),('C0027',43,'영어',67),('C0027',43,'수학',79);
INSERT INTO exams VALUES ('C0028',43,'국어',48),('C0028',43,'영어',53),('C0028',43,'수학',67);
INSERT INTO exams VALUES ('C0029',43,'국어',96),('C0029',43,'영어',79),('C0029',43,'수학',95);
INSERT INTO exams VALUES ('C0030',43,'국어',84),('C0030',43,'영어',82),('C0030',43,'수학',93);
INSERT INTO exams VALUES ('C0031',43,'국어',76),('C0031',43,'영어',69),('C0031',43,'수학',67);
INSERT INTO exams VALUES ('C0032',43,'국어',82),('C0032',43,'영어',66),('C0032',43,'수학',81);
INSERT INTO exams VALUES ('C0033',43,'국어',99),('C0033',43,'영어',81),('C0033',43,'수학',83);
INSERT INTO exams VALUES ('C0034',43,'국어',71),('C0034',43,'영어',70),('C0034',43,'수학',75);
INSERT INTO exams VALUES ('C0035',43,'국어',80),('C0035',43,'영어',79),('C0035',43,'수학',72);
INSERT INTO exams VALUES ('C0036',43,'국어',77),('C0036',43,'영어',99),('C0036',43,'수학',80);
INSERT INTO exams VALUES ('C0037',43,'국어',82),('C0037',43,'영어',100),('C0037',43,'수학',86);
INSERT INTO exams VALUES ('C0038',43,'국어',96),('C0038',43,'영어',83),('C0038',43,'수학',79);
INSERT INTO exams VALUES ('C0040',43,'국어',87),('C0040',43,'영어',95),('C0040',43,'수학',99);
INSERT INTO exams VALUES ('C0041',43,'국어',79),('C0041',43,'영어',85),('C0041',43,'수학',77);
INSERT INTO exams VALUES ('C0042',43,'국어',65),('C0042',43,'영어',70),('C0042',43,'수학',66);
INSERT INTO exams VALUES ('C0043',43,'국어',90),('C0043',43,'영어',81),('C0043',43,'수학',86);
INSERT INTO exams VALUES ('C0044',43,'국어',83),('C0044',43,'영어',81),('C0044',43,'수학',77);
INSERT INTO exams VALUES ('C0045',43,'국어',61),('C0045',43,'영어',37),('C0045',43,'수학',42);
INSERT INTO exams VALUES ('C0046',43,'국어',83),('C0046',43,'영어',72),('C0046',43,'수학',95);
INSERT INTO exams VALUES ('C0047',43,'국어',75),('C0047',43,'영어',84),('C0047',43,'수학',77);
INSERT INTO exams VALUES ('C0048',43,'국어',71),('C0048',43,'영어',80),('C0048',43,'수학',76);
INSERT INTO exams VALUES ('C0049',43,'국어',67),('C0049',43,'영어',78),('C0049',43,'수학',76);
INSERT INTO exams VALUES ('C0050',43,'국어',35),('C0050',43,'영어',69),('C0050',43,'수학',45);
INSERT INTO exams VALUES ('C0051',43,'국어',68),('C0051',43,'영어',71),('C0051',43,'수학',68);
INSERT INTO exams VALUES ('C0052',43,'국어',97),('C0052',43,'영어',92),('C0052',43,'수학',99);
INSERT INTO exams VALUES ('C0053',43,'국어',83),('C0053',43,'영어',84),('C0053',43,'수학',93);
INSERT INTO exams VALUES ('C0054',43,'국어',79),('C0054',43,'영어',84),('C0054',43,'수학',81);
INSERT INTO exams VALUES ('C0055',43,'국어',63),('C0055',43,'영어',30),('C0055',43,'수학',65);
INSERT INTO exams VALUES ('C0056',43,'국어',78),('C0056',43,'영어',70),('C0056',43,'수학',83);
INSERT INTO exams VALUES ('C0057',43,'국어',94),('C0057',43,'영어',99),('C0057',43,'수학',85);
INSERT INTO exams VALUES ('C0058',43,'국어',77),('C0058',43,'영어',99),('C0058',43,'수학',85);
INSERT INTO exams VALUES ('C0059',43,'국어',72),('C0059',43,'영어',69),('C0059',43,'수학',82);
INSERT INTO exams VALUES ('C0060',43,'국어',41),('C0060',43,'영어',33),('C0060',43,'수학',61);
INSERT INTO exams VALUES ('C0061',43,'국어',82),('C0061',43,'영어',84),('C0061',43,'수학',98);
INSERT INTO exams VALUES ('C0063',43,'국어',65),('C0063',43,'영어',73),('C0063',43,'수학',68);
INSERT INTO exams VALUES ('C0064',43,'국어',65),('C0064',43,'영어',79),('C0064',43,'수학',67);
INSERT INTO exams VALUES ('C0065',43,'국어',83),('C0065',43,'영어',96),('C0065',43,'수학',78);
INSERT INTO exams VALUES ('C0066',43,'국어',99),('C0066',43,'영어',89),('C0066',43,'수학',93);
INSERT INTO exams VALUES ('C0067',43,'국어',97),('C0067',43,'영어',65),('C0067',43,'수학',33);
INSERT INTO exams VALUES ('C0068',43,'국어',57),('C0068',43,'영어',37),('C0068',43,'수학',43);
INSERT INTO exams VALUES ('C0069',43,'국어',73),('C0069',43,'영어',65),('C0069',43,'수학',72);
INSERT INTO exams VALUES ('C0070',43,'국어',53),('C0070',43,'영어',41),('C0070',43,'수학',40);
INSERT INTO exams VALUES ('C0071',43,'국어',41),('C0071',43,'영어',67),('C0071',43,'수학',72);
INSERT INTO exams VALUES ('C0072',43,'국어',31),('C0072',43,'영어',53),('C0072',43,'수학',50);
INSERT INTO exams VALUES ('C0073',43,'국어',60),('C0073',43,'영어',46),('C0073',43,'수학',55);
INSERT INTO exams VALUES ('C0074',43,'국어',78),('C0074',43,'영어',94),('C0074',43,'수학',79);
INSERT INTO exams VALUES ('C0075',43,'국어',70),('C0075',43,'영어',66),('C0075',43,'수학',85);
INSERT INTO exams VALUES ('C0076',43,'국어',52),('C0076',43,'영어',69),('C0076',43,'수학',55);
INSERT INTO exams VALUES ('C0077',43,'국어',69),('C0077',43,'영어',41),('C0077',43,'수학',45);
INSERT INTO exams VALUES ('C0078',43,'국어',52),('C0078',43,'영어',63),('C0078',43,'수학',40);
INSERT INTO exams VALUES ('C0079',43,'국어',70),('C0079',43,'영어',79),('C0079',43,'수학',79);
INSERT INTO exams VALUES ('C0010',43,'국어',67),('C0010',43,'영어',72),('C0010',43,'수학',81);
INSERT INTO exams VALUES ('C0081',43,'국어',86),('C0081',43,'영어',84),('C0081',43,'수학',99);
INSERT INTO exams VALUES ('C0082',43,'국어',78),('C0082',43,'영어',80),('C0082',43,'수학',73);
INSERT INTO exams VALUES ('C0083',43,'국어',81),('C0083',43,'영어',82),('C0083',43,'수학',72);
INSERT INTO exams VALUES ('C0084',43,'국어',39),('C0084',43,'영어',39),('C0084',43,'수학',34);
INSERT INTO exams VALUES ('C0085',43,'국어',72),('C0085',43,'영어',68),('C0085',43,'수학',65);
INSERT INTO exams VALUES ('C0086',43,'국어',49),('C0086',43,'영어',65),('C0086',43,'수학',58);
INSERT INTO exams VALUES ('C0087',43,'국어',99),('C0087',43,'영어',84),('C0087',43,'수학',100);
INSERT INTO exams VALUES ('C0088',43,'국어',95),('C0088',43,'영어',78),('C0088',43,'수학',68);
INSERT INTO exams VALUES ('C0089',43,'국어',88),('C0089',43,'영어',94),('C0089',43,'수학',84);
INSERT INTO exams VALUES ('C0010',43,'국어',65),('C0010',43,'영어',33),('C0010',43,'수학',44);
INSERT INTO exams VALUES ('C0091',43,'국어',68),('C0091',43,'영어',74),('C0091',43,'수학',94);
INSERT INTO exams VALUES ('C0092',43,'국어',83),('C0092',43,'영어',83),('C0092',43,'수학',76);
INSERT INTO exams VALUES ('C0093',43,'국어',86),('C0093',43,'영어',85),('C0093',43,'수학',84);
INSERT INTO exams VALUES ('C0094',43,'국어',88),('C0094',43,'영어',86),('C0094',43,'수학',96);
INSERT INTO exams VALUES ('C0095',43,'국어',82),('C0095',43,'영어',96),('C0095',43,'수학',87);
INSERT INTO exams VALUES ('C0096',43,'국어',84),('C0096',43,'영어',70),('C0096',43,'수학',99);
INSERT INTO exams VALUES ('C0097',43,'국어',85),('C0097',43,'영어',80),('C0097',43,'수학',85);
INSERT INTO exams VALUES ('C0098',43,'국어',83),('C0098',43,'영어',69),('C0098',43,'수학',80);
INSERT INTO exams VALUES ('C0099',43,'국어',71),('C0099',43,'영어',76),('C0099',43,'수학',75);
INSERT INTO exams VALUES ('C0100',43,'국어',38),('C0100',43,'영어',60),('C0100',43,'수학',63);
INSERT INTO exams VALUES ('C0101',43,'국어',68),('C0101',43,'영어',84),('C0101',43,'수학',71);
INSERT INTO exams VALUES ('C0102',43,'국어',67),('C0102',43,'영어',68),('C0102',43,'수학',83);
INSERT INTO exams VALUES ('C0103',43,'국어',56),('C0103',43,'영어',60),('C0103',43,'수학',65);
INSERT INTO exams VALUES ('C0104',43,'국어',78),('C0104',43,'영어',74),('C0104',43,'수학',76);
INSERT INTO exams VALUES ('C0105',43,'국어',81),('C0105',43,'영어',48),('C0105',43,'수학',81);
INSERT INTO exams VALUES ('C0106',43,'국어',82),('C0106',43,'영어',88),('C0106',43,'수학',80);
INSERT INTO exams VALUES ('C0107',43,'국어',99),('C0107',43,'영어',96),('C0107',43,'수학',96);
INSERT INTO exams VALUES ('C0108',43,'국어',44),('C0108',43,'영어',56),('C0108',43,'수학',65);
INSERT INTO exams VALUES ('C0109',43,'국어',72),('C0109',43,'영어',71),('C0109',43,'수학',81);
INSERT INTO exams VALUES ('C0110',43,'국어',54),('C0110',43,'영어',44),('C0110',43,'수학',34);
INSERT INTO exams VALUES ('C0111',43,'국어',36),('C0111',43,'영어',40),('C0111',43,'수학',35);
INSERT INTO exams VALUES ('C0112',43,'국어',65),('C0112',43,'영어',39),('C0112',43,'수학',34);
INSERT INTO exams VALUES ('C0113',43,'국어',36),('C0113',43,'영어',46),('C0113',43,'수학',66);
INSERT INTO exams VALUES ('C0114',43,'국어',68),('C0114',43,'영어',52),('C0114',43,'수학',36);
INSERT INTO exams VALUES ('C0115',43,'국어',82),('C0115',43,'영어',76),('C0115',43,'수학',71);
INSERT INTO exams VALUES ('C0116',43,'국어',65),('C0116',43,'영어',59),('C0116',43,'수학',54);
INSERT INTO exams VALUES ('C0117',43,'국어',77),('C0117',43,'영어',86),('C0117',43,'수학',86);
INSERT INTO exams VALUES ('C0118',43,'국어',88),('C0118',43,'영어',93),('C0118',43,'수학',99);
INSERT INTO exams VALUES ('C0119',43,'국어',79),('C0119',43,'영어',87),('C0119',43,'수학',82);
INSERT INTO exams VALUES ('C0120',43,'국어',68),('C0120',43,'영어',69),('C0120',43,'수학',69);
/*
## no 44
*/
-- DELETE FROM exams WHERE exam_no=44;
INSERT INTO exams VALUES ('C0001',44,'국어',92),('C0001',44,'영어',91),('C0001',44,'수학',86);
INSERT INTO exams VALUES ('C0003',44,'국어',80),('C0003',44,'영어',79),('C0003',44,'수학',76);
INSERT INTO exams VALUES ('C0004',44,'국어',60),('C0004',44,'영어',65),('C0004',44,'수학',67);
INSERT INTO exams VALUES ('C0006',44,'국어',41),('C0006',44,'영어',50),('C0006',44,'수학',65);
INSERT INTO exams VALUES ('C0007',44,'국어',85),('C0007',44,'영어',78),('C0007',44,'수학',86);
INSERT INTO exams VALUES ('C0008',44,'국어',98),('C0008',44,'영어',96),('C0008',44,'수학',82);
INSERT INTO exams VALUES ('C0010',44,'국어',76),('C0010',44,'영어',82),('C0010',44,'수학',72);
INSERT INTO exams VALUES ('C0011',44,'국어',76),('C0011',44,'영어',98),('C0011',44,'수학',84);
INSERT INTO exams VALUES ('C0012',44,'국어',81),('C0012',44,'영어',78),('C0012',44,'수학',100);
INSERT INTO exams VALUES ('C0014',44,'국어',100),('C0014',44,'영어',74),('C0014',44,'수학',65);
INSERT INTO exams VALUES ('C0016',44,'국어',92),('C0016',44,'영어',95),('C0016',44,'수학',99);
INSERT INTO exams VALUES ('C0017',44,'국어',84),('C0017',44,'영어',83),('C0017',44,'수학',95);
INSERT INTO exams VALUES ('C0018',44,'국어',84),('C0018',44,'영어',88),('C0018',44,'수학',84);
INSERT INTO exams VALUES ('C0020',44,'국어',84),('C0020',44,'영어',84),('C0020',44,'수학',65);
INSERT INTO exams VALUES ('C0021',44,'국어',70),('C0021',44,'영어',70),('C0021',44,'수학',79);
INSERT INTO exams VALUES ('C0022',44,'국어',88),('C0022',44,'영어',69),('C0022',44,'수학',82);
INSERT INTO exams VALUES ('C0023',44,'국어',80),('C0023',44,'영어',95),('C0023',44,'수학',85);
INSERT INTO exams VALUES ('C0024',44,'영어',81),('C0024',44,'수학',84);
INSERT INTO exams VALUES ('C0025',44,'국어',65),('C0025',44,'영어',68),('C0025',44,'수학',81);
INSERT INTO exams VALUES ('C0026',44,'국어',44),('C0026',44,'영어',50),('C0026',44,'수학',47);
INSERT INTO exams VALUES ('C0027',44,'국어',78),('C0027',44,'영어',78),('C0027',44,'수학',76);
INSERT INTO exams VALUES ('C0028',44,'국어',61),('C0028',44,'영어',54),('C0028',44,'수학',62);
INSERT INTO exams VALUES ('C0029',44,'국어',96),('C0029',44,'영어',86),('C0029',44,'수학',92);
INSERT INTO exams VALUES ('C0030',44,'국어',71),('C0030',44,'영어',70),('C0030',44,'수학',99);
INSERT INTO exams VALUES ('C0031',44,'국어',79),('C0031',44,'영어',80),('C0031',44,'수학',76);
INSERT INTO exams VALUES ('C0032',44,'국어',78),('C0032',44,'영어',83),('C0032',44,'수학',76);
INSERT INTO exams VALUES ('C0033',44,'영어',98),('C0033',44,'수학',84);
INSERT INTO exams VALUES ('C0034',44,'국어',78),('C0034',44,'영어',85),('C0034',44,'수학',67);
INSERT INTO exams VALUES ('C0035',44,'국어',80),('C0035',44,'영어',81),('C0035',44,'수학',70);
INSERT INTO exams VALUES ('C0036',44,'국어',94),('C0036',44,'영어',82),('C0036',44,'수학',90);
INSERT INTO exams VALUES ('C0037',44,'영어',89),('C0037',44,'수학',85);
INSERT INTO exams VALUES ('C0038',44,'국어',83),('C0038',44,'영어',81),('C0038',44,'수학',91);
INSERT INTO exams VALUES ('C0040',44,'국어',88),('C0040',44,'영어',81),('C0040',44,'수학',82);
INSERT INTO exams VALUES ('C0041',44,'국어',68),('C0041',44,'영어',72),('C0041',44,'수학',67);
INSERT INTO exams VALUES ('C0042',44,'국어',72),('C0042',44,'영어',86),('C0042',44,'수학',76);
INSERT INTO exams VALUES ('C0043',44,'국어',80),('C0043',44,'영어',85),('C0043',44,'수학',92);
INSERT INTO exams VALUES ('C0044',44,'국어',88),('C0044',44,'영어',87),('C0044',44,'수학',67);
INSERT INTO exams VALUES ('C0045',44,'국어',64),('C0045',44,'영어',42),('C0045',44,'수학',58);
INSERT INTO exams VALUES ('C0046',44,'국어',81),('C0046',44,'영어',86),('C0046',44,'수학',87);
INSERT INTO exams VALUES ('C0047',44,'국어',88),('C0047',44,'영어',68),('C0047',44,'수학',95);
INSERT INTO exams VALUES ('C0049',44,'국어',71),('C0049',44,'영어',72),('C0049',44,'수학',82);
INSERT INTO exams VALUES ('C0050',44,'국어',50),('C0050',44,'영어',64),('C0050',44,'수학',44);
INSERT INTO exams VALUES ('C0051',44,'국어',70),('C0051',44,'영어',69),('C0051',44,'수학',83);
INSERT INTO exams VALUES ('C0052',44,'국어',91),('C0052',44,'영어',88),('C0052',44,'수학',80);
INSERT INTO exams VALUES ('C0053',44,'국어',82),('C0053',44,'영어',91),('C0053',44,'수학',84);
INSERT INTO exams VALUES ('C0054',44,'국어',89),('C0054',44,'영어',89),('C0054',44,'수학',89);
INSERT INTO exams VALUES ('C0055',44,'국어',44),('C0055',44,'영어',65),('C0055',44,'수학',45);
INSERT INTO exams VALUES ('C0056',44,'국어',86),('C0056',44,'영어',80),('C0056',44,'수학',80);
INSERT INTO exams VALUES ('C0057',44,'국어',98),('C0057',44,'영어',100),('C0057',44,'수학',99);
INSERT INTO exams VALUES ('C0058',44,'국어',98),('C0058',44,'영어',97),('C0058',44,'수학',85);
INSERT INTO exams VALUES ('C0059',44,'국어',77),('C0059',44,'영어',74),('C0059',44,'수학',82);
INSERT INTO exams VALUES ('C0060',44,'국어',66),('C0060',44,'영어',45),('C0060',44,'수학',64);
INSERT INTO exams VALUES ('C0061',44,'영어',92),('C0061',44,'수학',86);
INSERT INTO exams VALUES ('C0062',44,'국어',65),('C0062',44,'영어',66),('C0062',44,'수학',65);
INSERT INTO exams VALUES ('C0063',44,'국어',66),('C0063',44,'영어',83),('C0063',44,'수학',79);
INSERT INTO exams VALUES ('C0064',44,'국어',74),('C0064',44,'영어',76),('C0064',44,'수학',80);
INSERT INTO exams VALUES ('C0065',44,'국어',95),('C0065',44,'영어',96),('C0065',44,'수학',95);
INSERT INTO exams VALUES ('C0066',44,'국어',92),('C0066',44,'영어',99),('C0066',44,'수학',100);
INSERT INTO exams VALUES ('C0067',44,'국어',89),('C0067',44,'영어',50),('C0067',44,'수학',45);
INSERT INTO exams VALUES ('C0068',44,'국어',41),('C0068',44,'영어',68),('C0068',44,'수학',50);
INSERT INTO exams VALUES ('C0069',44,'국어',69),('C0069',44,'영어',65),('C0069',44,'수학',84);
INSERT INTO exams VALUES ('C0070',44,'국어',42),('C0070',44,'영어',54),('C0070',44,'수학',51);
INSERT INTO exams VALUES ('C0071',44,'국어',53),('C0071',44,'영어',65),('C0071',44,'수학',82);
INSERT INTO exams VALUES ('C0072',44,'국어',65),('C0072',44,'영어',60),('C0072',44,'수학',46);
INSERT INTO exams VALUES ('C0073',44,'국어',49),('C0073',44,'영어',58),('C0073',44,'수학',68);
INSERT INTO exams VALUES ('C0074',44,'국어',93),('C0074',44,'영어',92);
INSERT INTO exams VALUES ('C0075',44,'국어',80),('C0075',44,'영어',73),('C0075',44,'수학',88);
INSERT INTO exams VALUES ('C0076',44,'국어',57),('C0076',44,'영어',40),('C0076',44,'수학',55);
INSERT INTO exams VALUES ('C0077',44,'국어',68),('C0077',44,'영어',56),('C0077',44,'수학',56);
INSERT INTO exams VALUES ('C0078',44,'국어',46),('C0078',44,'영어',46),('C0078',44,'수학',42);
INSERT INTO exams VALUES ('C0079',44,'국어',74),('C0079',44,'영어',79),('C0079',44,'수학',69);
INSERT INTO exams VALUES ('C0010',44,'국어',84),('C0010',44,'영어',81),('C0010',44,'수학',71);
INSERT INTO exams VALUES ('C0081',44,'국어',85),('C0081',44,'영어',99),('C0081',44,'수학',90);
INSERT INTO exams VALUES ('C0082',44,'국어',85),('C0082',44,'영어',76),('C0082',44,'수학',76);
INSERT INTO exams VALUES ('C0083',44,'국어',70),('C0083',44,'영어',86),('C0083',44,'수학',87);
INSERT INTO exams VALUES ('C0084',44,'국어',49),('C0084',44,'영어',47),('C0084',44,'수학',43);
INSERT INTO exams VALUES ('C0085',44,'국어',82),('C0085',44,'영어',70),('C0085',44,'수학',71);
INSERT INTO exams VALUES ('C0086',44,'국어',49),('C0086',44,'영어',70),('C0086',44,'수학',45);
INSERT INTO exams VALUES ('C0087',44,'국어',85),('C0087',44,'영어',95);
INSERT INTO exams VALUES ('C0088',44,'국어',93),('C0088',44,'영어',80),('C0088',44,'수학',65);
INSERT INTO exams VALUES ('C0089',44,'국어',94),('C0089',44,'영어',85),('C0089',44,'수학',90);
INSERT INTO exams VALUES ('C0010',44,'국어',70),('C0010',44,'영어',46),('C0010',44,'수학',65);
INSERT INTO exams VALUES ('C0091',44,'수학',86);
INSERT INTO exams VALUES ('C0092',44,'국어',78),('C0092',44,'영어',73),('C0092',44,'수학',78);
INSERT INTO exams VALUES ('C0093',44,'국어',96),('C0093',44,'영어',98),('C0093',44,'수학',89);
INSERT INTO exams VALUES ('C0094',44,'수학',81);
INSERT INTO exams VALUES ('C0095',44,'국어',95),('C0095',44,'영어',100),('C0095',44,'수학',91);
INSERT INTO exams VALUES ('C0096',44,'국어',80),('C0096',44,'영어',69),('C0096',44,'수학',96);
INSERT INTO exams VALUES ('C0097',44,'국어',83),('C0097',44,'영어',81),('C0097',44,'수학',78);
INSERT INTO exams VALUES ('C0098',44,'국어',77),('C0098',44,'영어',81),('C0098',44,'수학',78);
INSERT INTO exams VALUES ('C0099',44,'국어',73),('C0099',44,'영어',67),('C0099',44,'수학',70);
INSERT INTO exams VALUES ('C0100',44,'국어',59),('C0100',44,'영어',53),('C0100',44,'수학',65);
INSERT INTO exams VALUES ('C0101',44,'국어',69),('C0101',44,'영어',67),('C0101',44,'수학',80);
INSERT INTO exams VALUES ('C0102',44,'국어',66),('C0102',44,'영어',75),('C0102',44,'수학',79);
INSERT INTO exams VALUES ('C0104',44,'국어',73),('C0104',44,'영어',65),('C0104',44,'수학',85);
INSERT INTO exams VALUES ('C0105',44,'국어',92),('C0105',44,'영어',55),('C0105',44,'수학',85);
INSERT INTO exams VALUES ('C0107',44,'국어',92),('C0107',44,'영어',100),('C0107',44,'수학',88);
INSERT INTO exams VALUES ('C0108',44,'국어',62),('C0108',44,'영어',55),('C0108',44,'수학',80);
INSERT INTO exams VALUES ('C0110',44,'국어',51),('C0110',44,'영어',63),('C0110',44,'수학',59);
INSERT INTO exams VALUES ('C0111',44,'국어',68),('C0111',44,'영어',58),('C0111',44,'수학',52);
INSERT INTO exams VALUES ('C0112',44,'국어',46),('C0112',44,'영어',67),('C0112',44,'수학',57);
INSERT INTO exams VALUES ('C0113',44,'국어',47),('C0113',44,'영어',56),('C0113',44,'수학',69);
INSERT INTO exams VALUES ('C0114',44,'국어',46),('C0114',44,'영어',59),('C0114',44,'수학',56);
INSERT INTO exams VALUES ('C0115',44,'국어',69),('C0115',44,'영어',68),('C0115',44,'수학',69);
INSERT INTO exams VALUES ('C0116',44,'국어',41),('C0116',44,'영어',66),('C0116',44,'수학',60);
INSERT INTO exams VALUES ('C0117',44,'국어',87),('C0117',44,'영어',87),('C0117',44,'수학',81);
INSERT INTO exams VALUES ('C0118',44,'국어',100),('C0118',44,'영어',85),('C0118',44,'수학',83);
INSERT INTO exams VALUES ('C0119',44,'국어',89),('C0119',44,'영어',86),('C0119',44,'수학',98);
INSERT INTO exams VALUES ('C0120',44,'국어',50),('C0120',44,'영어',63),('C0120',44,'수학',43);
/*
## no 45
*/
-- DELETE FROM exams WHERE exam_no=45;
INSERT INTO exams VALUES ('C0001',45,'국어',88),('C0001',45,'영어',84),('C0001',45,'수학',99);
INSERT INTO exams VALUES ('C0002',45,'국어',96),('C0002',45,'영어',87),('C0002',45,'수학',98);
INSERT INTO exams VALUES ('C0003',45,'국어',90),('C0003',45,'영어',84),('C0003',45,'수학',83);
INSERT INTO exams VALUES ('C0004',45,'국어',64),('C0004',45,'영어',71),('C0004',45,'수학',72);
INSERT INTO exams VALUES ('C0005',45,'국어',73),('C0005',45,'영어',92),('C0005',45,'수학',82);
INSERT INTO exams VALUES ('C0006',45,'국어',50),('C0006',45,'영어',69),('C0006',45,'수학',70);
INSERT INTO exams VALUES ('C0007',45,'국어',75),('C0007',45,'영어',92),('C0007',45,'수학',78);
INSERT INTO exams VALUES ('C0009',45,'국어',88),('C0009',45,'영어',75),('C0009',45,'수학',88);
INSERT INTO exams VALUES ('C0010',45,'국어',70),('C0010',45,'영어',86),('C0010',45,'수학',92);
INSERT INTO exams VALUES ('C0011',45,'국어',79),('C0011',45,'영어',89),('C0011',45,'수학',96);
INSERT INTO exams VALUES ('C0012',45,'국어',100),('C0012',45,'영어',79),('C0012',45,'수학',100);
INSERT INTO exams VALUES ('C0013',45,'국어',85),('C0013',45,'영어',76),('C0013',45,'수학',70);
INSERT INTO exams VALUES ('C0014',45,'국어',88),('C0014',45,'영어',82),('C0014',45,'수학',84);
INSERT INTO exams VALUES ('C0015',45,'국어',87),('C0015',45,'영어',74),('C0015',45,'수학',75);
INSERT INTO exams VALUES ('C0016',45,'국어',89),('C0016',45,'영어',86),('C0016',45,'수학',96);
INSERT INTO exams VALUES ('C0017',45,'국어',89),('C0017',45,'영어',88),('C0017',45,'수학',82);
INSERT INTO exams VALUES ('C0018',45,'국어',97),('C0018',45,'영어',93),('C0018',45,'수학',98);
INSERT INTO exams VALUES ('C0019',45,'국어',64),('C0019',45,'영어',64),('C0019',45,'수학',69);
INSERT INTO exams VALUES ('C0020',45,'국어',94),('C0020',45,'영어',88),('C0020',45,'수학',81);
INSERT INTO exams VALUES ('C0021',45,'국어',75),('C0021',45,'영어',77),('C0021',45,'수학',74);
INSERT INTO exams VALUES ('C0022',45,'국어',83),('C0022',45,'영어',85),('C0022',45,'수학',72);
INSERT INTO exams VALUES ('C0023',45,'국어',92),('C0023',45,'영어',87),('C0023',45,'수학',94);
INSERT INTO exams VALUES ('C0024',45,'국어',82),('C0024',45,'영어',93),('C0024',45,'수학',90);
INSERT INTO exams VALUES ('C0025',45,'국어',70),('C0025',45,'영어',80),('C0025',45,'수학',78);
INSERT INTO exams VALUES ('C0026',45,'국어',69),('C0026',45,'영어',57),('C0026',45,'수학',72);
INSERT INTO exams VALUES ('C0027',45,'국어',79),('C0027',45,'영어',83),('C0027',45,'수학',84);
INSERT INTO exams VALUES ('C0028',45,'국어',50),('C0028',45,'영어',64),('C0028',45,'수학',67);
INSERT INTO exams VALUES ('C0029',45,'국어',89),('C0029',45,'영어',91),('C0029',45,'수학',99);
INSERT INTO exams VALUES ('C0030',45,'국어',85),('C0030',45,'영어',82),('C0030',45,'수학',99);
INSERT INTO exams VALUES ('C0031',45,'국어',85),('C0031',45,'영어',82),('C0031',45,'수학',81);
INSERT INTO exams VALUES ('C0032',45,'국어',90),('C0032',45,'영어',79),('C0032',45,'수학',74);
INSERT INTO exams VALUES ('C0033',45,'국어',99),('C0033',45,'영어',82),('C0033',45,'수학',95);
INSERT INTO exams VALUES ('C0034',45,'국어',75),('C0034',45,'영어',92),('C0034',45,'수학',76);
INSERT INTO exams VALUES ('C0035',45,'국어',76),('C0035',45,'영어',87),('C0035',45,'수학',81);
INSERT INTO exams VALUES ('C0036',45,'국어',90),('C0036',45,'영어',98),('C0036',45,'수학',90);
INSERT INTO exams VALUES ('C0037',45,'국어',100),('C0037',45,'영어',98),('C0037',45,'수학',100);
INSERT INTO exams VALUES ('C0038',45,'국어',82),('C0038',45,'영어',86),('C0038',45,'수학',86);
INSERT INTO exams VALUES ('C0040',45,'국어',87),('C0040',45,'영어',92),('C0040',45,'수학',95);
INSERT INTO exams VALUES ('C0041',45,'국어',90),('C0041',45,'영어',71),('C0041',45,'수학',71);
INSERT INTO exams VALUES ('C0042',45,'국어',88),('C0042',45,'영어',72),('C0042',45,'수학',90);
INSERT INTO exams VALUES ('C0043',45,'국어',82),('C0043',45,'영어',80),('C0043',45,'수학',94);
INSERT INTO exams VALUES ('C0044',45,'국어',88),('C0044',45,'영어',90),('C0044',45,'수학',83);
INSERT INTO exams VALUES ('C0045',45,'국어',60),('C0045',45,'영어',65),('C0045',45,'수학',69);
INSERT INTO exams VALUES ('C0046',45,'국어',83),('C0046',45,'영어',75),('C0046',45,'수학',92);
INSERT INTO exams VALUES ('C0047',45,'국어',72),('C0047',45,'영어',82),('C0047',45,'수학',87);
INSERT INTO exams VALUES ('C0048',45,'국어',73),('C0048',45,'영어',72),('C0048',45,'수학',80);
INSERT INTO exams VALUES ('C0049',45,'국어',75),('C0049',45,'영어',70),('C0049',45,'수학',92);
INSERT INTO exams VALUES ('C0050',45,'국어',69),('C0050',45,'영어',50),('C0050',45,'수학',60);
INSERT INTO exams VALUES ('C0051',45,'국어',74),('C0051',45,'영어',71),('C0051',45,'수학',74);
INSERT INTO exams VALUES ('C0052',45,'국어',87),('C0052',45,'영어',89),('C0052',45,'수학',83);
INSERT INTO exams VALUES ('C0053',45,'국어',84),('C0053',45,'영어',91),('C0053',45,'수학',92);
INSERT INTO exams VALUES ('C0054',45,'국어',85),('C0054',45,'영어',90),('C0054',45,'수학',95);
INSERT INTO exams VALUES ('C0055',45,'국어',55),('C0055',45,'영어',63),('C0055',45,'수학',63);
INSERT INTO exams VALUES ('C0056',45,'국어',78),('C0056',45,'영어',88),('C0056',45,'수학',89);
INSERT INTO exams VALUES ('C0057',45,'국어',83),('C0057',45,'영어',82),('C0057',45,'수학',90);
INSERT INTO exams VALUES ('C0058',45,'국어',94),('C0058',45,'영어',94),('C0058',45,'수학',100);
INSERT INTO exams VALUES ('C0059',45,'국어',85),('C0059',45,'영어',83),('C0059',45,'수학',88);
INSERT INTO exams VALUES ('C0060',45,'국어',60),('C0060',45,'영어',71),('C0060',45,'수학',73);
INSERT INTO exams VALUES ('C0061',45,'국어',83),('C0061',45,'영어',90),('C0061',45,'수학',88);
INSERT INTO exams VALUES ('C0063',45,'국어',72),('C0063',45,'영어',74),('C0063',45,'수학',85);
INSERT INTO exams VALUES ('C0064',45,'국어',91),('C0064',45,'영어',82),('C0064',45,'수학',80);
INSERT INTO exams VALUES ('C0065',45,'국어',96),('C0065',45,'영어',87),('C0065',45,'수학',82);
INSERT INTO exams VALUES ('C0066',45,'국어',83),('C0066',45,'영어',95),('C0066',45,'수학',99);
INSERT INTO exams VALUES ('C0067',45,'국어',100),('C0067',45,'영어',51),('C0067',45,'수학',53);
INSERT INTO exams VALUES ('C0068',45,'국어',74),('C0068',45,'영어',54),('C0068',45,'수학',67);
INSERT INTO exams VALUES ('C0069',45,'국어',91),('C0069',45,'영어',80),('C0069',45,'수학',79);
INSERT INTO exams VALUES ('C0070',45,'국어',73),('C0070',45,'영어',60),('C0070',45,'수학',72);
INSERT INTO exams VALUES ('C0071',45,'국어',54),('C0071',45,'영어',87),('C0071',45,'수학',90);
INSERT INTO exams VALUES ('C0072',45,'국어',60),('C0072',45,'영어',60),('C0072',45,'수학',70);
INSERT INTO exams VALUES ('C0073',45,'국어',65),('C0073',45,'영어',51),('C0073',45,'수학',70);
INSERT INTO exams VALUES ('C0074',45,'국어',91),('C0074',45,'영어',99),('C0074',45,'수학',91);
INSERT INTO exams VALUES ('C0075',45,'국어',82),('C0075',45,'영어',90),('C0075',45,'수학',90);
INSERT INTO exams VALUES ('C0076',45,'국어',63),('C0076',45,'영어',59),('C0076',45,'수학',63);
INSERT INTO exams VALUES ('C0077',45,'국어',66),('C0077',45,'영어',58),('C0077',45,'수학',67);
INSERT INTO exams VALUES ('C0078',45,'국어',71),('C0078',45,'영어',72),('C0078',45,'수학',68);
INSERT INTO exams VALUES ('C0079',45,'국어',70),('C0079',45,'영어',82),('C0079',45,'수학',78);
INSERT INTO exams VALUES ('C0010',45,'국어',77),('C0010',45,'영어',88),('C0010',45,'수학',89);
INSERT INTO exams VALUES ('C0081',45,'국어',97),('C0081',45,'영어',99),('C0081',45,'수학',83);
INSERT INTO exams VALUES ('C0082',45,'국어',87),('C0082',45,'영어',81),('C0082',45,'수학',83);
INSERT INTO exams VALUES ('C0083',45,'국어',90),('C0083',45,'영어',75),('C0083',45,'수학',71);
INSERT INTO exams VALUES ('C0084',45,'국어',60),('C0084',45,'영어',50),('C0084',45,'수학',66);
INSERT INTO exams VALUES ('C0085',45,'국어',73),('C0085',45,'영어',90),('C0085',45,'수학',91);
INSERT INTO exams VALUES ('C0086',45,'국어',64),('C0086',45,'영어',63),('C0086',45,'수학',63);
INSERT INTO exams VALUES ('C0087',45,'국어',95),('C0087',45,'영어',84),('C0087',45,'수학',98);
INSERT INTO exams VALUES ('C0088',45,'국어',86),('C0088',45,'영어',77),('C0088',45,'수학',92);
INSERT INTO exams VALUES ('C0089',45,'국어',85),('C0089',45,'영어',85),('C0089',45,'수학',83);
INSERT INTO exams VALUES ('C0010',45,'국어',59),('C0010',45,'영어',62),('C0010',45,'수학',57);
INSERT INTO exams VALUES ('C0091',45,'국어',76),('C0091',45,'영어',85),('C0091',45,'수학',90);
INSERT INTO exams VALUES ('C0092',45,'국어',87),('C0092',45,'영어',88),('C0092',45,'수학',85);
INSERT INTO exams VALUES ('C0093',45,'국어',90),('C0093',45,'영어',99),('C0093',45,'수학',85);
INSERT INTO exams VALUES ('C0094',45,'국어',96),('C0094',45,'영어',99),('C0094',45,'수학',99);
INSERT INTO exams VALUES ('C0095',45,'국어',92),('C0095',45,'영어',100),('C0095',45,'수학',96);
INSERT INTO exams VALUES ('C0096',45,'국어',95),('C0096',45,'영어',75),('C0096',45,'수학',86);
INSERT INTO exams VALUES ('C0097',45,'국어',86),('C0097',45,'영어',79),('C0097',45,'수학',76);
INSERT INTO exams VALUES ('C0098',45,'국어',70),('C0098',45,'영어',70),('C0098',45,'수학',88);
INSERT INTO exams VALUES ('C0099',45,'국어',72),('C0099',45,'영어',74),('C0099',45,'수학',84);
INSERT INTO exams VALUES ('C0100',45,'국어',65),('C0100',45,'영어',70),('C0100',45,'수학',53);
INSERT INTO exams VALUES ('C0101',45,'국어',84),('C0101',45,'영어',89),('C0101',45,'수학',77);
INSERT INTO exams VALUES ('C0102',45,'국어',87),('C0102',45,'영어',85),('C0102',45,'수학',82);
INSERT INTO exams VALUES ('C0103',45,'국어',72),('C0103',45,'영어',57),('C0103',45,'수학',69);
INSERT INTO exams VALUES ('C0104',45,'국어',91),('C0104',45,'영어',88),('C0104',45,'수학',79);
INSERT INTO exams VALUES ('C0105',45,'국어',99),('C0105',45,'영어',73),('C0105',45,'수학',95);
INSERT INTO exams VALUES ('C0106',45,'국어',96),('C0106',45,'영어',83),('C0106',45,'수학',100);
INSERT INTO exams VALUES ('C0107',45,'국어',89),('C0107',45,'영어',84),('C0107',45,'수학',92);
INSERT INTO exams VALUES ('C0108',45,'국어',50),('C0108',45,'영어',59),('C0108',45,'수학',70);
INSERT INTO exams VALUES ('C0110',45,'국어',52),('C0110',45,'영어',56),('C0110',45,'수학',70);
INSERT INTO exams VALUES ('C0111',45,'국어',59),('C0111',45,'영어',69),('C0111',45,'수학',70);
INSERT INTO exams VALUES ('C0112',45,'국어',54),('C0112',45,'영어',73),('C0112',45,'수학',56);
INSERT INTO exams VALUES ('C0113',45,'국어',52),('C0113',45,'영어',71),('C0113',45,'수학',58);
INSERT INTO exams VALUES ('C0114',45,'국어',66),('C0114',45,'영어',70),('C0114',45,'수학',65);
INSERT INTO exams VALUES ('C0115',45,'국어',81),('C0115',45,'영어',71),('C0115',45,'수학',77);
INSERT INTO exams VALUES ('C0116',45,'국어',68),('C0116',45,'영어',56),('C0116',45,'수학',57);
INSERT INTO exams VALUES ('C0117',45,'국어',92),('C0117',45,'영어',90),('C0117',45,'수학',82);
INSERT INTO exams VALUES ('C0118',45,'국어',92),('C0118',45,'영어',84),('C0118',45,'수학',99);
INSERT INTO exams VALUES ('C0119',45,'국어',82),('C0119',45,'영어',97),('C0119',45,'수학',95);
INSERT INTO exams VALUES ('C0120',45,'국어',64),('C0120',45,'영어',71),('C0120',45,'수학',70);

-- 뷰 권한 샘플 
DROP VIEW IF EXISTS view2, view1;

/*
# 상품-공급처-창고 테이블 
    제4정규형, 제5정규형, 도메인 정규형 샘플 
    (3장 샘플에서 사용하는 테이블명과 중복되어 변경)
*/
DROP TABLE IF EXISTS 상품공급업체창고테이블_dk;
DROP TABLE IF EXISTS 상품공급업체테이블_dk;
DROP TABLE IF EXISTS 상품공급업체창고테이블;
DROP TABLE IF EXISTS 상품공급업체테이블;
DROP TABLE IF EXISTS 상품창고테이블;
DROP TABLE IF EXISTS 공급업체창고테이블;
DROP TABLE IF EXISTS 상품테이블;
DROP TABLE IF EXISTS 공급업체테이블;
DROP TABLE IF EXISTS 창고테이블;

-- 마스터테이블 (상품, 창고, 공급업체)
CREATE TABLE 상품테이블 (
    상품 CHAR(3) NOT NULL PRIMARY KEY,
    상품명 VARCHAR(255) NOT NULL
);

INSERT INTO 상품테이블 VALUES
('001','상품001'),
('002','상품002'),
('003','상품003'),
('004','상품004');

CREATE TABLE 공급업체테이블 (
    공급업체 CHAR(3) NOT NULL PRIMARY KEY,
    공급업체명 VARCHAR(255) NOT NULL
);

INSERT INTO 공급업체테이블 VALUES
('S01','공급사01'),
('S02','공급사02'),
('S03','공급사03'),
('S04','공급사04');

CREATE TABLE 창고테이블 (
    창고 CHAR(2) NOT NULL PRIMARY KEY
);

INSERT INTO 창고테이블 VALUES
('X1'),
('X2'),
('Y1'),
('Y2'),
('Z1'),
('Z2');


-- 품과 공급업체, 창고 (원래 테이블)
CREATE TABLE 상품공급업체창고테이블 (
    상품 CHAR(3) NOT NULL,
    공급업체 CHAR(3) NOT NULL,
    창고 CHAR(2) NOT NULL,
    PRIMARY KEY(상품, 공급업체, 창고),
    FOREIGN KEY(상품) REFERENCES 상품테이블 (상품),
    FOREIGN KEY(공급업체) REFERENCES 공급업체테이블 (공급업체),
    FOREIGN KEY(창고) REFERENCES 창고테이블 (창고)
);

INSERT INTO 상품공급업체창고테이블 VALUES
('001', 'S01', 'X1'),
('001', 'S01', 'Y1'),
('001', 'S01', 'Z1'),
('001', 'S01', 'X2'),
('001', 'S02', 'X1'),
('001', 'S02', 'Y1'),
('002', 'S01', 'Z1'),
('002', 'S01', 'X2'),
('003', 'S03', 'X1'),
('003', 'S02', 'X1');

-- 상품 및 공급업체 (제4정규형)
CREATE TABLE 상품공급업체테이블 (
    상품 CHAR(3) NOT NULL,
    공급업체 CHAR(3) NOT NULL,
    PRIMARY KEY(상품, 공급업체),
    FOREIGN KEY(상품) REFERENCES 상품테이블 (상품),
    FOREIGN KEY(공급업체) REFERENCES 공급업체테이블 (공급업체)
);

-- 원본 데이터에서 제품과 공급업체의 조합을 생성하고 등록
INSERT INTO 상품공급업체테이블 
SELECT DISTINCT 상품, 공급업체 FROM 상품공급업체테이블;

-- 상품과 창고(제4정규형)
CREATE TABLE 상품창고테이블 (
    상품 CHAR(3) NOT NULL,
    창고 CHAR(2) NOT NULL,
    PRIMARY KEY(상품, 창고),
    FOREIGN KEY(상품) REFERENCES 상품테이블 (상품),
    FOREIGN KEY(창고) REFERENCES 창고테이블 (창고)
);


-- 원본 데이터에서 공급업체와 창고의 조합을 생성하고 등록함
INSERT INTO 공급업체창고테이블 
SELECT DISTINCT 공급업체, 창고 FROM 상품공급업체창고테이블;

-- 상품공급업체테이블 (도메인키 정규형)
CREATE TABLE 상품공급업체테이블_dk (
    상품 CHAR(3) NOT NULL,
    공급업체 CHAR(3) NOT NULL,
    FOREIGN KEY(상품) REFERENCES 상품테이블 (상품),
    FOREIGN KEY(공급업체) REFERENCES 공급업체테이블 (공급업체),
    PRIMARY KEY(상품, 공급업체)
);

-- 원본데이터에서 상품과 공급업체의 조합을 생성하고 등록 
INSERT INTO 상품공급업체테이블_dk
SELECT DISTINCT 상품, 공급업체 FROM 상품공급업체창고테이블;

-- 상품공급업체창고테이블 (도메인 키 정규형, 외래키 추가)
CREATE TABLE 상품공급업체창고테이블_dk (
    상품 CHAR(3) NOT NULL,
    공급업체 CHAR(3) NOT NULL,
    창고 CHAR(2) NOT NULL,
    PRIMARY KEY(상품, 공급업체, 창고),
    FOREIGN KEY(상품) REFERENCES 상품테이블 (상품),
    FOREIGN KEY(공급업체) REFERENCES 공급업체테이블 (공급업체),
    FOREIGN KEY(창고) REFERENCES 창고테이블 (창고),
    FOREIGN KEY(상품, 공급업체) REFERENCES 상품공급업체테이블_dk(상품, 공급업체)
);

-- 원본데이터 등록
-- (상품공급업쳍테이블에 없는 조합은 등록할 수 없음)
INSERT INTO 상품공급업체창고테이블_dk
SELECT * FROM 상품공급업체창고테이블;

/*
# 외부결합용 샘플（c1, c2, c3）
*/
DROP TABLE IF EXISTS c1, c2;

CREATE TABLE c1(
    code INTEGER PRIMARY KEY,
    color VARCHAR(255)
);
INSERT INTO c1 VALUES(1, '빨강'),(2, '흰색'),(3, '파랑');

CREATE TABLE c2(
    code INTEGER PRIMARY KEY,
    size CHAR
);
INSERT INTO c2 VALUES(2, 'S'),(4, 'L');

/*
# 자기결합샘플 (members테이블)
*/
/
DROP TABLE IF EXISTS members;
CREATE TABLE members (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manager_id CHAR(3)
);

-- (보충)자기 테이블에 대한 참조의 경우 CREATE TABLE에서는 설정할 수 없기 때문에 
-- ALTER TABLE 사용
-- ※ 설정하지 않아도 자기 결합 테스트 가능함 
ALTER TABLE members
ADD FOREIGN KEY (manager_id) REFERENCES members (id);

INSERT INTO members VALUES
('001', '이순신',  NULL),
('002', '안창호', '001'),
('003', '노무현', '002'),
('004', '김대중', '002'),
('005', '문재인', '004');


/*
# 3개의 테이블로 JOIN 샘플 
*/

DROP TABLE IF EXISTS t2room;
DROP TABLE IF EXISTS t2teacher;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS t3;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(
    code CHAR(2) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO t1 VALUES ('P1', '홍길동'),('P2', '이순신'),('P3', '안창호');
-- 외부결합용 
INSERT INTO t1 VALUES ('P4','김구');


CREATE TABLE t2(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t2 VALUES ('P1', '역사'),('P1', '철학'),('P2', '물리학'),('P3', '지질학');
-- 외부조합
INSERT INTO t2 VALUES('P4','지질학');


CREATE TABLE t3(
    code CHAR(2) NOT NULL,
    club VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, club),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t3 VALUES ('P1', '음악'),('P2', '영화'),('P3', '음악'),('P3', '영화');

-- 2열에 의한 JOIN샘플
CREATE TABLE t2room (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    room VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2room(code,subject,room) VALUES
('P1','철학','T1'),
('P1','역사','R1'),
('P2','물리학','B1'),
('P3','지질학','C1'),
('P4','지질학','C2');

CREATE TABLE t2teacher (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    teacher VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2teacher(code,subject,teacher) VALUES
('P1','철학','이순신'),
('P1','역사','김구'),
('P2','물리학','안창호'),
('P3','지질학','김대중'),
('P4','지질학','노무현');

/*
# NULLIF、COALESCE 샘플 (members_car테이블, members_tel테이블)
※ 실행샘플이기 때문에 기억하기 쉽도록 각 테이블에 name을 넣고 있지만 여러 테이블에 name을 넣는 것은 업데이트 불일치의 근원이 됨
*/

DROP TABLE IF EXISTS members_car;
CREATE TABLE members_car (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mycar VARCHAR(255)
);

INSERT INTO members_car VALUES
('001', '이순신', '14-5'),
('002', '안창호', NULL),
('003', '노무현', '32-1'),
('004', '김대중', ''),
('005', '문재인', '26-8');

DROP TABLE IF EXISTS members_tel;
CREATE TABLE members_tel (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile VARCHAR(255),
    home VARCHAR(255)
);

INSERT INTO members_tel VALUES
('001', '이순신', NULL, '023352104X'),
('002', '안창호', '0105075953X', '027740269X'),
('003', '노무현', '0101664195X', NULL),
('004', '김대중', '0101993529X', NULL),
('005', '문재인', NULL, NULL);

/*
# 집계합수 테스트 
*/
DROP TABLE IF EXISTS groupby_test;
CREATE TABLE groupby_test (
    name CHAR(1) PRIMARY KEY,
    price INTEGER
);
INSERT INTO groupby_test VALUES
('A', 100),
('B', 20),
('C', 0),
('D', NULL);

/*
# UNION용 샘플（staff, mentor）
*/

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
    staff_id CHAR(5) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    course_subject VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
    -- subject_master테이블의 경우 사례연구 참조 (examdb2）
    -- ,FOREIGN KEY (course_subject) REFERENCES examdb2.subject_master(course_subject)
);

INSERT INTO staff VALUES
('S0101','이순신','국어','0108169251X','lee_ss@example.com'),
('S0102','이산','영어','0107564800X','lee_s@example.com'),
('S0103','홍길동','영어','0103303011X','hong_gd@example.com'),
('S0104','노무현','수학','0102454730X','noh_mh@example.com'),
('S0105','김대중','수학','0107589347X','kim_dj@example.com');

DROP TABLE IF EXISTS mentor;
CREATE TABLE mentor(
    -- mentor_id CHAR(3) PRIMARY KEY, -- 테스트를 위해 staff_id와 다른 데이터형 사용 
    mentor_no INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL
    -- , FOREIGN KEY (branch) REFERENCES examdb2.branch_master(branch)
);

INSERT INTO mentor VALUES
(2,'홍길동','종로구','0103421888X'),
(4,'이순신','서초구','0102859870X'),
(5,'노무현','종로구','0109186795X'),
(8,'김대중','서초구','0104033145X'),
(12,'문재인','강남구','0103531248X'),
(16,'한강','강남구','0102543023X'),
(17,'권지용','송파구','0107904467X'),
(18,'김재우','송파구','0102314970X');

/*
# CASE식용 샘플（members_tsukin、members_color）
*/

-- members_tsukin
DROP TABLE IF EXISTS members_gubun;
CREATE TABLE members_tsukin (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gubun INTEGER NOT NULL
);

INSERT INTO members_gubun VALUES
('001','홍길동','2'),
('002','이순신','1'),
('003','노무현','2'),
('004','한강','0'),
('005','권지용','2');

-- members_color
DROP TABLE IF EXISTS members_color;
CREATE TABLE members_color (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    c1 VARCHAR(255),
    c2 VARCHAR(255),
    c3 VARCHAR(255)
);

INSERT INTO members_color VALUES
('001','홍길동','yellow',NULL,'red'),
('002','이순신',NULL,'yellow','green'),
('003','노무현','red','blue',NULL),
('004','한강',NULL,'green','red'),
('005','권지용','blue',NULL,'yellow');


/*
# 하위쿼리용（mungu, sales_header, sales）
*/
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS sales_header;
DROP TABLE IF EXISTS mungu;
CREATE TABLE mungu(
    mungu_code CHAR(3) PRIMARY KEY,
    mungu_name VARCHAR(255) NOT NULL,
    std_price INTEGER -- NOT NULL -- NULL데이터가 포함된 케이스 테스트용 (6.8)
);

INSERT INTO mungu VALUES
('S01','notebook A',120),
('S02','notebook B',250),
('S03','marker yellow',100),
('S04','marker red',280),
('S05','marker green',300);

CREATE TABLE sales_header(
    order_code CHAR(6) PRIMARY KEY,
    guest_code CHAR(3) NOT NULL
);

INSERT INTO sales_header VALUES
('XX0011', 'T01'),
('XX0012', 'T02'),
('XX0013', 'T03'),
('XX0014', 'T01'),
('XX0015', 'T02');

CREATE TABLE sales(
    order_code CHAR(6) NOT NULL,
    mungu_code CHAR(3) NOT NULL,
    act_price INTEGER NOT NULL, -- 실판매가
    qty INTEGER NOT NULL, -- 판매수량 
    PRIMARY KEY (order_code, mungu_code),
    FOREIGN KEY (order_code) REFERENCES sales_header(order_code),
    FOREIGN KEY (mungu_code) REFERENCES mungu(mungu_code)
);

INSERT INTO mungu VALUES
('XX0011','S01',120,10),
('XX0011','S02',225,5),
('XX0012','S01',96,150),
('XX0012','S02',200,150),
('XX0012','S03',80,100),
('XX0013','S02',225,10),
('XX0013','S04',252,10),
('XX0014','S01',96,100),
('XX0014','S04',224,100),
('XX0015','S03',100,25),
('XX0015','S04',252,25),
('XX0015','S05',270,50);

/*
# 직적샘플（학생마스터와 전공과목）
*/
DROP TABLE IF EXISTS 전공과목;
DROP TABLE IF EXISTS 학생마스터;

CREATE TABLE 학생마스터(
    code CHAR(2) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE 전공과목(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL
);

INSERT INTO 학생마스터 VALUES
('P1', '이순신'),
('P1', '홍길동');

INSERT INTO 전공과목 VALUES
('P1', '역사'),
('P1', '철학'),
('P2', '물리학');

/*
# 투영샘플
*/
DROP TABLE IF EXISTS 구매문서;
CREATE TABLE 구매문서 (
    문서번호 CHAR(6) NOT NULL,
    상품코드 CHAR(3) NOT NULL,
    단가 INTEGER NOT NULL,
    개수 INTEGER NOT NULL
);

INSERT INTO 구매문서 VALUES
('XX0011','001',120,10),
('XX0011','002',225,5),
('XX0012','001',96,150),
('XX0012','002',200,150),
('XX0012','003',80,100),
('XX0013','002',225,10),
('XX0013','004',252,10),
('XX0014','001',96,100),
('XX0014','004',224,100),
('XX0015','003',100,25),
('XX0015','004',252,25);

/*
# 관계나눗셈샘플 (구색리스트)
*/

DROP TABLE IF EXISTS 구색리스트;
CREATE TABLE 구색라스트(
    상점명 VARCHAR(255),
    상품 VARCHAR(255)
);
INSERT INTO 구색리스트 VALUES
('A매장','야채'),
('Y매장','옷'),
('Y매장','구두'),
('Y매장','가공식품'),
('Y매장','약'),
('S매장','야채'),
('S매장','생선'),
('S매장','가공식품'),
('P매장','옷'),
('P매장','그림도구'),
('P매장','야채'),
('P매장','약'),
('P매장','가공식품');

DROP TABLE IF EXISTS ;
CREATE TABLE 위시리스트(
    상품 VARCHAR(255)
);
INSERT INTO 위시리스트 VALUES
('야채'),
('가공식품');

/*
# 연간월간변환（UNION、INSERT、CASE）
*/

DROP TABLE IF EXISTS phase_results;
CREATE TABLE phase_results(
    phase INTEGER PRIMARY KEY,
    r01 INTEGER,
    r02 INTEGER,
    r03 INTEGER,
    r04 INTEGER,
    r05 INTEGER,
    r06 INTEGER,
    r07 INTEGER,
    r08 INTEGER,
    r09 INTEGER,
    r10 INTEGER,
    r11 INTEGER,
    r12 INTEGER
);

INSERT INTO phase_results VALUES
(1,15,14,20,30,28,41,28,49,18,59,37,30),
(2,30,14,20,23,20,50,13,35,9,60,55,22),
(3,40,23,35,35,40,48,17,56,41,36,24,30),
(4,55,40,61,50,60,57,45,NULL,NULL,NULL,NULL,NULL);

DROP TABLE IF EXISTS month_results;
CREATE TABLE month_results(
    phase INTEGER NOT NULL CHECK (phase>0),
    month INTEGER NOT NULL CHECK (month BETWEEN 1 AND 12),
    results INTEGER NOT NULL,
    PRIMARY KEY(phase, month)
);
INSERT INTO month_results(phase, month, results)
SELECT phase,  1, r01 FROM phase_results WHERE r01 IS NOT NULL
UNION ALL
SELECT phase,  2, r02 FROM phase_results WHERE r02 IS NOT NULL
UNION ALL
SELECT phase,  3, r03 FROM phase_results WHERE r03 IS NOT NULL
UNION ALL
SELECT phase,  4, r04 FROM phase_results WHERE r04 IS NOT NULL
UNION ALL
SELECT phase,  5, r05 FROM phase_results WHERE r05 IS NOT NULL
UNION ALL
SELECT phase,  6, r06 FROM phase_results WHERE r06 IS NOT NULL
UNION ALL
SELECT phase,  7, r07 FROM phase_results WHERE r07 IS NOT NULL
UNION ALL
SELECT phase,  8, r08 FROM phase_results WHERE r08 IS NOT NULL
UNION ALL
SELECT phase,  9, r09 FROM phase_results WHERE r09 IS NOT NULL
UNION ALL
SELECT phase, 10, r10 FROM phase_results WHERE r10 IS NOT NULL
UNION ALL
SELECT phase, 11, r11 FROM phase_results WHERE r11 IS NOT NULL
UNION ALL
SELECT phase, 12, r12 FROM phase_results WHERE r12 IS NOT NULL
;


