create table Contests(contest_id int,hacker_id int,Name varchar(15));

create table Challenges(challenge_id int,college_id int);

create table Colleges(college_id int, contest_id int);

create table View_stats(Challenge_id int, total_views int, total_unique_views int);

create table Submission_stats(Challenge_id int ,total_submissions int , total_accepted_submissions int);

INSERT INTO Contests (contest_id, hacker_id, name)
VALUES (66406, 17973, 'Rose'),
       (66556, 79153, 'Angela'),
       (94828, 80275, 'Frank');

INSERT INTO Colleges (college_id, contest_id)
VALUES (11219, 66406),
       (32473, 66556),
       (56685, 94828);

INSERT INTO Challenges (challenge_id, college_id)
VALUES (18765, 11219),
       (47127, 32473),
       (60292, 32473),
       (72974, 56685);

insert into View_stats(Challenge_id,total_views,total_unique_views) 
values(47127,26,19),(47127,15,14),(18765,43,10),(18765,43,10),(75516,35,17),(60292,11,10),(72974,41,15),(75516,75,11);

insert into Submission_stats(Challenge_id,total_submissions,total_accepted_submissions)
values(75516,34,12),(47127,27,10),(47127,56,18),(75516,74,12),(75516,83,8),(72974,68,24),(72974,82,14),(47127,28,11);

SELECT CON.contest_id, CON.hacker_id, CON.name,
  SUM(total_submissions) AS total_submissions,
  SUM(total_accepted_submissions) AS total_accepted_submissions,
  SUM(total_views) AS total_views,
  SUM(total_unique_views) AS total_unique_views
FROM Contests CON
INNER JOIN Colleges COL ON CON.contest_id = COL.contest_id
INNER JOIN Challenges CHA ON COL.college_id = CHA.college_id
LEFT JOIN (
  SELECT challenge_id, 
         SUM(total_submissions) AS total_submissions,
         SUM(total_accepted_submissions) AS total_accepted_submissions
  FROM Submission_Stats
  GROUP BY challenge_id
)  -- Removed alias 'SS'
ON CHA.challenge_id = challenge_id  -- Use subquery directly
LEFT JOIN (
  SELECT challenge_id, 
         SUM(total_views) AS total_views,
         SUM(total_unique_views) AS total_unique_views
  FROM View_Stats
  GROUP BY challenge_id
)  -- Removed alias 'VS'
ON CHA.challenge_id = challenge_id  -- Use subquery directly
GROUP BY CON.contest_id, CON.hacker_id, CON.name
HAVING SUM(total_submissions) != 0 
   AND SUM(total_accepted_submissions) != 0 
   AND SUM(total_views) != 0 
   AND SUM(total_unique_views) != 0
ORDER BY CON.contest_id;







