---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
SELECT * FROM sites;

-- Get all sites sorted by name
SELECT * FROM sites order by name;

-- Gett all activity names sorted by name
SELECT name FROM activities order by name;

-- Get all "Sport" activities
SELECT name FROM activities where category = "Sport" order by name;
-- Expected result: 8 rows

-- Get all Escape Games in Nantes
SELECT name FROM activities where name like "%Escape Game%" AND city = "Nantes" order by name;
-- Expected result: 3 rows

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
SELECT count(*) from activities;
-- Expected result: 44

-- Count all "Adventure" activities
SELECT count(*) from activities where category = "Adventure";
-- Expected result: 13

-- Count the number of activities per category
SELECT category, count(*) as total from activities group by category order by category;
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Cultural    6
-- Food        6
-- Sport       8
-- Visits      5
-- Workshops   6

-- Get the 3 category names with the biggest number of activities
SELECT category, count(*) as total from activities group by category order by total desc limit 3;
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Sport       8
-- Cultural    6

---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working FROM site "Ile de Nantes", sorted by first name
SELECT first_name, last_name from employees inner join sites on employees.site_id = sites.id where sites.name = "Ile de Nantes" order by employees.first_name;
-- Expected result: 53 rows

-- Get all the activity names where you have been to, sorted by name
SELECT activities.name from activities
inner join team_building_sessions on activities.id = team_building_sessions.activity_id
inner join participations on team_building_sessions.id = participations.team_building_session_id
inner join employees on participations.employee_id = employees.id
where employees.last_name = "Goguillot";
-- Expected result: well, it depends on who you are :)

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
SELECT distinct teams.name from teams
inner join team_building_sessions on team_building_sessions.team_id = teams.id
inner join activities on activities.id = team_building_sessions.activity_id
where activities.category = "Adventure"
order by teams.name;
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

-- Get the team names and total number of team building sessions done, sorted by top teams
SELECT ...
-- Expected result:
-- name        total_sessions
-- ----------  --------------
-- R&D         7
-- Marketing   4
-- Business D  3
-- Product Ow  3
-- Finance &   2
-- UI / UX     2
-- Customer S  1

-- Get all the employee names, team names and site names that have never attended a team building session
-- TODO: SELECT ...
-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to leASt expensive
-- TODO: SELECT ...
-- Expected result:
-- name          total_price
-- ------------  -----------
-- Finance & RH  1620
-- Business Dev  1446
-- R&D           1140
-- Marketing     445
-- Customer Suc  360
-- Product Owne  267
-- UI / UX       240

-- Get the site names and total number of team building sessions done, sorted by top sites
-- TODO: SELECT ...
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Ile de Nantes  12
-- Paris 13ème    10
