--����� ���� �Լ��� ��� �� �� ��--
select
*,
(year(getdate())-@birthYear) + 1 as ����

	case
		when (birthYear % 12 = 0) then '������'
		when (birthYear % 12 = 1) then '��'
		when (birthYear % 12 = 2) then '��'
		when (birthYear % 12 = 3) then '����'
		when (birthYear % 12 = 4) then '��'
		when (birthYear % 12 = 5) then '��'
		when (birthYear % 12 = 6) then 'ȣ����'
		when (birthYear % 12 = 7) then '�䳢'
		when (birthYear % 12 = 8) then '��'
		when (birthYear % 12 = 9) then '��'
		when (birthYear % 12 = 10) then '��'
		else '��'

end as '��'

from userTBL;

--����� ���� �Լ� ���

select *,
dbo.ufn_getAge(birthYear) as ����

	from userTBL;
