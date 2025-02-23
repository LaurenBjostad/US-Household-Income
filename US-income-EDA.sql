# US Household Income Exploratory Data Analysis

Select *
From USHouseholdIncome;

Select *
From ushouseholdincome_statistics;

SELECT 
	State_name
    , sum(ALand)
    , sum(AWater)
From USHouseholdIncome
Group by state_name
Order by 2 DESC
Limit 10;

SELECT
	*
    
    From USHouseholdIncome ui
    Left join ushouseholdincome_statistics us
    on ui.id = us.id;
    
    SELECT
	*
    
    From USHouseholdIncome ui
	Inner join ushouseholdincome_statistics us
    on ui.id = us.id
    where mean <>0
    ;
    
    SELECT
		ui.State_name
        , ui.county
        , ui.type
        , ui.primary
        , us.mean
        , us.median
    
    From USHouseholdIncome ui
	Inner join ushouseholdincome_statistics us
    on ui.id = us.id
    where mean <>0
    ;

 SELECT
		ui.State_name
        ,count(ui.type)
        , round(avg(us.mean),1)
        , round(avg(us.median),1)
    
    From USHouseholdIncome ui
	Inner join ushouseholdincome_statistics us
    on ui.id = us.id
    where mean <>0
    Group by state_name
    Order by 2 DESC
    Limit 10
    ;

SELECT
		ui.type
        , count(ui.type)
        , round(avg(us.mean),1)
        , round(avg(us.median),1)
    
    From USHouseholdIncome ui
	Inner join ushouseholdincome_statistics us
    on ui.id = us.id
    where mean <>0
    Group by type
    having count(type) > 100
	order by 3 DESC
    ;
    
SELECT
		ui.State_name
        ,ui.city
        , round(avg(us.mean),1)
        , round(avg(us.median),1)
    
    From USHouseholdIncome ui
	Inner join ushouseholdincome_statistics us
    on ui.id = us.id
    where mean <>0
    Group by state_name, City
	order by round(avg(us.mean),1) DESC
    