CREATE FUNCTION FormatDate_YYYYMMDD
(
    @InputDate DATETIME
)
RETURNS NVARCHAR(8)
AS
BEGIN
    DECLARE @FormattedDate NVARCHAR(8);
    SET @FormattedDate = CONVERT(NVARCHAR(8), @InputDate, 112);
    RETURN @FormattedDate;
END;
GO


-- Test the function
DECLARE @TestDate DATETIME = '2006-11-21 23:34:05.920';
SELECT dbo.FormatDate_YYYYMMDD(@TestDate) AS FormattedDate;

