-- 제약 조건(constraints)
-- 테이블의 데이터들이 insert될 때, 조건을 만족하는 값들만 insert될 수 있도록 만들어 주는 기능.
-- 테이블 생성 (create table) 할 때 제약 조건을 설정.
-- 테이불 변경 (alter table) 할 때 제약 조건을 설정/변경/삭제.
-- 제약 조건 종료 : primary key(고유키), not null, unique, check, foreign key(외래키)

-- 테이블을 생성할 때 제약 조건을 주는 방법 1:
create table ex01(
    col_1 number(2) primary key,
    col_2 varchar(10) not null,
    col_3 varchar(10) unique,
    col_4 number(2) check(col_4>=0),
    col_5 number(2)
);

insert into ex01
values(1,'홍길동','test',10,99);

select * from ex01;

insert into ex01(col_1,col_2)
values (1,'홍길동');
-- > 에러발생 : col_1은 PK이기 때문에 중복되는 값을 insert 할 수 없음!
-- primary key(고유키) = not null (반드시 값이 필요) + unique(중복되지 않는 값)

insert into ex01 (col_2) values ('홍길동');
--> 에러 발생: col_1은 PK이기 때문에 NULL이 될 수 없음!

insert into ex01(col_1)
values(2);
-- 에러 발생: col_2는 NN이기 때문에 NULL이 될 수 없음!

insert into ex01(col_1,col_2,col_3)
values(2,'홍길동','test');
-- > 에러 발생 : col_3은 unique 제약 조건인데, 기존에 입력된 값과 같은 'test'를 insert하려고 했기 때문에.

insert into ex01(col_1,col_2) 
values (2,'홍길동');
--> 성공: PK,NN 만족.

insert into ex01(col_1,col_2,col_4)
values(3,'홍길동',-1);
-- > 에러 발생 : col_4 >= 0 (check 제약조건) 이어야 하는데, -1을 insert하려고 했기 때문에.

insert into ex01(col_1,col_2,col_4)
values(3,'홍길동',0);

commit;

-- 테이블을 생성할때 제약 조건을 설정하는 방법 2: 제약 조건 이름 만들기
create table ex02(
    col_1 number(4) constraint ex02_col1_pk primary key,
    col_2 varchar2(10) constraint ex02_col2_nn not null,
    col_3 varchar2(10) constraint ex02_col3_uq unique,
    col_4 number(2) constraint ex02_col4_ch check(col_4>=0),
    col_5 varchar(1) constraint ex02_col5_ch check(col_5 in ('M','F'))
);

-- 테이블을 생성할 때 제약 조건을 설정하는 방법3 : 컬럼 정의와 제약조건 정의를 따로.
create table ex03(
    -- 컬럼 정의:
    col1 number(4),
    col2 varchar2(10),
    col3 varchar2(10),
    col4 varchar2(1),
    
    -- 제약 조건 정의:
    constraint ex03_col1_pk primary key (col1), --Primary
    constraint ex03_col2_nn check (col2 is not null),
    constraint ex03_col3_uq unique (col3), --unique
    constraint ex03_col4_ch check (col4 in ('M','F'))
);

-- foreign key(외래키) : 다른 케이블의 primary key를 참조하는 제약 조건.
-- 데이터를 삽입(insert)를 할 때 다른 테이블의 PK에 없는 값은 저장되지 않도록 하기 위해서 사용.

-- emp2 테이블의 deptid 컬럼 : FK, dept2 테이블의 deptid: PK
-- dept2를 먼저 생성, 그 다음에 emp2 테이블을 생성.
create table dept2(
    deptid number(2),
    dname varchar2(10),
    
    constraint dept2_deptid_pk primary key (deptid),
    constraint dept2_dname_nn check(dname is not null)
);

create table emp2(
    empid number(4),
    deptid number(2), -- 데이터 타입은 dept2.deptid와 가테 선언.
    
    constraint emp2_empid_pk primary key (empid),
    constraint emp2_empid_fk foreign key (deptid) references dept2 (deptid)
);

create table emp3(
    empid number(4)
        constraint emp3_empid_pk primary key,
    deptid number(2)
        constraint emp3_deptid_fk references dept2(deptid)
);
