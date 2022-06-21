-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
SELECT employee_name,monthly_salary
FROM employees em 
JOIN employee_salary emsal ON em.id=emsal.employee_id 
JOIN salary sal ON emsal.salary_id=sal.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employee_name,monthly_salary
FROM employees em 
JOIN employee_salary emsal ON em.id=emsal.employee_id 
JOIN salary sal ON emsal.salary_id=sal.id
WHERE monthly_salary<2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает).
SELECT employee_name,monthly_salary
FROM employee_salary emsal 
JOIN salary sal ON emsal.salary_id=sal.id
LEFT JOIN employees em ON em.id=emsal.employee_id 
WHERE em.employee_name IS NULL;

--4. Вывести все зарплатные позиции  меньше 2000, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает).
SELECT employee_name,monthly_salary
FROM employee_salary emsal 
JOIN salary sal ON emsal.salary_id=sal.id
LEFT JOIN employees em ON em.id=emsal.employee_id 
WHERE em.employee_name IS NULL AND sal.monthly_salary<2000;

-- 5. Найти всех работников кому не начислена ЗП.
SELECT employee_name,monthly_salary
FROM employee_salary emsal 
JOIN salary sal ON emsal.salary_id=sal.id
RIGHT JOIN employees em ON em.id=emsal.employee_id 
WHERE sal.monthly_salary IS NULL;

--6. Вывести всех работников с названиями их должности.
SELECT employee_name,role_name
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id;

--7. Вывести имена и должность только Java разработчиков.
SELECT employee_name,role_name
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
WHERE LOWER(r.role_name) LIKE '%java %';

--8. Вывести имена и должность только Python разработчиков.
SELECT employee_name,role_name
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
WHERE LOWER(r.role_name) LIKE '%python%';

--9. Вывести имена и должность всех QA инженеров.
SELECT employee_name,role_name
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
WHERE LOWER(r.role_name) LIKE '%qa%';

--10. Вывести имена и должность ручных QA инженеров.
SELECT employee_name,role_name
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
WHERE LOWER(r.role_name) LIKE '%manual qa%';

--11. Вывести имена и должность автоматизаторов QA.
SELECT employee_name,role_name
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
WHERE LOWER(r.role_name) LIKE '%automation qa%';

--12. Вывести имена и зарплаты Junior специалистов.
SELECT employee_name,role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%junior%';

--13. Вывести имена и зарплаты Middle специалистов.
SELECT employee_name,role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%middle%';

--14. Вывести имена и зарплаты Senior специалистов.
SELECT employee_name,role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%senior%';

--15. Вывести зарплаты Java разработчиков.
SELECT role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%java %';

--16. Вывести зарплаты Python разработчиков.
SELECT role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%python%';

--17. Вывести имена и зарплаты Junior Python разработчиков.
SELECT employee_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%junior python%';

--18. Вывести имена и зарплаты Middle JS разработчиков.
SELECT employee_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal on sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%middle javascript%';

--19. Вывести имена и зарплаты Senior Java разработчиков.
SELECT employee_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%senior java %';

--20. Вывести зарплаты Junior QA инженеров.
SELECT role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%junior%qa%';

-- 21. Вывести среднюю зарплату всех Junior специалистов.
SELECT AVG(monthly_salary) AS avg_jun_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%junior%';

--22. Вывести сумму зарплат JS разработчиков.
SELECT SUM(monthly_salary) AS sum_js_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%javascript%';

--23. Вывести минимальную ЗП QA инженеров.
SELECT MIN(monthly_salary) AS min_qa_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%qa%';

--24. Вывести максимальную ЗП QA инженеров.
SELECT MAX(monthly_salary) AS max_qa_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%qa%';

--25. Вывести количество QA инженеров.
SELECT COUNT(employee_name) AS qa_count
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%qa%';

--26. Вывести количество Middle специалистов.
SELECT COUNT(employee_name) AS middle_count
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%middle%';

--27. Вывести количество разработчиков.
SELECT COUNT(employee_name) AS dev_count
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT SUM(monthly_salary) AS sum_dev_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
WHERE LOWER(r.role_name) LIKE '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию.
SELECT employee_name,role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id 
ORDER BY monthly_salary ASC;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300.
SELECT employee_name,role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id
WHERE monthly_salary>=1700 AND monthly_salary<=2300
ORDER BY monthly_salary ASC;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300.
SELECT employee_name,role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id
WHERE monthly_salary<2300
ORDER BY monthly_salary ASC;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000.
SELECT employee_name,role_name,monthly_salary
FROM roles_employee rolem 
JOIN employees em ON rolem.employee_id=em.id 
JOIN roles r ON rolem.role_id=r.id
JOIN employee_salary emsal ON rolem.employee_id=emsal.employee_id
JOIN salary sal ON sal.id=emsal.salary_id
WHERE monthly_salary IN(1100,1500,2000)
ORDER BY monthly_salary ASC;








