WITH RankedSalaries AS (
    SELECT 
        salary,
        ROW_NUMBER() OVER (ORDER BY salary DESC) as rn
    FROM employee
    GROUP BY salary -- This removes duplicates so the 2nd row is truly the 2nd highest
)
SELECT salary AS second_highest_salary
FROM RankedSalaries
WHERE rn = 2;