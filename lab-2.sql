-- Task 1
SELECT model, type, price FROM Printer
WHERE price < 300
ORDER BY type ASC;

-- Task 2
SELECT name FROM Battles
WHERE name LIKE '% %' AND name NOT LIKE '% %c';

-- Task 3
SELECT Classes.country, Ships.name 
FROM Classes 
JOIN Ships ON Classes.class = Ships.class;

-- Task 4
SELECT DISTINCT maker FROM Product 
WHERE type = 'PC' AND maker NOT IN(
SELECT maker FROM Product WHERE type = 'Laptop');

-- Task 5
SELECT Ships.name, Ships.launched, Classes.displacement
FROM Ships JOIN Classes ON Classes.class = Ships.class
WHERE launched > 1922 AND displacement > 35000;

-- Task 6
SELECT concat('model = ', pc.model) AS model,
concat('speed = ', speed) AS speed,
concat('ram = ', ram) AS ram,
concat('hd = ',  hd) AS hd,
concat('cd = ', cd) AS cd,
concat('price = ', price) AS price
FROM PC;

-- Task 7
SELECT country, battle, count(country) AS number_of_ships
FROM Ships
JOIN Classes ON Ships.class = Classes.class
JOIN Outcomes ON Ships.name = Outcomes.ship
GROUP BY battle, country
HAVING number_of_ships >= 2;

-- Task 8
SELECT maker, avg(screen) AS average_size
FROM Laptop
INNER JOIN Product ON
Laptop.model = Product.model
GROUP BY maker;

-- Task 9
SELECT Ships.name, numGuns, bore, 
displacement, type, country, 
Ships.launched, Ships.class
FROM Classes JOIN Ships ON Classes.class= Ships.class
WHERE
CASE WHEN numGuns = 9 THEN 1 ELSE 0 END + 
CASE WHEN bore = 16 THEN 1 ELSE 0 END +
CASE WHEN displacement = 46000 THEN 1 ELSE 0 END +
CASE WHEN type = 'bb' THEN 1 ELSE 0 END +
CASE WHEN country = 'Japan' THEN 1 ELSE 0 END +
CASE WHEN Ships.launched = 1916 THEN 1 ELSE 0 END +
CASE WHEN Ships.class = 'Revenge' THEN 1 ELSE 0 END >= 3;

-- Task 10
SELECT * 
FROM (
	SELECT name
    FROM Ships
    UNION
    SELECT ship as name 
    FROM Outcomes
    ) AS ships
WHERE name RLIKE '.+\\s.+\\s.+'












                  





