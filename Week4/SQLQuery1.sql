
CREATE TABLE StudentPreference (
    StudentId INT,
    SubjectId VARCHAR(10),
    Preference INT,
    PRIMARY KEY (StudentId, SubjectId)
);

CREATE TABLE SubjectDetails (
    SubjectId VARCHAR(10),
    SubjectName VARCHAR(100),
    MaxSeats INT,
    RemainingSeats INT,
    PRIMARY KEY (SubjectId)
);

CREATE TABLE StudentDetails (
    StudentId INT,
    StudentName VARCHAR(100),
    GPA DECIMAL(3, 2),
    Branch VARCHAR(50),
    Section VARCHAR(10),
    PRIMARY KEY (StudentId)
);

CREATE TABLE Allotments (
    SubjectId VARCHAR(10),
    StudentId INT,
    PRIMARY KEY (SubjectId, StudentId)
);

CREATE TABLE UnallotedStudents (
    StudentId INT,
    PRIMARY KEY (StudentId)
);
