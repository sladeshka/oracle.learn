-- Лабораторная работа 1

-- 1. Команда SELECT содержит 4 ошибки. Укажите их. SELECT employee_id, last_name sal x 12 ANNUAL SALARY FROM employees;
SELECT EMPLOYEE_ID,
       LAST_NAME,
       SALARY * 12 AS ANNUAL_SALARY
FROM employees;

-- 2. Покажите структуру таблицы DEPARTMENS. Выберите данные из неё.
SELECT *
FROM DEPARTMENTS;

-- 3. Составьте запрос для вывода имени каждого служащего, должности, даты найма и номера. Номер служащего должен быть первым.
SELECT EMPLOYEE_ID,
       FIRST_NAME || ' ' ||
       LAST_NAME AS FULL_NAME,
       HIRE_DATE,
       JOB_ID
FROM EMPLOYEES;

-- 4. Покажите структуру таблицы EMPLOYEES.
DESCRIBE EMPLOYEES;

-- 5. Составьте запрос для вывода неповторяющихся должностей из таблицы EMPLOYEES.
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 6. Выведите на экран имя, соединённое с идентификатором должности через запятую и пробел. Назовите новый столбец Employee and Title
SELECT FIRST_NAME || ', ' ||
       JOB_ID AS "Employee and Title"
FROM EMPLOYEES;

-- 7. Создайте запрос для вывода всех данных из таблицы EMPLOYEES. Разделите столбцы запятыми. Назовите столбец THE_OUTPUT
SELECT FIRST_NAME || ', ' ||
       JOB_ID AS "Employee and Title"
FROM EMPLOYEES;

-- 8. Создайте запрос для вывода всех данных из таблицы EMPLOYEES. Разделите столбцы запятыми. Назовите столбец THE_OUTPUT
SELECT EMPLOYEE_ID || ',' ||
       FIRST_NAME || ',' ||
       LAST_NAME || ',' ||
       EMAIL || ',' ||
       PHONE_NUMBER || ',' ||
       HIRE_DATE || ',' ||
       JOB_ID || ',' ||
       SALARY || ',' ||
       COMMISSION_PCT || ',' ||
       MANAGER_ID || ',' ||
       DEPARTMENT_ID AS "THE_OUTPUT"
FROM EMPLOYEES;

-- Лабораторная работа 2

-- 1. Создайте запрос для вывода имени и заработной платы служащих, зарабатывающих более $12000. Сохраните команду SQL в файле lab2_1.sql. выполните запрос.
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12000;

-- 2. Создайте запрос для вывода фамилии и номера отдела служащего под номером 176
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176;

-- 3. Измените файл lab2_1.sql и выведите фамилии и оклады всех служащих, чей оклад не входит в диапазон от $5000 до $12000. сохраните команду SQL в файле lab2_3.sql.
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12000
   OR SALARY < 5000;

-- 4. Выведите фамилию, идентификатор должности и дату начала работы всех служащих, нанятых в период с 20 февраля 1998 по 1 мая 1998 г. Отсортируйте данные в порядке возрастания даты найма.
SELECT LAST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('20.02.1998', 'dd.mm.yyyy') AND TO_DATE('01.05.1998', 'dd.mm.yyyy')
ORDER BY HIRE_DATE ASC;

-- 5. Выведите фамилию и номер отдела всех служащих из отделов 20 и 50. Отсортируйте данные по фамилиям в алфавитном порядке.
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 20)
  AND ROWNUM <= 7
ORDER BY LAST_NAME ASC;

-- 6. Измените файл lab2_3.sql для вывода фамилий и окладов служащих отделов 20 и 50, зарабатывающих от $5000 до $12000. Назовите столбцы Employee и Mounthly Salary, соответственно. Вновь сохраните команду SQL  в файле lab2_6.sql. Выполните запрос.
SELECT LAST_NAME AS EMPLOYEE, SALARY AS "Mounthly Salary"
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 20)
  AND (SALARY <= 12000 AND SALARY >= 5000);

-- 7. Выведите фамилию и дату найма всех служащих, нанятых в 1994 г.
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('1.01.1994', 'dd.mm.yyyy') AND TO_DATE('31.12.1994', 'dd.mm.yyyy')

-- 8. Выведите фамилии и должности всех служащих, не имеющих менеджера.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 9. Выведите фамилию, и комиссионные всех служащих, зарабатывающих комиссионные. Отсортируйте данные в порядке убывания окладов и комиссионных.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- 10. Выведите все фамилии служащих, в которых третья буква – а.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE SUBSTR(LAST_NAME, 3, 1) = 'a';

-- 11. Выведите фамилии всех служащих, в которых есть буквы «а» и «е».
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%'
   OR LAST_NAME LIKE '%e%';

-- 12. запросите фамилии, должности и оклады всех служащих, работающих торговыми представителями (SA_REP) или клерками на складе (ST_CLERK) и с окладом, не равным  $2500, $3500 и $7000.
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE (JOB_ID = 'SA_REP' OR JOB_ID = 'ST_CLERK')
  AND (SALARY <> 2500 AND SALARY <> 3500 AND SALARY <> 7000);

-- 13. Измените lab2_6.sql так, чтобы получить фамилии оклады и комиссионные всех служащих, у которых сумма комиссионных превышает 20%. Выполните запрос ещё раз. Сохраните запрос в файле lab2_13.sql.
SELECT LAST_NAME AS "Employee", SALARY AS "Monthly Salary", COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT > .2;

-- Лабораторная работа 3

-- 1. Напишите запрос для вывода текущей даты. Назовите столбец Date.
SELECT SYSDATE AS "DATA"
FROM DUAL;

-- 2. 3. Выведите номер служащего, его фамилию, оклад и новый оклад, повышенный на 15% и округлённый до целого. Назовите столбец New Salary. Сохраните команду SQL в текстовом файле lab3_2sql.
SELECT EMPLOYEE_ID,
       LAST_NAME,
       SALARY,
       ROUND(SALARY * 1.15) AS "New Salary"
FROM EMPLOYEES
WHERE ROWNUM <= 20;

-- 4. Измените lab3_2.sql. добавьте ещё один столбец, который будет содержать результат вычитания старого оклада из нового. Назовите столбец Increase. Сохраните изменённый запрос в lab3_4.sql. Выполните запрос ещё раз.
SELECT EMPLOYEE_ID,
       LAST_NAME,
       SALARY,
       ROUND(SALARY * 1.15)          AS "New Salary",
       ROUND(SALARY * 1.15) - SALARY AS "Increase"
FROM EMPLOYEES
WHERE ROWNUM <= 20;

-- 5. Выведите фамилии служащих (первая буква каждой фамилии должна быть заглавной, а остальные - строчными) и длину каждой фамилии для тех служащих, фамилия которых начинается с символа J, A или М. Присвойте соответствующие заголовки столбцам.
SELECT CONCAT(UPPER(SUBSTR(LAST_NAME, 1, 1)), LOWER(SUBSTR(LAST_NAME, 2))) AS "Name",
       LENGTH(LAST_NAME)                                                   AS "Lenght"
FROM EMPLOYEES
WHERE SUBSTR(LAST_NAME, 0, 1) IN ('J', 'A', 'М');

-- Лабораторная работа 4

-- 1. Для каждого служащего выведите фамилию и вычислите количество месяцев со дня найма до настоящего времени, округлённое до ближайшего целого. Назовите столбец MONTH_WORKED. Результаты отсортируйте по количеству отработанных месяцев. Округлите число до ближайшего целого.
SELECT LAST_NAME,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS MONTH_WORKED
FROM EMPLOYEES
WHERE ROWNUM <= 20
ORDER BY MONTH_WORKED;

-- 2. Получите по каждому служащему отчёт в следующем виде: <фамилия> зарабатывает <оклад> в месяц, но желает <утроенный оклад>. Назовите столбец Dream Salaries
SELECT LAST_NAME || ' earns ' || TO_CHAR(SALARY, 'FM$999,999,999.00') || ' monthly but wants ' ||
       TO_CHAR(SALARY * 3, 'FM$999,999,999.00') AS "Dream Salaries"
FROM EMPLOYEES
WHERE ROWNUM <= 20;

-- 3. Напишите запрос для вывода фамилий и окладов всех служащих. Назовите выходной столбец SALARY. Длина столбца SALARY – 15 символов с заполнением символом $.
SELECT LAST_NAME,
       LPAD(TO_CHAR(SALARY, 'FM999999', 'NLS_CURRENCY = $'), 15, '$') AS SALARY
FROM EMPLOYEES
WHERE ROWNUM <= 20;

-- 4. Для каждого служащего выведите фамилию, дату найма и дату пересмотра зарплаты, которая приходится на первый понедельник после 6 месяцев работы. Назовите столбец REVIEW. Формат даты при выводе имеет вид: “Monday, the Thirty-First of MM, YYYY”.
SELECT LAST_NAME                                                    AS "LAST_NAME",
       HIRE_DATE                                                    AS "HIRE_DATE",
       TO_CHAR(NEXT_MONDAY, 'Monday, the Thirty-First of MM, YYYY') AS "REVIEW"
FROM (SELECT E.LAST_NAME,
             E.HIRE_DATE,
             NEXT_DAY(ADD_MONTHS(E.HIRE_DATE, 6), 'MONDAY') AS NEXT_MONDAY
      FROM EMPLOYEES E)
WHERE ROWNUM <= 20
ORDER BY LAST_NAME;

-- 5. По каждому служащему выведите фамилию, дату  найма и день недели, когда он был нанят на работу. Назовите последний столбец DAY. Отсортируйте результаты по датам.
SELECT LAST_NAME                 AS "LAST_NAME",
       HIRE_DATE                 AS "HIRE_DATE",
       TO_CHAR(HIRE_DATE, 'Day') AS "DAY"
FROM EMPLOYEES
WHERE ROWNUM <= 20
ORDER BY HIRE_DATE;

-- 6. Напишите запрос для вывода фамилии и суммы комиссионных каждого служащего. Если служащий не зарабатывает комиссионных, укажите в столбце «No Commission». Назовите столбец COMM.
SELECT LAST_NAME,
       NVL(TO_CHAR(COMMISSION_PCT, '999.99'), 'No Commission') AS COMM
FROM EMPLOYEES
WHERE ROWNUM <= 20;

-- 7. Используя функцию DECODE, напишите запрос для отображения должности сотрудника и её разряда (grade). Разряд каждого типа должности JOB_ID приведён в таблице.
SELECT JOB_ID    AS "Должность",
       DECODE(JOB_ID,
              'AD_PRES', 'A',
              'ST_MAN', 'B',
              'IT_PROG', 'C',
              'SA_REP', 'D',
              'ST_CLERK', 'E',
              0) AS "Разряд"
FROM JOBS
WHERE ROWNUM <= 20;

-- 8. Перепешите команду из предыдущего задания, используя синтаксис выражения CASE.
SELECT JOB_ID  AS "Должность",
       CASE JOB_ID
           WHEN 'AD_PRES' THEN 'A'
           WHEN 'ST_MAN' THEN 'B'
           WHEN 'IT_PROG' THEN 'C'
           WHEN 'SA_REP' THEN 'D'
           WHEN 'ST_CLERK' THEN 'E'
           ELSE '0'
           END AS "Разряд"
FROM JOBS
WHERE ROWNUM <= 20;

-- Лабораторная работа 5

-- 1.	Напишите запрос для вывода фамилии, номера отдела и названия отдела дл всех служащих.
SELECT e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e
         JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
         LEFT JOIN EMPLOYEES e2 ON e.EMPLOYEE_ID = e2.EMPLOYEE_ID
         JOIN EMPLOYEES e3 ON e.EMPLOYEE_ID = e3.EMPLOYEE_ID
WHERE ROWNUM <= 20
ORDER BY e.LAST_NAME;

-- 2. Выведите список всех должностей в отдел 80 (должности в списке не должны повторяться) и местоположение отдела.
SELECT DISTINCT j.JOB_ID, d.LOCATION_ID
FROM JOBS j
         JOIN EMPLOYEES e ON j.JOB_ID = e.JOB_ID
         LEFT JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_ID = 80;

-- 3. Напишите запрос для вывода фамилий, названия отдела, идентификатора местоположения отдела и города, в котором он находится, для всех служащих, зарабатывающих комиссионные.
SELECT e.LAST_NAME, d.DEPARTMENT_NAME, d.LOCATION_ID, l.CITY
FROM EMPLOYEES e
         JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
         JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID
WHERE e.JOB_ID IN (SELECT JOBS.JOB_ID FROM JOBS WHERE COMMISSION_PCT IS NOT NULL);

-- 4. Выведите фамилии всех служащих, содержащтих букву «а» (в строчном регистре), с названиями отделов. Сохраните свою команду SQL в файле lab4_4.sql.
SELECT e.LAST_NAME, d.DEPARTMENT_NAME
FROM EMPLOYEES e
         LEFt JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.LAST_NAME LIKE '%a%'
  AND ROWNUM <= 10
ORDER BY e.LAST_NAME;

-- 5. Напишите запрос для вывода фамилии, должности, номера отдела и названия отдела всех служащих, работающих в городе Toronto.
SELECT e.LAST_NAME, e.JOB_ID, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e
         JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
         JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID
WHERE l.CITY = 'Toronto';

-- 6. Выведите фамилии и номера всех служащих вместе с фамилиями и номерами их менеджеров. Назовите столбцы EMPLOYEE, Emp#, Manager и Mgr#. Сохраните свою команду SQL в файле lab4_6.sql.
SELECT e.LAST_NAME AS Employee, e.EMPLOYEE_ID AS Emp#, m.LAST_NAME AS Manager, m.EMPLOYEE_ID AS Mgr#
FROM EMPLOYEES e
         LEFT JOIN EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID;

-- 7. Измените файл lab4_6.sql так, чтобы получить фамилии всех служащих, включая Кинга, который не имеет менеджера. Упорядочьте результат по возрастанию номера служащего. Сохраните изменённый запрос в текстовом файле lab4_7.sql. Выполните запрос.
SELECT e.LAST_NAME AS Employee, e.EMPLOYEE_ID AS Emp#, m.LAST_NAME AS Manager, m.EMPLOYEE_ID AS Mgr#
FROM EMPLOYEES e
         LEFT JOIN EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
ORDER BY e.EMPLOYEE_ID ASC;

-- 8. Создайте запрос для вывода номера отдела, фамилии служащего и фамилий всех служащих, работающих в одном отделе с данным служащим. Дайте столбцам соответствующие имена.
select e.DEPARTMENT_ID DEPARTMENT, e.LAST_NAME EMPLOYEE, m.LAST_NAME AS COLLEAGUE
FROM EMPLOYEES e,
     EMPLOYEES m
WHERE e.EMPLOYEE_ID != m.EMPLOYEE_ID
  AND e.DEPARTMENT_ID = m.DEPARTMENT_ID;

-- 9. Покажите структуру таблицы JOB_GRADES. Создайте запрос для вывода фамилии, должности, названия отдела, оклада и категории (GRADE_LEVEL) всех служащих.
DESCRIBE JOB_GRADES;
--
SELECT e.LAST_NAME       AS "LAST_NAME",
       j.JOB_ID          AS "JOB_ID",
       d.DEPARTMENT_NAME AS "DEPARTMENT_NAME",
       e.SALARY          AS "SALARY",
       jg.GRADE_LEVEL    AS "GRA"
FROM EMPLOYEES e
         JOIN JOB_HISTORY jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
         JOIN JOBS j ON jh.JOB_ID = j.JOB_ID
         JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
         LEFT OUTER JOIN JOB_GRADES jg ON e.SALARY >= jg.LOWEST_SAL and e.SALARY <= jg.HIGHEST_SAL;

-- 10. Создайте запрос для вывода фамилий и дат найма всех служащих, нанятых после Davies.
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE EMPLOYEES.HIRE_DATE > (SELECT HIRE_DATE from EMPLOYEES where EMPLOYEES.LAST_NAME like 'Davies')
ORDER BY HIRE_DATE;

-- 11. По всем служащим нанятым раньше своих менеджеров, выведите фамилии и даты найма самих служащих, а также фамилии и даты найма их менеджеров. Назовите столбцы Employee, Emp, Manager и Manager Hired.
SELECT e.LAST_NAME Employee, e.HIRE_DATE "Emp Hired", m.LAST_NAME Manager, m.HIRE_DATE "Mgr hired"
FROM EMPLOYEES e
         LEFT OUTER JOIN EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
WHERE e.MANAGER_ID IS NOT NULL
  AND (e.HIRE_DATE) < (SELECT m.HIRE_DATE FROM EMPLOYEES m WHERE e.MANAGER_ID = m.EMPLOYEE_ID);

-- 12. Выведите номера, наименования и местоположение всех отделов, а также количество работающих в них сотрудников. Обеспечьте вывод отделов в которых нет сотрудников.
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID, COUNT(e.EMPLOYEE_ID) AS employee_count
FROM DEPARTMENTS d
         LEFT JOIN EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID
ORDER BY d.DEPARTMENT_ID;

-- 13. Какие должности имеются в отделах Administration и Executive, а также сколько сотрудников занимают эти должности? Выведите первыми наиболее часто встречаемые должности.
SELECT j.JOB_TITLE as JOB_ID, COUNT(*) AS FREQUENCY
FROM EMPLOYEES e
         JOIN JOBS j ON e.JOB_ID = j.JOB_ID
         JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME IN ('Administration', 'Executive')
GROUP BY JOB_TITLE, DEPARTMENT_NAME
ORDER BY COUNT(*) DESC, JOB_ID;

-- 14. Покажите сотрудников, менеджеры которых имеют оклад выше $15000. выведите следующие сведения: фамилию сотрудника, фамилию менеджера, его оклад и уровень оклада (GRADE_LEVEL).
SELECT e.LAST_NAME,
       m.LAST_NAME   AS MANAGER,
       m.SALARY      AS SALARY,
       j.GRADE_LEVEL AS GRA
FROM EMPLOYEES e
         JOIN EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
         JOIN JOB_GRADES j ON m.SALARY BETWEEN j.LOWEST_SAL AND j.HIGHEST_SAL
WHERE m.SALARY > 15000
ORDER BY SALARY DESC;

-- Лабораторная работа 6

-- 1. Напишите запрос для вывода самого высокого, самого низкого и среднего оклада по всем служащим, а также суммы всех окладов. Назовите столбцы Maximum, Minimum, Average и Sum. Округлите суммы до ближайшего целого значения. Сохраните свой запрос в файле lab5_6.sql.
SELECT ROUND(MAX(SALARY)) AS Maximum,
       ROUND(MIN(SALARY)) AS Minimum,
       ROUND(SUM(SALARY)) AS Sum,
       ROUND(AVG(SALARY)) AS Average
FROM EMPLOYEES

-- 2. Измените запрос в lab5_6.sql. так, чтобы получить самый низкий, самый высокий и средний оклады, а также сумму окладов по каждой должности. Сохраните изменённый запрос в файле lab5_5.sql. Выполните запрос из lab5_5.sql.
SELECT JOB_ID,
       ROUND(MAX(SALARY)) AS Maximum,
       ROUND(MIN(SALARY)) AS Minimum,
       ROUND(SUM(SALARY)) AS Sum,
       ROUND(AVG(SALARY)) AS Average
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 3. Напишите запрос для вывода должности и количества служащих, занимающих каждую должность.
SELECT JOB_ID,
       COUNT(JOB_ID)
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY JOB_ID ASC;

-- 4. Получите количество служащих, имеющих подчинённых, без их перечисления. Назовите столбец Number of Managers. Используйте столбец MANAGER_ID для определения числа менеджеров.
SELECT COUNT(DISTINCT MANAGER_ID) AS "Number of Managers"
FROM EMPLOYEES

-- 5. Напишите запрос для вывода разности между самым высоким и самым низким окладами. Назовите столбец DIFFERENCE
SELECT MAX(MAX_SALARY) - MIN(MIN_SALARY) AS "DIFFERENCE"
FROM JOBS

-- 6. Напишите запрос для вывода номера каждого менеджера, имеющего подчинённых, и заработную плату самого низкооплачиваемого из его подчинённых. Исключите менеджеров для которых неизвестны их менеджеры. Исключите все группы, где минимальный оклад составляет менее $6000. Отсортируйте выходные строки в порядке убывания оклада.
SELECT m.EMPLOYEE_ID AS manager_id,
       MIN(e.SALARY) AS min_salary
FROM EMPLOYEES e
         JOIN
     EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
WHERE m.MANAGER_ID IS NOT NULL
GROUP BY m.EMPLOYEE_ID
HAVING MIN(e.SALARY) >= 6000
ORDER BY min_salary DESC;

-- 7. Напишите запрос для вывода названия отдела, местоположения отдела, количества служащих и среднего оклада по этому отделу. Назовите столбцы Name, Location, Number of People и Salary. Округлите средний оклад до ближайшего целого значения.
SELECT d.DEPARTMENT_NAME    AS Name,
       d.LOCATION_ID        AS Location,
       COUNT(e.EMPLOYEE_ID) AS "Number of People",
       ROUND(AVG(e.SALARY)) AS Salary
FROM DEPARTMENTS d
         JOIN EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME, d.LOCATION_ID
ORDER BY Name;

-- 8. Напишите запрос для вывода общего количества служащих и количества служащих, нанятых в 1995, 1996, 1997 и 1998 годах. Дайте соответствующие заголовки столбцам.
SELECT COUNT(*)                                                 total
     , SUM(DECODE(TO_CHAR(HIRE_DATE, 'yyyy'), '1995', 1, 0)) AS "1995"
     , SUM(DECODE(TO_CHAR(HIRE_DATE, 'yyyy'), '1996', 1, 0)) AS "1996"
     , SUM(DECODE(TO_CHAR(HIRE_DATE, 'yyyy'), '1997', 1, 0)) AS "1997"
     , SUM(DECODE(TO_CHAR(HIRE_DATE, 'yyyy'), '1998', 1, 0)) AS "1998"
FROM EMPLOYEES;

-- 9. Напишите матричный запрос для вывода всех должностей и суммы заработной платы служащих, работающих в этой должности в отделах 20, 50, 80 и 90. Последний столбец должен содержать сумму заработной платы служащих этих отделов, занимающих каждую конкретную должность. Дайте столбцам соответствующие заголовки.
SELECT JOB_ID,
       SUM(DECODE(DEPARTMENT_ID, 20, SALARY, '')) Dept20,
       SUM(DECODE(DEPARTMENT_ID, 50, SALARY, '')) Dept50,
       SUM(DECODE(DEPARTMENT_ID, 80, SALARY, '')) Dept80,
       SUM(DECODE(DEPARTMENT_ID, 90, SALARY, '')) Dept90,
       SUM(SALARY)                                Total
from EMPLOYEES
GROUP BY JOB_ID
ORDER BY JOB_ID;

-- Лабораторная работа 7

-- 1. Создайте запрос для вывода фамилии и даты найма каждого служащего, работающего в одном отделе с Zlotkey. Исключите Zlotkey из выходных данных.
SELECT e.LAST_NAME, e.HIRE_DATE
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID = (SELECT ez.DEPARTMENT_ID
                         FROM EMPLOYEES ez
                         WHERE ez.LAST_NAME = 'Zlotkey')
  AND e.LAST_NAME != 'Zlotkey';

-- 2. Создайте запрос для вывода номеров и фамилий всех служащих, оклад которых выше среднего. Отсортируйте данные в порядке увеличения окладов.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
GROUP BY EMPLOYEE_ID, LAST_NAME, SALARY
HAVING (SELECT AVG(SALARY) FROM EMPLOYEES) < salary
ORDER BY SALARY ASC;

-- 3. Создайте запрос для вывода номеров и фамилий всех служащих, работающих в одном отделе с любым служащим, фамилия которого содержит букву «u». Сохраните свой запрос в тестовом файле lab6_3.sql. Выполните запрос.
SELECT e.EMPLOYEE_ID, e.LAST_NAME
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID IN (SELECT e1.DEPARTMENT_ID
                          FROM EMPLOYEES e1
                          WHERE e1.LAST_NAME LIKE '%u%')
ORDER BY e.EMPLOYEE_ID;

-- 4. Создайте запрос для вывода фамилии, номера отдела и должности каждого служащего, идентификатор местоположения отдела которого равен 1700.
SELECT e.LAST_NAME, e.DEPARTMENT_ID, e.JOB_ID
FROM EMPLOYEES e
         JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.LOCATION_ID = 1700;

-- 5. Получите список фамилий и окладов всех служащих, подчинённых Кингу.
SELECT e.LAST_NAME, e.SALARY
FROM EMPLOYEES e
WHERE e.MANAGER_ID = (SELECT EMPLOYEE_ID
                      FROM EMPLOYEES
                      WHERE LAST_NAME = 'King'
                        AND ROWNUM = 1);

-- 6. Получите номер отдела, фамилию и должность для каждого служащего, работающего в администрации (department_name = ‘Executive’).
SELECT e.DEPARTMENT_ID, e.LAST_NAME, e.JOB_ID
FROM EMPLOYEES e
         JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME = 'Executive';

-- 7. Измените lab6_3.sql для вывода номеров, фамилий и окладов всех служащих, которые работают в одном отделе с любым служащим с буквой «u» в фамилии и оклады которых превышают средний. Сохраните новый запрос в файле lab6_7.sql. Выполните его.
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.SALARY
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID IN (SELECT e1.DEPARTMENT_ID
                          FROM EMPLOYEES e1
                          WHERE e1.LAST_NAME LIKE '%u%')
  AND e.SALARY > (SELECT AVG(e2.SALARY)
                  FROM EMPLOYEES e2
                  WHERE e2.DEPARTMENT_ID = e.DEPARTMENT_ID)
ORDER BY e.EMPLOYEE_ID;

-- 8. Покажите номер отдела с наивысшей средней заработной платой и наименьший оклад работающего в нём сотрудника.
SELECT DEPARTMENT_ID, MIN(SALARY) AS "MIN(SALARY)"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM (SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY
                             FROM EMPLOYEES
                             GROUP BY DEPARTMENT_ID
                             ORDER BY AVG_SALARY DESC)
                       WHERE ROWNUM = 1)
GROUP BY DEPARTMENT_ID;

-- 9. Выведите номера , наименования и местоположения отделов, в которых не работают торговые представители (job_id = ‘SA_REP’).
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.MANAGER_ID, d.LOCATION_ID
FROM DEPARTMENTS d
WHERE d.DEPARTMENT_ID IN (SELECT m.DEPARTMENT_ID
                          FROM EMPLOYEES m
                          WHERE m.JOB_ID NOT LIKE 'SA_REP');

-- Лабораторная работа 8

-- 1. Используя оператор SET, выведите номера отделов (department_id), в которых нет служащих с идентификатором должности (job_id) ST_CLERK.
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
MINUS
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK';

-- 2. Используя оператор SET, выведите идентификаторы и наименования стран, в которых не располагаются отделы компании.
SELECT DISTINCT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID NOT IN (SELECT COUNTRY_ID
                         FROM COUNTRIES
                         MINUS
                         SELECT DISTINCT COUNTRY_ID
                         FROM LOCATIONS
                         WHERE LOCATION_ID IN (SELECT LOCATION_ID
                                               FROM DEPARTMENTS))

-- 3. Используя оператор SET, выведите список должностей отделов 10, 50 и 20 в таком же порядке отделов. Выведите столбцы job_id и department_id.
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEES.DEPARTMENT_ID IN (10, 50, 20)
ORDER BY CASE DEPARTMENT_ID
             WHEN 10 THEN 1
             WHEN 50 THEN 2
             WHEN 20 THEN 3
             END;

-- 4. Выведите номер сотрудника и идентификатор его должности, если его текущая должность совпадает с той, которую он уже занимал, работая в компании.
SELECT e.EMPLOYEE_ID, e.job_id
FROM JOB_HISTORY j,
     EMPLOYEES e
WHERE e.JOB_ID = j.JOB_ID
  AND e.EMPLOYEE_ID = j.EMPLOYEE_ID
UNION
SELECT j.EMPLOYEE_ID, j.job_id
FROM JOB_HISTORY j,
     EMPLOYEES e
WHERE e.JOB_ID = j.JOB_ID
  AND e.EMPLOYEE_ID = j.EMPLOYEE_ID

-- 5.	Напишите составной запрос, который выводит следующее:
-- •	Номера и отделы всех сотрудников из таблицы EMPLOYEES, независимо от того, относятся ли они к какому-то отделу или нет;
-- •	Номера и наименования всех отделов из таблицы DEPARTMENTS, независимо от того, есть ли в них сотрудники или нет.
SELECT EMPLOYEE_ID, DEPARTMENT_ID, NULL, NULL
FROM EMPLOYEES
UNION ALL
SELECT NULL, NULL, DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

-- Лабораторная работа 9