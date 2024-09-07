CREATE TABLE Company (
    company_code VARCHAR(255),
    founder VARCHAR(255)
);

INSERT INTO Company (company_code, founder)
VALUES ('C1', 'Monika'), ('C2', 'Samantha');

CREATE TABLE Lead_Manager (
    lead_manager_code VARCHAR(255),
    company_code VARCHAR(255)
);

INSERT INTO Lead_Manager (lead_manager_code, company_code)
VALUES ('LM1', 'C1'), ('LM2', 'C2');

CREATE TABLE Senior_Manager (
    senior_manager_code VARCHAR(255),
    lead_manager_code VARCHAR(255),
    company_code VARCHAR(255)
);

INSERT INTO Senior_Manager (senior_manager_code, lead_manager_code, company_code)
VALUES ('SM1', 'LM1', 'C1'),
       ('SM2', 'LM1', 'C2'),
       ('SM3', 'LM2', 'C2');

	   CREATE TABLE Manager (
    manager_code VARCHAR(255),
    senior_manager_code VARCHAR(255),
    lead_manager_code VARCHAR(255),
    company_code VARCHAR(255)
);

CREATE TABLE Employee (
    employee_code VARCHAR(255),
    manager_code VARCHAR(255),
    senior_manager_code VARCHAR(255),
    lead_manager_code VARCHAR(255),
    company_code VARCHAR(255)
);



INSERT INTO Manager (manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES ('M1', 'SM1', 'LM1', 'C1'),
       ('M2', 'SM3', 'LM2', 'C2'),
       ('M3', 'SM3', 'LM2', 'C2');


INSERT INTO Employee (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES ('E1', 'M', 'SM1', 'LM1', 'C1'),
       ('E2', 'M', 'SM1', 'LM1', 'C1'),
       ('E3', 'M2', 'SM3', 'LM2', 'C2'),
       ('E4', 'M3', 'SM3', 'LM2', 'C2');


	   SELECT c.company_code,
       c.founder,
       COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers,
       COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers,
       COUNT(DISTINCT m.manager_code) AS total_managers,
       COUNT(DISTINCT e.employee_code) AS total_employees
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
LEFT JOIN Manager m ON sm.senior_manager_code = m.senior_manager_code
LEFT JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
