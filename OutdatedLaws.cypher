//OutdatedLaws
MATCH (l:Law)-[:IN_PREAMBLE]->(l2:Law)
WHERE l2.publicationDate < datetime("1960") 
WITH COLLECT(l.id) AS CitedBefore60s
MATCH (l:Law)-[:IN_PREAMBLE]->(l2:Law)
WHERE l2.publicationDate > datetime("1990") 
AND l.id IN CitedBefore60s
WITH COLLECT(l.id) AS StillCited, CitedBefore60s
UNWIND[x IN CitedBefore60s WHERE NOT ANY(z IN StillCited WHERE z CONTAINS x)] AS OutdatedLaws
RETURN OutdatedLaws