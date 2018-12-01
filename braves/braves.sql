
# query 1
SELECT name, WAR FROM WAR 
	WHERE year >= 2002 AND 
	year <= 2003 AND 
	WAR >= 5 and 
	WAR <= 6 
	ORDER BY WAR DESC;

-- results:

-- Posada, Jorge|6
-- Hidalgo, Richard|6
-- Berkman, Lance|6
-- Jones, Chipper|5.9
-- Ramirez, Manny|5.8
-- Garciaparra, Nomar|5.8
-- Chavez, Eric|5.7
-- Suzuki, Ichiro|5.7
-- Abreu, Bobby|5.6
-- Soriano, Alfonso|5.6
-- Cameron, Mike|5.5
-- Helton, Todd|5.5
-- Walker, Larry|5.4
-- Beltran, Carlos|5.4
-- Pujols, Albert|5.4
-- Delgado, Carlos|5.3
-- Alfonzo, Edgardo|5.3
-- Cameron, Mike|5.3
-- Ramirez, Manny|5.3
-- Abreu, Bobby|5.2
-- Jeter, Derek|5.2
-- Jones, Andruw|5.2
-- Gonzalez, Luis|5.2
-- Anderson, Garret|5.1
-- Sosa, Sammy|5.1
-- Soriano, Alfonso|5.1
-- Koskie, Corey|5.1
-- Mora, Melvin|5
-- Nixon, Trot|5
-- Kearns, Austin|5
-- Giambi, Jason|5
-- Jones, Jacque|5

# query 2
SELECT name, CASE WHEN WAR >= 1 THEN 1 else 0 END AS Indicator,
	CASE WHEN WAR >= 2 THEN 1 else 0 END AS Indicator,
	CASE WHEN WAR >= 3 THEN 1 else 0 END AS Indicator,
	WAR FROM PERF WHERE year == 2018 AND 
	level == "mlb" AND
	Org == "ATL";

-- results:

-- Moylan, Peter|0|0|0|-0.4
-- Sanchez, Anibal|1|1|0|2.4
-- Socolovich, Miguel|0|0|0|0.1
-- Venters, Jonny|0|0|0|0.3
-- Ravin, Josh|0|0|0|-0.1
-- Culberson, Charlie|0|0|0|0
-- Vizcaino, Arodys|0|0|0|0.3
-- Teheran, Julio|0|0|0|0.7
-- Ramirez, Jose|0|0|0|-0.1
-- Biddle, Jesse|0|0|0|0.2
-- Foltynewicz, Mike|1|1|1|3.9
-- Sims, Lucas|0|0|0|-0.2
-- Jackson, Luke|0|0|0|0.3
-- Wisler, Matt|0|0|0|0
-- Fried, Max|0|0|0|0.4
-- Toussaint, Touki|0|0|0|0.4
-- Gohara, Luiz|0|0|0|0
-- Wright, Kyle|0|0|0|-0.2
-- Allard, Kolby|0|0|0|-0.3
-- Soroka, Mike|0|0|0|0.6
-- Wilson, Bryse|0|0|0|0.1
-- McCarthy, Brandon|0|0|0|0.2
-- Freeman, Sam|0|0|0|0.3
-- Brach, Brad|0|0|0|0.3
-- Brothers, Rex|0|0|0|0
-- Gausman, Kevin|0|0|0|0.9
-- Winkler, Dan|1|0|0|1.2
-- Whitley, Chase|0|0|0|-0.1
-- McCreery, Adam|0|0|0|0
-- Phillips, Evan|0|0|0|-0.2
-- Minter, A.J.|1|0|0|1.4
-- Parsons, Wes|0|0|0|-0.1
-- Newcomb, Sean|1|0|0|1.9
-- Carle, Shane|0|0|0|0.6
-- Sobotka, Chad|0|0|0|0


# query 3
SELECT count(*) FROM PITCHBYPITCH p1, PITCHBYPITCH p2 WHERE p1.PitcherName == "Venters, Jonny" AND
	p2.PitcherName == "Venters, Jonny" AND
	p1.GameDate == p2.GameDate AND
	p1.INNING == p2.INNING AND
	p1.PA_OF_INNING == p2.PA_OF_INNING AND
	p1.IS_SINGLE == 1 AND
	p2.BALLS == 1 AND
	p2.STRIKES == 0;

-- results 

-- 8

# here are the days, innings, and plate appearance of innings:

SELECT p1.GameDate, p1.INNING, p1.PA_OF_INNING FROM PITCHBYPITCH p1, PITCHBYPITCH p2 WHERE p1.PitcherName == "Venters, Jonny" AND
	p2.PitcherName == "Venters, Jonny" AND
	p1.GameDate == p2.GameDate AND
	p1.INNING == p2.INNING AND
	p1.PA_OF_INNING == p2.PA_OF_INNING AND
	p1.IS_SINGLE == 1 AND
	p2.BALLS == 1 AND
	p2.STRIKES == 0;

-- results

-- 6/23/2018|6|4
-- 6/24/2018|12|1
-- 5/18/2018|9|1
-- 8/18/2018|8|3
-- 8/28/2018|8|5
-- 8/28/2018|8|3
-- 9/6/2018|8|4
-- 9/26/2018|7|3






