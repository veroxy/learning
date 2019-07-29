
mysql> show databases;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| cms                |
| goodfoodncookbook  |
| hoc                |
| hocblog            |
| laravel            |
| manytomany         |
| middlewares        |
| minus              |
| mysql              |
| onetomany          |
| onetoone           |
| performance_schema |
| sys                |
| webstore           |
+--------------------+
15 rows in set (0.02 sec)


mysql> use webstore;
-- Database changed
mysql> show tables;
/*
+--------------------+
| Tables_in_webstore |
+--------------------+
| categorie          |
| produit            |
| produit_categorie  |
| produit_similaire  |
+--------------------+
4 rows in set (0.00 sec)
*/
mysql> INSERT INTO categorie (nom) VALUES ('Gaming');


mysql> SELECT produit_source.nom AS 'Nom produit', COUNT(produit_cible.id_produit
) AS 'Nombre de produits similaires'
-> FROM produit produit_source
->   LEFT JOIN produit_similaire ps
->     ON produit_source.id_produit = ps.id_produit_source_j
->   LEFT JOIN produit produit_cible
->     ON ps.id_produit_cible_j = produit_cible.id_produit
-> GROUP BY produit_source.id_produit;
/*
+--------------------+-------------------------------+
| Nom produit        | Nombre de produits similaires |
+--------------------+-------------------------------+
| PC Portable HP     |                             2 |
| Souris sans fil    |                             1 |
| Souris gaming      |                             0 |
| PC Bureau          |                             0 |
| Ecran 27"          |                             1 |
| Ecran 17"          |                             0 |
| PC Portable Lenovo |                             0 |
| Clavier            |                             1 |
| Casque             |                             0 |
+--------------------+-------------------------------+
9 rows in set (0.01 sec)
*/


/*
mysql> show tables
    -> ;
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+
8 rows in set (0.00 sec)
 */
SELECT DISTINCT employees.first_name, employees.last_name
FROM employees
WHERE employees.gender = "F";

SELECT count(case when e.gender='M' THEN 1 END) AS 'hommes',  count(case when e.gender='F' THEN 1 END)AS 'femmes' from employees e;
/*
+--------+--------+
| hommes | femmes |
+--------+--------+
| 179973 | 120051 |
+--------+--------+
1 row in set (0.12 sec)
 */
-- 120051
SELECT count(DISTINCT concat(f.first_name, f.last_name)),count(DISTINCT concat(m.first_name, m.last_name))
FROM employees
  INNER JOIN employees f
WHERE employees.gender ="f";
-- 116665

SELECT avg(s.salary) AS "moyenne salaire",year(s.from_date) AS "an"
FROM salaries s
GROUP BY year(s.from_date) ASC;
/*
+-----------------+------+
| moyenne salaire | an   |
+-----------------+------+
|      53182.3580 | 1985 |
|      54084.7786 | 1986 |
|      54959.6284 | 1987 |
|      55862.4465 | 1988 |
|      56840.6728 | 1989 |
|      57839.4601 | 1990 |
|      58803.8697 | 1991 |
|      59758.7416 | 1992 |
|      60753.6565 | 1993 |
|      61727.7589 | 1994 |
|      62681.0430 | 1995 |
|      63618.9426 | 1996 |
|      64565.4264 | 1997 |
|      65540.2683 | 1998 |
|      66525.3619 | 1999 |
|      68556.2781 | 2000 |
|      70694.9159 | 2001 |
|      72683.9397 | 2002 |
+-----------------+------+
18 rows in set (1.59 sec)
*/
-- Quelle est la moyenne des salaires des managers par département ?
mysql> select * from dept_manager

SELECT s.salaries

/*
+--------+---------+------------+------------+
| emp_no | dept_no | from_date  | to_date    |
+--------+---------+------------+------------+
| 110022 | d001    | 1985-01-01 | 1991-10-01 |
| 110039 | d001    | 1991-10-01 | 9999-01-01 |
| 110085 | d002    | 1985-01-01 | 1989-12-17 |
| 110114 | d002    | 1989-12-17 | 9999-01-01 |
| 110183 | d003    | 1985-01-01 | 1992-03-21 |
| 110228 | d003    | 1992-03-21 | 9999-01-01 |
| 110303 | d004    | 1985-01-01 | 1988-09-09 |
| 110344 | d004    | 1988-09-09 | 1992-08-02 |
| 110386 | d004    | 1992-08-02 | 1996-08-30 |
| 110420 | d004    | 1996-08-30 | 9999-01-01 |
| 110511 | d005    | 1985-01-01 | 1992-04-25 |
| 110567 | d005    | 1992-04-25 | 9999-01-01 |
| 110725 | d006    | 1985-01-01 | 1989-05-06 |
| 110765 | d006    | 1989-05-06 | 1991-09-12 |
| 110800 | d006    | 1991-09-12 | 1994-06-28 |
| 110854 | d006    | 1994-06-28 | 9999-01-01 |
| 111035 | d007    | 1985-01-01 | 1991-03-07 |
| 111133 | d007    | 1991-03-07 | 9999-01-01 |
| 111400 | d008    | 1985-01-01 | 1991-04-08 |
| 111534 | d008    | 1991-04-08 | 9999-01-01 |
| 111692 | d009    | 1985-01-01 | 1988-10-17 |
| 111784 | d009    | 1988-10-17 | 1992-09-08 |
| 111877 | d009    | 1992-09-08 | 1996-01-03 |
| 111939 | d009    | 1996-01-03 | 9999-01-01 |
+--------+---------+------------+------------+
24 rows in set (0.00 sec)*/
INSERT INTO departments (dept_no,dept_name)
VALUES ('d010','Maintenance');
-- COALESCE(val,val...) > pour afficher la première valeur non null
SELECT d.dept_name AS departments, COALESCE(AVG(s.salary)) AS moyenne
  FROM salaries s
  INNER JOIN dept_manager dm
  ON d.emp_no = dm.emp_no
  INNER JOIN departments d
      ON dm.dept_no = d.dep_no
WHERE s.from_date >= dm.from_date
AND s.date_to <= dm.to_date
GROUP BY d.dept_no
ORDER BY moyennes;
-- WHERE () or null PERMET de ne pas retourner d'erreur pour inlcure les colomen/table dont la valeur est NULL
SELECT d.dept_name AS deptartment, COALESCE(AVG(s.salary),0) AS moyenne
  FROM departements d
  LEFT JOIN dept_manager dm
      ON d.emp_no = dm.emp_no
  LEFT JOIN salaries s
      ON dm.dept_no = d.dep_no
WHERE (s.from_date >= dm.from_date
  AND s.date_to <= dm.to_date)
    OR dm.emp_no IS NULL
GROUP BY d.dept_no
ORDER BY moyennes;
--

-- Tous les salaires des managers des departements 'sales'

-- je selectionn
USE employees;

SELECT d.dept_name AS DeptSales, dm.emp_no  AS ManagerNum
FROM departments d
  INNER JOIN dept_manager dm
  ON d.dept_no = dm.dept_no
  INNER JOIN dept_emp de
  ON dm.dept_no = de.dept_no
WHERE d.dept_name = "Sales"
GROUP BY dm.from_date;

--

SELECT d.dept_name AS DeptSales,e.last_name,dm.emp_no  AS ManagerNum
FROM departments d
  INNER JOIN dept_manager dm
    ON d.dept_no = dm.dept_no
  INNER JOIN employees e
    ON dm.emp_no = e.emp_no
WHERE d.dept_name = "Sales"
GROUP BY dm.from_date;



-- Ajouter le critère des date (tjs sur Sales)
SELECT d.dept_name AS DeptSales, dm.emp_no  AS ManagerNum
FROM departments d
  INNER JOIN dept_manager dm
    ON d.dept_no = dm.dept_no
  INNER JOIN dept_emp de
    ON dm.dept_no = de.dept_no
WHERE d.dept_name = "Sales"
  AND (de.from_date >= dm.to_date)OR dm.from_date IS NULL
GROUP BY dm.from_date;

-- Commenter les critère de date (WHERE ) + enlever ()dept_name = sales) et afficher dla moyenne de tous les salaires des mgrs + group by dept (en INNER JOIN puis en LEFT JOIN)

-- Avec LEFT JOIN intégrer la ft dCOELESCE(AVG(...),0)
-- Decommenter le parametre WHERE et ajouter 'OR is NULL'


