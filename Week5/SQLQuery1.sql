CREATE PROCEDURE ChangeSubject
    @StudentId VARCHAR(20),
    @NewSubjectId VARCHAR(20)
AS
BEGIN
    -- Check if the student already has records in the SubjectAllotments table
    IF EXISTS (SELECT 1 FROM SubjectAllotments WHERE StudentId = @StudentId)
    BEGIN
        -- Check if the new subject is different from the current valid subject
        IF EXISTS (SELECT 1 FROM SubjectAllotments WHERE StudentId = @StudentId AND Is_Valid = 1 AND SubjectId <> @NewSubjectId)
        BEGIN
            -- Invalidate the current valid subject
            UPDATE SubjectAllotments
            SET Is_Valid = 0
            WHERE StudentId = @StudentId AND Is_Valid = 1;

            -- Insert the new subject as valid
            INSERT INTO SubjectAllotments (StudentId, SubjectId, Is_Valid)
            VALUES (@StudentId, @NewSubjectId, 1);
        END
        ELSE
        BEGIN
            -- If the new subject is the same as the current valid subject, do nothing
            PRINT 'The requested subject is already the current valid subject.';
        END
    END
    ELSE
    BEGIN
        -- If the student has no records, insert the new subject as valid
        INSERT INTO SubjectAllotments (StudentId, SubjectId, Is_Valid)
        VALUES (@StudentId, @NewSubjectId, 1);
    END
END;
