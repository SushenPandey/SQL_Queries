CREATE FUNCTION dbo.IsPrime (@num INT)
RETURNS BIT
AS
BEGIN
    DECLARE @i INT, @isPrime BIT
    SET @isPrime = 1
    IF @num <= 1
        SET @isPrime = 0
    ELSE IF @num > 2
        BEGIN
            SET @i = 2
            WHILE @i * @i <= @num
                BEGIN
                    IF @num % @i = 0
                        BEGIN
                            SET @isPrime = 0
                            BREAK
                        END
                    SET @i = @i + 1
                END
        END
    RETURN @isPrime
END


WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < 1000
),
Primes AS (
    SELECT n
    FROM Numbers
    WHERE dbo.IsPrime(n) = 1
)
SELECT STRING_AGG(CAST(n AS VARCHAR), '&') AS PrimeNumbers
FROM Primes
OPTION (MAXRECURSION 1000);
