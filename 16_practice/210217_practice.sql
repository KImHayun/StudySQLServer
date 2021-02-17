-- 실제 회원정보 불러오기 레벨 역순 + 이름순
select memberID, memberName, levels, mobile, email
  from memberTBL
 where levels <> 's'
 order by levels , memberName asc


 -- 책정보
 select cateidx, bookName, author, interpreter, company, price
   from booksTBL
  order by price desc

select * from cateTBL

-- 시스템 함수 사용 쿼리
select memberID, 
      concat(right(memberName, 2),',', left(memberName, 1)) 미국식이름,
      case levels
         when 'A' then '골드'
         when 'B' then '실버'
         when 'C' then '브론즈'
         when 'D' then '아이언'
         when 'S' then '관리자'
         else '비회원'
      end 회원레벨,
      mobile,
      upper(email) 이메일
  from memberTBL  
 where levels <> 's'
 order by levels, memberName

 
 
 --사용자 정의 함수사용 쿼리
 select memberID, 
      concat(right(memberName, 2),',', left(memberName, 1)) as 미국식이름,
      dbo.ufn_getlevel(levels) as '회원레벨',
	  mobile,
	  upper(email) as '이메일'
  from memberTBL
 where levels <> 's'
 order by levels, memberName;

 --책 정보, 시스템 함수, 포맷 함수 쿼리
 SELECT bookidx
      ,cateidx
      ,concat (N'책 제목>', bookName) as bookname
      ,author
      ,isnull(interpreter,'(역자없음)')as '번역가'
      ,company
      ,format(releasedate,'yyyy년 MM월 dd일')as '출판일'
      ,ISBN
      ,format (price,'#,#원')as 가격
      ,discriptions
      ,regDate
  FROM booksTBL
   
 --책정보 조인
SELECT 
  b.bookidx
 ,b.cateidx
 ,b.author
 ,b.interpreter
 ,b.company
FROM dbo.booksTBL as b
  inner join cateTBL as c
  on b.cateidx = c. cateidx;

 --대여된 책의 정보 쿼리 조인
  SELECT r.rentalidx
        ,m.memberName
     -- ,r.memberidx
     -- ,r.bookidx
      ,r.rentalDT
      ,r.returnDT
      ,r.rentalState
	  ,format(r.rentalDt, 'yyyy-MM-dd') as'대여일'
	  ,format(r.rentalDt, 'yyyy-MM-dd') as'반납일'
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
  inner join booksTBL as b
  on r.bookidx = b.bookidx
  inner join memberTBL as m
   on r.memberidx =m.memberidx;



 --책을 안 빌린 회원 조회
    SELECT r.rentalidx
        ,m.memberName
     -- ,r.memberidx
     -- ,r.bookidx
     ,b.bookname
	 ,b.author
	  ,format(r.rentalDt, 'yyyy-MM-dd') as'대여일'
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
 left outer join booksTBL as b
  on r.bookidx = b.bookidx
 left outer join memberTBL as m
   on r.memberidx =m.memberidx
   where r.rentalidx is null;

--책 대여점에 없는 소설 장르
select c.cateidx
, c.cateName
from cateTBL as c
left outer join booksTBL as b
 on c.cateidx = b.cateidx
