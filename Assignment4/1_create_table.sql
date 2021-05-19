CREATE TABLE COURSE
(
    CourseNo INTEGER NOT NULL,
    Course_Name VARCHAR(20) NOT NULL,
    Department VARCHAR(20),
    PRIMARY KEY(CourseNo)
);
CREATE TABLE SECTION
(
    CourseNo INTEGER NOT NULL,
    SectionNo INTEGER NOT NULL,
    PRIMARY KEY(CourseNo, SectionNo),
    FOREIGN KEY(CourseNo) REFERENCES COURSE(CourseNo)
);
CREATE TABLE STUDENT
(
    SSN CHAR(9) UNIQUE NOT NULL,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Street VARCHAR(20),
    City VARCHAR(20),
    Zip CHAR(5),
    State VARCHAR(20),
    PRIMARY KEY(SSN)
);
CREATE TABLE ENROLLS
(
    SSN CHAR(9) UNIQUE NOT NULL,
    SectionNo INTEGER NOT NULL,
    CourseNo INTEGER NOT NULL,
    PRIMARY KEY(SSN, SectionNo, CourseNo),
    FOREIGN KEY(CourseNo, SectionNo) REFERENCES SECTION(CourseNo, SectionNo),
    FOREIGN KEY(SSN) REFERENCES STUDENT(SSN)
);
CREATE TABLE EXAM
(
    CourseNo INTEGER NOT NULL,
    SectionNo INTEGER NOT NULL,
    ExamNo INTEGER NOT NULL,
    PRIMARY KEY(CourseNo, SectionNo, ExamNo),
    FOREIGN KEY(CourseNo, SectionNo) REFERENCES SECTION(CourseNo, SectionNo)
);
CREATE TABLE TAKES
(
    SSN CHAR(9) UNIQUE NOT NULL,
    CourseNo INTEGER NOT NULL,
    SectionNo INTEGER NOT NULL,
    ExamNo INTEGER NOT NULL,
    RESULT DOUBLE,
    PRIMARY KEY(SSN, CourseNo, SectionNo, ExamNo),
    FOREIGN KEY(CourseNo, SectionNo, ExamNo) REFERENCES EXAM(CourseNo, SectionNo, ExamNo)
);
CREATE TABLE CLASS_ROOM
(
    RoomNo INTEGER NOT NULL,
    Building VARCHAR(20) NOT NULL,
    Capacity INTEGER,
    PRIMARY KEY(RoomNo, Building)    
);
CREATE TABLE CONDUCTED_IN
(
    RoomNo INTEGER NOT NULL,
    Building VARCHAR(20) NOT NULL,
    CourseNo INTEGER NOT NULL,
    SectionNo INTEGER NOT NULL,
    ExamNo INTEGER NOT NULL,
    PRIMARY KEY(RoomNo, Building, CourseNo, SectionNo, ExamNo),
    FOREIGN Key(RoomNo, Building) REFERENCES CLASS_ROOM(RoomNo, Building),
    FOREIGN KEY(CourseNo, SectionNo, ExamNo) REFERENCES EXAM(CourseNo, SectionNo, ExamNo)
);