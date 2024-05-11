//LawsEnacted
MATCH (l:Law)
RETURN l.publicationDate.year AS Date, count(l) AS Num