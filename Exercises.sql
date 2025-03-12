CREATE DATABASE events_in_countries;
USE events_in_countries;
CREATE TABLE tblCategory (
  CategoryID int NOT NULL PRIMARY KEY,
  CategoryName nvarchar(255) NULL
);

CREATE TABLE tblContinent(
  ContinentID int PRIMARY KEY,
  ContinentName nvarchar(255) NULL
);

CREATE TABLE tblCountry(
  CountryID int  NOT NULL PRIMARY KEY,
  CountryName nvarchar(255) NULL,
  ContinentID int NULL,
    FOREIGN KEY (ContinentID) REFERENCES tblContinent(ContinentID)
);

CREATE TABLE tblEvent(
  EventID int  NOT NULL PRIMARY KEY,
  EventName varchar(8000) NULL,
  EventDetails varchar(8000) NULL,
  EventDate date NULL,
  CountryID int NULL,
  CategoryID int NULL,
    FOREIGN KEY (CountryID) REFERENCES tblCountry(CountryID),
    FOREIGN KEY (CategoryID) REFERENCES tblCategory(CategoryID)
);

-- create one example view
CREATE VIEW vwEvents
AS
SELECT        
  -- country and continent
  cn.ContinentName AS Continent, 
  cy.CountryName AS Country,

  -- events
  ev.EventId,
  ev.EventName, 
  ev.EventDetails, 
  ev.EventDate, 

  -- category
  cat.CategoryName AS Category
FROM            
  tblCountry AS cy
  INNER JOIN tblContinent AS cn ON cy.ContinentID = cn.ContinentID 
  INNER JOIN tblEvent AS ev ON cy.CountryID = ev.CountryID 
  INNER JOIN tblCategory AS cat ON ev.CategoryID = cat.CategoryID;



-- add the categories

INSERT tblCategory (CategoryID, CategoryName) VALUES (1, N'Politics');

INSERT tblCategory (CategoryID, CategoryName) VALUES (2, N'Alien life');

INSERT tblCategory (CategoryID, CategoryName) VALUES (3, N'Exploration');

INSERT tblCategory (CategoryID, CategoryName) VALUES (4, N'Natural world');

INSERT tblCategory (CategoryID, CategoryName) VALUES (5, N'Death and disaster');

INSERT tblCategory (CategoryID, CategoryName) VALUES (6, N'War and conflict');

INSERT tblCategory (CategoryID, CategoryName) VALUES (7, N'Sports');

INSERT tblCategory (CategoryID, CategoryName) VALUES (8, N'Economy');

INSERT tblCategory (CategoryID, CategoryName) VALUES (9, N'Entertainment and culture');

INSERT tblCategory (CategoryID, CategoryName) VALUES (10, N'Health and medicine');

INSERT tblCategory (CategoryID, CategoryName) VALUES (11, N'Love and relationships');

INSERT tblCategory (CategoryID, CategoryName) VALUES (12, N'Science and technology');

INSERT tblCategory (CategoryID, CategoryName) VALUES (13, N'Old');

INSERT tblCategory (CategoryID, CategoryName) VALUES (14, N'Transport');

INSERT tblCategory (CategoryID, CategoryName) VALUES (15, N'Energy');

INSERT tblCategory (CategoryID, CategoryName) VALUES (16, N'Royalty and monarchy');

INSERT tblCategory (CategoryID, CategoryName) VALUES (17, N'Crime and legal');

INSERT tblCategory (CategoryID, CategoryName) VALUES (18, N'Religion');

INSERT tblCategory (CategoryID, CategoryName) VALUES (19, N'Education');

INSERT tblCategory (CategoryID, CategoryName) VALUES (20, N'General');

-- add the continents

INSERT tblContinent (ContinentID, ContinentName) VALUES (1, N'Asia');

INSERT tblContinent (ContinentID, ContinentName) VALUES (2, N'Africa');

INSERT tblContinent (ContinentID, ContinentName) VALUES (3, N'Europe');

INSERT tblContinent (ContinentID, ContinentName) VALUES (4, N'Australasia');
INSERT tblContinent (ContinentID, ContinentName) VALUES (5, N'South America');
INSERT tblContinent (ContinentID, ContinentName) VALUES (6, N'North America');

INSERT tblContinent (ContinentID, ContinentName) VALUES (7, N'Antarctic');

INSERT tblContinent (ContinentID, ContinentName) VALUES (8, N'Not applicable');


-- add the countries
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (1, N'Ukraine', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (2, N'France', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (3, N'Germany', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (4, N'Italy', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (5, N'United States', 6);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (6, N'Bosnia and Herzegovina', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (7, N'United Kingdom', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (8, N'Japan', 1);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (9, N'Indonesia', 1);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (10, N'Vietnam', 1);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (11, N'Russia', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (12, N'Switzerland', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (13, N'Space', 8);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (14, N'Argentina', 5);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (15, N'Antarctica', 7);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (16, N'Belgium', 3);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (17, N'Egypt', 2);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (18, N'Ghana', 2);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (19, N'China', 1);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (20, N'Not set', 1);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (21, N'International', 8);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (22, N'Marshall Islands', 4);

INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (23, N'Iraq', 1);

-- add the events
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (1, N'Chernobyl', N'Reactor 4 at a nuclear power plant in Chernobyl, Ukraine exploded, blowing the 1,000 ton cover off the top of the reactor.', CAST(N'1986-04-26' AS Date), 1, 5);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (2, N'Pearl Harbour', N'Japan launched an attack dubbed ‘Operation Z’ on Pearl Harbour, a United States naval base in Hawaii. The U.S. declared war on Japan the following day, bringing them into World War II.', CAST(N'1941-12-07' AS Date), 5, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (3, N'World War 1 began', N'Often referred to as The Great War, World War I resulted in the death of over 16 million combatants and civilians. The catalyst that spurred the outbreak of fighting was the assassination of Archduke Franz Ferdinand of Austria-Hungary in June 1914, which took place in Sarajevo on 28th June, a month earlier.', CAST(N'1914-07-28' AS Date), 6, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (4, N'World War 1 ends', N'The first world war ended on what is now known as Armistice Day or Remembrance Day.  The armistice was signed in Compiegne in France.', CAST(N'1918-11-11' AS Date), 2, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (5, N'The UK declares war on Germany', N'Following Germany''s invasion of Poland, the UK''s Prime Minister Neville Chamberlain concluded a speech with the words "I have to tell you now that no such undertaking has been received and that consequently this country is at war with Germany."', CAST(N'1939-09-03' AS Date), 7, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (6, N'Liberation of Bergen-Belsen', N'Up to 60,000 prisoners were liberated by the British 11th Armoured Division, although many subsequently died.', CAST(N'1945-04-15' AS Date), 3, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (7, N'World War II ends', N'Japanese representatives aboard the USS Missouri surrender, in effect ending World War II.', CAST(N'1945-09-02' AS Date), 8, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (8, N'Hiroshima', N'The United States dropped an atomic bomb on the city of Hiroshima (Nagasaki followed 3 days later), leading to Japan''s surrender, ending World War II.  At least 129,000 people were killed.', CAST(N'1945-08-06' AS Date), 8, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (9, N'Asian tsunami', N'An earthquake of magniture 9.1-9.3 occurred, with the epicentre off the west coast of Sumatra, Indonesia, killing 230,000 people in 14 countries.', CAST(N'2004-12-26' AS Date), 21, 5);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (10, N'Liberation/fall of Saigon', N'The People''s Army of Vietnam and the National Liberation Front of South Vietnam captured the capital of the south of the country, ending the Vietnam War', CAST(N'1975-04-30' AS Date), 10, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (11, N'9/11 attacks', N'Two hijacked planes crashed into the twin towers of the world trade centre, killing over 3,000 people  (among them over 400 firefighters and police officers).', CAST(N'2001-09-11' AS Date), 5, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (12, N'Brexit vote', N'By a narrow majority Britain votes to leave the European Union (England and Wales voted to leave, although Scotland and Northern Ireland voted to remain).', CAST(N'2016-06-23' AS Date), 7, 1);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (13, N'London Olympic games', N'Widely considered a success, the London Olympics started on 27th July with an opening ceremony which included the Spice Girls and a dramatisation of the NHS.', CAST(N'2012-07-27' AS Date), 7, 7);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (14, N'Lehman Brothers collapses', N'Financial services firm Lehman Brothers filed for Chapter 11 bankruptcy protection on this date.  The filing remains the largest bankruptcy filing in U.S. history, with Lehman holding over $600 billion in assets.', CAST(N'2008-09-15' AS Date), 5, 8);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (15, N'Last edition of "Top of the Pops"', N'The last edition of "Top of the Pops" is broadcast.  The show was hosted by Jimmy Savile, subsquently to be disgraced as a serial sex offender.', CAST(N'2006-07-30' AS Date), 7, 9);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (16, N'London Eye opens', N'The London Eye is a giant Ferris wheel on the South Bank of the River Thames in London, built to celebrate the millennium (although it opened late).', CAST(N'2000-03-09' AS Date), 7, 9);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (17, N'First Harry Potter Book published', N'Harry Potter and the Philosopher''s Stone was first published, the first of an eventual series of 7 by the authoress JK Rowling', CAST(N'1997-07-30' AS Date), 7, 9);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (18, N'Teletubbies first broadcast', N'Tinky-Winky, Dipsy, Laa Laa and Po (not forgetting Nu Nu, the vacuum cleaner) first hit the UK''s television screens on this momentous date in history.', CAST(N'1997-03-31' AS Date), 7, 9);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (19, N'Channel Tunnel opens', N'The Channel Tunnel was officially opened, one year later than originally planned, by Queen Elizabeth II and the French president, François Mitterrand, in a ceremony held in Calais on this date.', CAST(N'1994-05-06' AS Date), 2, 14);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (20, N'Premier League starts', N'The first season ended (as it did 11 times subsequently) with Alex Ferguson ’s Mancheser United taking the trophy. Teddy Sheringham finished as top scorer with 22 goals (one for Nottingham Forest , 21 for Spurs ).', CAST(N'1992-08-15' AS Date), 7, 7);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (21, N'Margaret Thatcher resigns', N'Rather than face a humiliating second round of the Conservative Party leadership election, Margraret Thatcher bows out after 11 years in government.', CAST(N'1990-11-22' AS Date), 7, 1);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (22, N'Coup attempt in Russia', N'The 1991 Soviet coup d''état attempt, also known as the August Putsch or August Coup, was an attempt by members of the Soviet Union''s government to take control of the country from Soviet president Mikhail Gorbachev.', CAST(N'1991-08-19' AS Date), 11, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (23, N'Google launched', N'Google filed for incorporation in California on this date, bringing a new verb to the English language.', CAST(N'1998-09-04' AS Date), 5, 12);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (24, N'Hillsborough', N'96 people died in the crowd gathered to watch a football match between Liverpool and Nottingham Forest  Lord Justice Taylor’s report on the disaster subsequently found there had been a series of problems leading to the huge death toll.', CAST(N'1989-04-15' AS Date), 7, 5);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (25, N'World Wide Web launched', N'On this date Tim Berners-Lee and Robert Cailliau, a Belgian engineer, issued a formal detailed proposal for a project, the acceptance of which initiated The Web.', CAST(N'1990-11-12' AS Date), 12, 12);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (26, N'Great Storm of 1987', N'After Michael Fish (the weatherman) memorably dismisses the chances of a severe storm causing problems, Sevenoaks becomes NoOaks and powerful winds cause chaos in the South-East of England.', CAST(N'1987-10-15' AS Date), 7, 5);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (27, N'M25 opens', N'The last stage of the M25, London''s orbital motorway, opened on this date, ensuring traffic jams for years to come.', CAST(N'1986-10-29' AS Date), 7, 14);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (28, N'Live Aid', N'Bob Geldof organises a host of celebrities to play at Wembley Stadium to raise money to alleviate hunger in Africa - by common consent Queen steal the show.', CAST(N'1985-07-13' AS Date), 7, 9);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (29, N'Miners'' strike starts', N'Arthur Scargill begins a coal miners'' strike which leads to bitter confrontations between miners and police, most notably at the Orgreave coking works', CAST(N'1984-06-18' AS Date), 7, 1);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (30, N'Shergar kidnapped', N'The racehorse Shergar was kidnapped (presumably being held in the same place as Lord Lucan, who disappeared from public life somewhat earlier).', CAST(N'1983-02-08' AS Date), 7, 7);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (32, N'Monty Python first broadcast', N'John Cleese, Michael Palin, Terry Jones, Terry Gilliam, Graham Chapman and Eric Idle launch Monty Python''s Flying Circus on TV.  They''re all naughty boys!', CAST(N'1969-10-05' AS Date), 7, 9);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (33, N'Decimalisation', N'Britain says goodbye to base 12 currency and thruppeny bits, when 12 old pennies suddenly became worth 5 new ones.', CAST(N'1971-02-15' AS Date), 7, 8);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (34, N'Bloody Sunday', N'At a civil rights march in Derry, 30th January, 1972, thirteen people were shot dead (a fourteenth would die months later in hospital).', CAST(N'1972-01-30' AS Date), 7, 6);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (35, N'Britain joins the EEC', N'On this date, Britain (along with Ireland and Denmark) joined the European Community, as it was then called.  In Britain''s case, temporarily it would seem …', CAST(N'1973-01-01' AS Date), 7, 1);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (36, N'Microsoft founded', N'Microsoft ((the first version was hyphenated as Micro-Soft) was founded on this date by Bill Gates (who was 19 at the time) and Paul Allen (who was 22).  Curiously, the company didn''t crash and have to be re-booted.', CAST(N'1975-04-04' AS Date), 5, 12);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (37, N'Fawlty Towers first broadcast', N'John Cleese''s Basil Fawlty entered the UK culture, as did the late Andrew Sachs''s Manuel.  Or should that be "Manuel!"?', CAST(N'1975-09-19' AS Date), 7, 9);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (39, N'First test-tube baby', N'Louise Joy Brown born in Oldham, weighing 5lb 12oz.  Patrick Steptoe, a consultant gynaecologist, and Robert Edwards, a research physiologist, had been developing their techniques in the field of in vitro (in glass) fertilisation since the mid-1960s.', CAST(N'1978-07-25' AS Date), 7, 10);

INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (40, N'Space Invaders arrive', N'On this date the first Space Invaders Machine arrived in Britain, ready for the forthcoming Amusements Trade Exhibition in London.', CAST(N'1979-01-22' AS Date), 7, 9);

SELECT EventName,EventDetails FROM tblevent
WHERE DATE(EventDate)>
(SELECT EventDate FROM tblevent
WHERE CountryID=21
ORDER BY EventDate)
ORDER BY EventDate;

SELECT EventName,EventDetails, CountryID FROM tblevent
WHERE CountryID NOT IN
(SELECT DISTINCT(CountryID) FROM
(SELECT DISTINCT(CountryID) FROM tblevent
ORDER BY CountryID DESC
LIMIT 10)a)
AND CountryID NOT IN
(SELECT DISTINCT(CountryID) FROM
(SELECT DISTINCT(CountryID) FROM tblevent
ORDER BY CountryID DESC
LIMIT 5)b) ;


ALTER TABLE tblcountry
ADD COLUMN Continent VARCHAR(80);
SET SQL_SAFE_UPDATES=0;
UPDATE tblcountry
SET Continent='Eurasia'
WHERE ContinentID=1 OR ContinentID=3;
UPDATE tblcountry
SET Continent='Americas'
WHERE ContinentID=5 OR ContinentID=6;
UPDATE tblcountry
SET Continent='Africa and Australasia'
WHERE ContinentID=2 OR ContinentID=4;
UPDATE tblcountry
SET Continent='Antarctica'
WHERE ContinentID=7;
UPDATE tblcountry
SET Continent='Other'
WHERE ContinentID=8;




SELECT
c.CountryName,
-- show continent for each country
CASE
WHEN c.ContinentID = 3 THEN 'Europe'
WHEN c.ContinentID in (5,6) THEN 'Americas'
WHEN c.ContinentID in (2,4) THEN 'Somewhere hot'
WHEN c.ContinentID = 7 THEN 'Somewhere cold'
WHEN c.ContinentID = 1 THEN 'Asia'
ELSE 'Somewhere else'
END AS CountryLocation
FROM
tblCountry AS c
ORDER BY
CountryLocation DESC













