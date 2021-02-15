--사용자 정의 함수를 사용 안 한 것--
select
*
(year (getdate())-@birthYear) + 1 as 나이

from userTBL;

--사용자 정의 함수 사용

select *,
dbo.ufn_getAge(birthYear) as 나이

	from userTBL;
