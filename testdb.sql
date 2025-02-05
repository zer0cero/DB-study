/*
  2025.1.26 rev.0
  학생 마스터, 선택과목 생성 
  ※학원（examdb）일부 사용
  ※최소한의 참조제약만 설정되고, 학교 및 과목 마스터나 입력제약조건은 사용하지 않음 
*/

DROP TABLE IF EXISTS 선택과목;
DROP TABLE IF EXISTS 학생마스터;

CREATE TABLE 학생마스터 (
    학생번호 CHAR(5) PRIMARY KEY,
    이름 VARCHAR(255),
    캠퍼스 VARCHAR(255)
);

INSERT INTO 학생마스터(학생번호, 이름, 캠퍼스) VALUES
('C0001', '이철순', '강남구'),
('C0002', '김기리', '종로구'),
('C0003', '홍명동', '서초구'),
('C0011', '김재우', '서초구'),
('C0018', '강빛나', '송파구');

CREATE TABLE 선택과목(
    학생번호 CHAR(5),
    과목 VARCHAR(255),
    PRIMARY KEY (학생번호, 과목),
    FOREIGN KEY (학생번호) REFERENCES 학생마스터(학생번호)
);

INSERT INTO 선택과목 VALUES ('C0001','국어'),('C0001','영어'),('C0001','수학');
INSERT INTO 선택과목 VALUES ('C0002','영어'),('C0002','수학');
INSERT INTO 선택과목 VALUES ('C0003','국어'),('C0003','영어'),('C0003','수학');
INSERT INTO 선택과목 VALUES ('C0011','국어'),('C0011','영어'),('C0011','수학');
INSERT INTO 선택과목 VALUES ('C0018','영어');
