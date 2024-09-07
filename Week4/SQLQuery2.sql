CREATE PROCEDURE AllocateSubjects
AS
BEGIN
    
    DECLARE @StudentId INT;
    DECLARE @SubjectId VARCHAR(10);
    DECLARE @Pref INT;
    DECLARE @RemainingSeats INT;
    DECLARE @Allocated BIT;


    DECLARE student_cursor CURSOR FOR
        SELECT StudentId
        FROM StudentDetails
        ORDER BY GPA DESC;

  
    OPEN student_cursor;
    FETCH NEXT FROM student_cursor INTO @StudentId;

   
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Pref = 1;
        SET @Allocated = 0;


        WHILE @Pref <= 5 AND @Allocated = 0
        BEGIN
         
            SELECT @SubjectId = SubjectId
            FROM StudentPreference
            WHERE StudentId = @StudentId AND Preference = @Pref;

  
            SELECT @RemainingSeats = RemainingSeats
            FROM SubjectDetails
            WHERE SubjectId = @SubjectId;


            IF @RemainingSeats > 0
            BEGIN
                INSERT INTO Allotments (SubjectId, StudentId)
                VALUES (@SubjectId, @StudentId);

                UPDATE SubjectDetails
                SET RemainingSeats = RemainingSeats - 1
                WHERE SubjectId = @SubjectId;

                SET @Allocated = 1;
            END

            SET @Pref = @Pref + 1;
        END


        IF @Allocated = 0
        BEGIN
            INSERT INTO UnallotedStudents (StudentId)
            VALUES (@StudentId);
        END

 
        FETCH NEXT FROM student_cursor INTO @StudentId;
    END


    CLOSE student_cursor;
    DEALLOCATE student_cursor;
END;



EXEC AllocateSubjects;

SELECT * FROM Allotments;
SELECT * FROM SubjectDetails;
SELECT * FROM UnallotedStudents;
