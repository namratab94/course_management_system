/* f)  Mark course material as
 having been completed by a student 
 (possibly resulting in course 
 completion) */
 
 /* SID 3, MID 00, CCID 000 */
INSERT INTO CompletesMaterial VALUES
(3, '12:02pm', '2017-11-26', 00, 000);


/* we mark course completion with a separate query here: */
INSERT INTO CompletesCourse VALUES
(3, '12:02pm', '2017-11-26', 000, NULL, NULL);