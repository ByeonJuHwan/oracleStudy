-- inline comment(한 줄 주석)
/*
 * block comment
 */

-- SQL 문장은 세미콜론(;)으로 끝남.
-- Ctrl + Enter: 커서가 있는 위치의 SQL 한 문장을 실행.
-- F5: 스크립트(확장자가 sql인 파일) 실행.

-- DQL(Data Query Language): select 검색할 내용 from 테이블 이름;
-- dual: 오라클 데이터베이스에서 select 문장의 문법에 맞추기 위해서 만든 가상의 테이블 이름.
select sysdate from dual;

-- 테이블 구조를 확인하기 위한 "오라클" 명령어: describe(desc) 테이블 이름;
-- describe는 SQL 표준 문법의 명령어가 아님.
describe emp;

-- 오라클의 데이터 타입:
-- (1) number: 숫자 타입(정수, 실수)
--     사용 예: number(2) - 2자리 정수, number(7,2) - 소수점 2자리까지 표현가능한 실수.
-- (2) varchar, varchar2: 가변 길이 문자열.
--     사용 예: varchar2(10), varchar2(10 byte) - 최대 10 bytes까지 저장할 수 있는 문자열
--     사용 예: varchar2(10 char) - 최대 10글자까지 저장할 수 있는 문자열.
-- (3) date, timestamp: 날짜와 시간

-- SQL 명령어는 대/소문자를 구분하지 않음.
DESCRIBE dept;
describe DEPT;
Describe dept;

-- 테이블에 저장된 데이터는 대/소문자를 구분.