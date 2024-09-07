CREATE TABLE hackers (
  hacker_id int,
  name varchar(50)
);

CREATE TABLE Submissions (
  submission_date date,
  submission_id int,
  hacker_id int,
  score int
);

INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-01', 8494, 20703, 0);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-01', 22403, 53473, 15);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-01', 23965, 79722, 60);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-01', 30173, 36396, 70);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-02', 34928, 20703, 0);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-02', 38740, 15758, 60);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-02', 42769, 79722, 25);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-02', 44364, 79722, 60);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-03', 45440, 20703, 0);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-03', 49050, 36396, 70);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-03', 50273, 79722, 5);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-04', 50344, 20703, 0);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-04', 51360, 44065, 90);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-04', 54404, 53473, 65);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-04', 61533, 79722, 45);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-05', 72852, 20703, 0);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-05', 74546, 38289, 0);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-05', 76487, 62529, 0);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-05', 82439, 36396, 10);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-05', 90006, 36396, 40);
INSERT INTO submissions (submission_date, submission_id, hacker_id, score) VALUES ('2016-03-06', 90404, 20703, 0);


WITH contest_dates AS (
    SELECT '2016-03-01' AS contest_date
    UNION ALL SELECT '2016-03-02'
    UNION ALL SELECT '2016-03-03'
    UNION ALL SELECT '2016-03-04'
    UNION ALL SELECT '2016-03-05'
    UNION ALL SELECT '2016-03-06'
    UNION ALL SELECT '2016-03-07'
    UNION ALL SELECT '2016-03-08'
    UNION ALL SELECT '2016-03-09'
    UNION ALL SELECT '2016-03-10'
    UNION ALL SELECT '2016-03-11'
    UNION ALL SELECT '2016-03-12'
    UNION ALL SELECT '2016-03-13'
    UNION ALL SELECT '2016-03-14'
    UNION ALL SELECT '2016-03-15'
),

daily_unique_hackers AS (
    SELECT 
        s.submission_date,
        COUNT(DISTINCT s.hacker_id) AS unique_hackers
    FROM 
        submissions s
    GROUP BY 
        s.submission_date
),

daily_max_submissions AS (
    SELECT 
        s.submission_date,
        s.hacker_id,
        h.name,
        COUNT(s.submission_id) AS submission_count,
        RANK() OVER (PARTITION BY s.submission_date ORDER BY COUNT(s.submission_id) DESC, s.hacker_id ASC) AS rank
    FROM 
        submissions s
    JOIN 
        hackers h ON s.hacker_id = h.hacker_id
    GROUP BY 
        s.submission_date, s.hacker_id, h.name
),

top_hackers AS (
    SELECT 
        submission_date,
        hacker_id,
        name
    FROM 
        daily_max_submissions
    WHERE 
        rank = 1
)

SELECT 
    cd.contest_date,
    du.unique_hackers,
    th.hacker_id,
    th.name
FROM 
    contest_dates cd
LEFT JOIN 
    daily_unique_hackers du ON cd.contest_date = du.submission_date
LEFT JOIN 
    top_hackers th ON cd.contest_date = th.submission_date
ORDER BY 
    cd.contest_date;
