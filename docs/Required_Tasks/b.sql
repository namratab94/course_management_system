INSERT INTO User VALUES
(11, 'Rob', 'Barron', '10 Smith St.', 'Cambridge', '02139', 'USA', 'rbarron@example.com', NULL);

INSERT INTO Faculty VALUES
(11, 'Associate', 'WPI', 'www.rob.com');

/* Query to find out which faculty need to be authenticated by an admin */
select * from faculty where Faculty.FID = (select Faculty.FID as FID from Faculty left join Authentication on Authentication.FID = Faculty.FID
where Authentication.AuthDate is null and Faculty.Title = 'Associate');

/* DO Insert to Authentication table as faculty has a title */
INSERT INTO Authentication VALUES
(11, 9, '10-1-17', '10:00am');

/* The admin can be authenticated by another admin
	Here user Id with 9 is getting authenticated by user id 10*/


/* An new administrator is authenticated by an existing admin  */
INSERT INTO User VALUES
(12, 'Walter', 'White', '11Smith St.', 'Cambridge', '02139', 'USA', 'wwhite@example.com', NULL);

INSERT INTO Admin VALUES
(12, 10, '01-1-17', '10:00am');