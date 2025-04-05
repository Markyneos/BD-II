SELECT DISTINCT CONCAT(i.fname, ' ', i.lname)
FROM customer c
INNER JOIN individual i ON c.cust_id = i.cust_id
INNER JOIN account a ON a.cust_id = c.cust_id
INNER JOIN branch br ON br.branch_id = a.open_branch_id
WHERE br.city != c.city
UNION
SELECT DISTINCT b.name
FROM customer c
INNER JOIN business b ON c.cust_id = b.cust_id
INNER JOIN account a ON a.cust_id = c.cust_id
INNER JOIN branch br ON br.branch_id = a.open_branch_id
WHERE br.city != c.city;
-- Marco Antonio Faustini Pessoa
