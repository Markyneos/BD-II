SELECT o.fname, o.lname, b.name, c.city
FROM officer o JOIN business b ON o.cust_id=b.cust_id
JOIN customer c ON b.cust_id=c.cust_id;
