CREATE FUNCTION FormatDate_MMDDYYYY
(
    @InputDate DATETIME
)
RETURNS NVARCHAR(10)
AS
BEGIN
    DECLARE @FormattedDate NVARCHAR(10);
    SET @FormattedDate = FORMAT(@InputDate, 'MM/dd/yyyy');
    RETURN @FormattedDate;
END;
GO


CREATE FUNCTION ConvertDate_MMDDYYYY
(
    @InputDate DATETIME
)
RETURNS NVARCHAR(10)
AS
BEGIN
    DECLARE @FormattedDate NVARCHAR(10);
    SET @FormattedDate = CONVERT(NVARCHAR(10), @InputDate, 101);
    RETURN @FormattedDate;
END;
GO






-- Test using FORMAT function
DECLARE @TestDate DATETIME = '2006-11-21 23:34:05.920';
SELECT dbo.FormatDate_MMDDYYYY(@TestDate) AS FormattedDate;

-- Test using CONVERT function
DECLARE @TestDate2 DATETIME = '2006-11-21 23:34:05.920';
SELECT dbo.ConvertDate_MMDDYYYY(@TestDate2) AS FormattedDate;
