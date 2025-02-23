Select *
from USHouseholdIncome;

Select *
from ushouseholdincome_statistics;

Select 
	id
    ,count(id)
from USHouseholdIncome
Group by id
Having count(id) >1
;

Select *
From (
	Select 
		row_id
		, id
		, row_number() Over (Partition by id Order by ID) as row_num
	from USHouseholdIncome) as new_table
Where row_num > 1
;

#removing dupes from income table
DELETE FROM USHouseholdIncome
WHERE row_id in (
	Select row_id
	From (
		Select 
			row_id
			, id
			, row_number() Over (Partition by id Order by ID) as row_num
		from USHouseholdIncome) as new_table
	Where row_num > 1
)
;
#checking for dupes in stats table
Select 
	id
    ,count(id)
from ushouseholdincome_statistics
Group by id
Having count(id) >1
; #none were found

#checking state names
Select Distinct
	State_Name
from USHouseholdIncome
Group by State_Name
;

UPDATE USHouseholdIncome
set State_name = 'Georgia'
where State_name = 'georia'

Select *
From USHouseholdIncome
Where county = 'Autauga County' and city = 'Vinemont'
;
UPDATE USHouseholdIncome
set Place = 'Autaugaville'
Where county = 'Autauga County' and city = 'Vinemont';

Select 
	type
    , count(type)
From USHouseholdIncome
Group by type

;
UPDATE USHouseholdIncome
set type = 'Borough'
Where type = 'Boroughs';


Select
	Aland
    ,Awater
from USHouseholdIncome
Where (AWater = 0 or AWater = '' or AWater is null)
and (Aland = 0 or Aland= '' or Aland is null)
;



