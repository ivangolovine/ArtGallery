/* Queries */

SELECT 'Average Price of Sculptures', AVG(Price)
FROM  artwork
WHERE TypeArt = 'Sculpture';

SELECT a.firstname, a.lastname FROM artist a, artwork w
WHERE a.firstname||' '||a.lastname = w.artist AND a.firstname LIKE 'S%' AND w.typeart = 'Painting'
UNION(SELECT artist.firstname, artist.lastname FROM artist
WHERE firstname LIKE 'P%');

SELECT * FROM artist a RIGHT JOIN artwork b ON a.firstname||' '||a.lastname = b.artist;

SELECT * FROM artist WHERE firstname LIKE 'S%';

SELECT ArtistID,Firstname, Lastname FROM artist WHERE firstname LIKE 'L%';  

SELECT DISTINCT MediumArt FROM artwork;

SELECT * FROM artwork RIGHT JOIN exhibition ON (Exhibition = Gallery_Title);

SELECT * FROM artwork where MediumArt ='Copper';

SELECT * FROM exhibition where (StartDate BETWEEN '2019-02-01'AND '2019-03-27');

SELECT * FROM customer WHERE Address LIKE '%Sesame%';

SELECT * FROM payment WHERE PaymentAmount <500 and PaymentAmount > 300;

Select w.nameart, w.artist, o.orderid, c.firstname
FROM art_order o
INNER JOIN artwork w ON o.artworkid = w.artworkid
LEFT JOIN customer c ON o.customerid = c.customerid
ORDER BY w.artist ASC;


