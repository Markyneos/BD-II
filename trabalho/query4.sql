-- Marco Antonio Faustini Pessoa
SELECT br.name, a.account_id, CONCAT(i.fname, ' ', i.lname) AS nome, a.avail_balance
FROM account a INNER JOIN branch br ON a.open_branch_id=br.branch_id
INNER JOIN customer c ON a.cust_id=c.cust_id
INNER JOIN individual i ON c.cust_id=i.cust_id
WHERE a.avail_balance = (SELECT MAX(a2.avail_balance)
FROM account a2
WHERE a2.open_branch_id=a.open_branch_id)
UNION
SELECT br.name, a.account_id, b.name, a.avail_balance
FROM account a INNER JOIN branch br ON a.open_branch_id=br.branch_id
INNER JOIN customer c ON a.cust_id=c.cust_id
INNER JOIN business b ON c.cust_id=b.cust_id
WHERE a.avail_balance = (SELECT MAX(a2.avail_balance)
FROM account a2
WHERE a2.open_branch_id=a.open_branch_id);
