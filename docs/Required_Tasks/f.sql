/* f)  Mark course material as
 having been completed by a student 
 (possibly resulting in course 
 completion) */
 
 /* SID 3, MID 00, CCID 000 */
INSERT INTO CompletesMaterial VALUES
(3, '12:02pm', '11/26/17', 00, 000);


/* For our purposes, we will mark course completion
with a separate query here:

INSERT INTO CompletesCourse VALUES 
(<SID>, <TIME>, <DATE>, <CID>, NULL, NULL);



*/