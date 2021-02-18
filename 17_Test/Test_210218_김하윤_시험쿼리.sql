/* 1번 */
--회원정보 불러오기
select Email, Mobile, Names, Addr, Levels, userID, passwords, lastLoginDT, loginIpAddr
 from membertbl
 order by levels , Names;
  
 -- 책 정보, 시스템 함수, 포맷 함수 쿼리
 SELECT idx
     , concat(N'', Names) as Names
     , author
     , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
     , format(price, '#,#원') as 가격
  FROM bookstbl;
-----------------------------------------------------------------------------------------------------------------
/* 2번 */
  -- 시스템 함수사용 쿼리
 select names,
       concat(right(Names, 2), ', ', left(Names, 1)) as '미국식이름', 
	   levels,
	   mobile, 
	   addr,
	   upper(email) as '이메일'
  from memberTBL
 order by names; /*이름순으로*/
 
 --책 정보
 select idx
 ,names
 ,author
 ,releasedate
 ,isbn
 ,price
 from bookstbl
 order by idx desc; /*책 이름 역순*/
 -----------------------------------------------------------------------------------------------------------------
 /* 3번 */
 -- 책정보 조인
 select idx 
 ,c.division /* 장르 번호 */
 ,c.names /* 장르 이름 */
 ,b.names
 ,b.author
   from dbo.bookstbl as b
 inner join divtbl as c
    on b.division = c.division;


-- 책을 안빌린 회원 조회
select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate 
  from membertbl m
  left outer join rentaltbl r
    on m.Idx = r.memberIdx where r.rentalDate is null
 -----------------------------------------------------------------------------------------------------------------
 /* 4번 */
 --책 장르 추가
begin tran
insert into divtbl 
values ('I0002', '자기개발서')									   
select *from divtbl
rollback
commit

--회원 정보 변경
begin tran	
	update membertbl
	   set addr='부산시 해운대구'
	     , mobile='010-6683-7732'
     where names = '성명건'
select * from membertbl
rollback
commit
-----------------------------------------------------------------------------------------------------------------
 /* 5번 */
--합계
select d.names
     , sum(b.price) 총합계금액
  from divtbl d
 right outer join bookstbl b
    on d.division = b.division 
 group by rollup(d.names) 


