-- DDL(Data Defination Language): create, truncate, drop, alter
-- create user scott identifiedby tiger;
-- alter user hr account unlock;
-- alter user hr identifiedby hr;
-- drop user scott;

-- alter table 테이블이름 변경 내용;
-- 변경 내용 : (1) 이름 변경(rename), (2) 추가(add), (3) 삭제(drop), (4) 수정(modify)

-- 이름 변경(rename):
-- (1) 테이블 이름 변경 : students 테이블의 이름을 students1으로 변경
alter table students rename to students1;

-- (2) 컬럼 이름 변경: stuents1.sid 컬럼이름을 stu_id로 변경.
alter table students1 rename column sid to stu_id;

-- (3) 제약 조건 변경: ex01 테이블의 SYS_C007001 제약조건 이름을 ex01_col1_pk로 변경.
alter table ex01 rename constraint SYS_C007001 to ex01_col1_pk;

-- 추가(add)
-- (1) 새로운 컬럼 추가 : students1 테이블에 department 컬럼 추가.
alter table students1 add department varchar2(10);

-- (2) 새로운 제약조건 추가 : students1 테이블에 stu_id 컬럼에 PK 제약 조건 추가.
alter table students1 add constraint students1_stu_id_pk primary key (stu_id);

--삭제(drop)
-- (1) 테이블의 컬럼 삭제: students2 테이블의 birthday 컬럼 삭제
alter table students2 drop column birthday;

-- (2) 제약 조건 삭제 : students1 테이블의 students1_stu_id_pk 제약 조건 삭제
alter table students1 drop constraint students1_stu_id_pk;

-- 비교 : 테이블 자체를 삭제 -- > drop table
drop table students3;

-- 수정(modify): 컬럼의 정의(데이터 타입, null 가능 -> not null)를 수정.
-- 제약 조건의 정의를 수정하는 modify 구문은 제공되지 않음!
-- 제약 조건 수정 : drop constraint -> add constraint

-- students1.department 컬럼의 데이터 타입을 varchar2(10 char)로 수정.
alter table students1 modify department varchar2(10 char);
desc students1;





