/*
SQL 종류:
1. DQL(Data Query Language) : 데이터 질의 언어. select 문.
2. DDL(Data Definition Language) : 데이터 정의 언어.
    - create, alter, truncate, drop
    - 테이블, 사용자 계정을 생성, 변경, 삭제하는 SQL 문.
3. DML(Data Manipulation Language): 데이터 조작 언어.
    - insert, update, delete
    - 테이블에 행(row)을 추가, 변경, 삭제하는 SQL문장.
4. TCL(Transaction Control Language): 트랜잭션 관리(제어) 언어.
    -- commit(변경내용을 DB에 영구 저장) , rollback(직전 commit상태로 되돌리기)
    
*/

/* 
*테이블 생성 : 
create table 테이블이름(
    컬럼이름    테이터타입   [제약조건, 기본값]
    ...
);
*/

/*
테이블 이름: students
컬럼 이름/데이터 타입:
    - sid : 학생 아이디. 숫자(number, 4자리 정수)
    - sname : 학생 이름. 문자열(varchar2, 10글자까지 저장 가능한 문자열)
    - birthday : 생일. 날짜(date)
*/

create table students(
    sid number(4),
    sname varchar2(10 char),
    birthday date
);
    
desc students; -- 생성된 테이블의 구조(컬럼, Null 가능 여부, 데이터 타입) 확인.


/*
테이블에 새로운 레코드(row,행)를 추가
insert into 테이블 이름 (컬럼, ...) values(값,...);

테이블의 모든 컬럼에, 테이블 컬럼 순서대로 데이터를 추가하는 경우에는 컬럼 이름들을 생략할 수 있음.
insert into 테이블이름 values(값,...)
*/

insert into students (sid,sname)
values (1001,'김가영');

insert into students
values (1002,'변주환','1970/01/04');

insert into students
values (1002,'변주환'); 
-- > 에러 발생 : 테이블의 컬럼 개수보다 적은 개수의 값을 전달했기 때문에

insert into students values('변주환',1002,'2022/08/09');
-- > 에러 발생 : values 값들의 순서가 제대로 되지 않았기때문

insert into students (sname, sid, birthday)
values ('쿠크다스',1,'2022/08/07');

select * from students;

-- DML(insert, update, delete)에서 변경 내용은 메모리에서만 변경됨.
-- 데이터 변경 내용을 DB에 영구적으로 저장.
commit;

-- DDL(create, alter, truncate, drop)은 문장 실행이 성공하면 자동 commit됨.

-- students 테이블과 똑같은 구조의 테이블 students2를 생성.
-- create-as select 문장: 다른 테이블에서 select한 내용 그대로 새로운 테이블을 생성.
create table students2
as select * from students; -- 테이블 복사.

-- create -as select 문장을 사용해서, 데이터 복사 없이 새 테이블 생성만 하는 경우:
create table students3
as select * from students where sid = -1;

select * from students3;

-- 테이블을 생성할 때, 컬럼의 기본값을 설정하기:
create table tbl_users(
    user_no number(6),
    userid varchar2(20), -- 20 바이트까지 저장할 수 있는 문자열
    password varchar2(20),
    age number(3) default 0, -- 기본값 = 0
    modified_date date default sysdate -- 기본값=현재시간
);

desc tbl_users; 

insert into tbl_users(user_no,userid,password)
values (1, 'admin', '1234');
-- insert에서 값을 삽입하지 앟은 컬럼들 중에서 default가 설정되어 있는 경우에는
-- 그 기본값이 자동으로 삽입됨.

insert into tbl_users (user_no,userid)
values (2,'guest');

commit;

-- 테이블 삭제:
-- truncate table: 테이블의 모든 레코드(행)이 삭제되고, 테이블 이름만 남아 있는 경우.
-- drop table : 테이블 자체가 삭제.
-- DML 중 delete from table : 테이블의 레코드들을 삭제.

select * from tbl_users;

delete from tbl_users where user_no = 1;

truncate table tbl_users;

drop table tbl_users;