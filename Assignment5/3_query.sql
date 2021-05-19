SELECT S.SSN, S.FIRST_NAME, S.LAST_NAME 
FROM STUDENT AS S JOIN ENROLLS AS E ON S.SSN = E.SSN JOIN SECTION AS SEC ON E.CourseNo = SEC.CourseNo AND E.SectionNo = SEC.SectionNo JOIN COURSE AS C ON SEC.CourseNo = C.CourseNo
WHERE C.Course_Name='Computer Architecture';

SELECT S.SSN, S.FIRST_NAME, S.LAST_NAME, C.CourseNo, SEC.SectionNo
FROM STUDENT AS S JOIN ENROLLS AS E ON S.SSN = E.SSN JOIN SECTION AS SEC ON E.CourseNo = SEC.CourseNo AND E.SectionNo = SEC.SectionNo JOIN COURSE AS C ON SEC.CourseNo = C.CourseNo
WHERE C.Course_Name='VLSI';

SELECT C.Course_Name, C.CourseNo
FROM COURSE AS C
WHERE (SELECT COUNT(*) FROM ENROLLS AS E WHERE C.CourseNo = E.CourseNo) >= 2;

SELECT S.SSN, S.First_Name, S.Last_Name
FROM STUDENT AS S
WHERE (SELECT COUNT(*) FROM TAKES AS T WHERE T.SSN = S.SSN AND T.RESULT >= 90) >= 2;

SELECT E.ExamNo, E.CourseNo, E.SectionNo, CR.Capacity, CI.RoomNo, CI.Building
FROM CONDUCTED_IN AS CI JOIN EXAM AS E ON CI.ExamNo = E.ExamNo  AND CI.SectionNo = E.SectionNo AND CI.CourseNo = E.CourseNo JOIN CLASS_ROOM AS CR ON CI.RoomNo = CR.RoomNo AND CI.Building = CR.Building
WHERE CR.Building='Riverside Hall';

SELECT S.SSN, S.First_Name, S.Last_Name
FROM STUDENT AS S JOIN ENROLLS AS E ON S.SSN = E.SSN
WHERE E.CourseNo='CSC11' OR E.CourseNo='CSC12';

SELECT C.Course_Name, COUNT(S.SectionNo) AS 'Number of Sections'
FROM SECTION AS S JOIN COURSE AS C ON S.CourseNo = C.CourseNo
GROUP BY C.CourseNo
HAVING COUNT(S.SectionNo) > 2;

SELECT CR.RoomNo, CR.Building, CI.CourseNo, CI.SectionNo, CI.ExamNo 
FROM CLASS_ROOM AS CR LEFT OUTER JOIN CONDUCTED_IN AS CI ON CR.RoomNo = CI.RoomNo AND CR.Building = CR.Building 
WHERE CR.RoomNo=1002 AND CR.Building='RVR';